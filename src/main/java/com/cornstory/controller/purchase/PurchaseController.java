package com.cornstory.controller.purchase;

import com.cornstory.domain.*;
import com.cornstory.service.product.ProductService;
import com.cornstory.service.purchase.PurchaseService;
import com.cornstory.service.user.UserService;
import com.cornstory.service.work.WorkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.client.RestTemplate;

import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/purchase")
@SessionAttributes({"tid"})
public class PurchaseController {
    @Autowired
    private PurchaseService purchaseService;

    @Autowired
    private ProductService productService;

    @Autowired
    private WorkService workService;

    @Autowired
    private UserService userService;


    //    @Value("${pageUnit}")
    int pageUnit = 5;
    //    @Value("${pageSize}")
    int pageSize = 3;

    public PurchaseController() {
        System.out.println("PurchaseController 진입");
    }


    // 결제승인요청
    @GetMapping("/kakaopayCompleted")
    public String kakaopayCompleted(@SessionAttribute("user") User user, @RequestParam("pg_token") String pgToken,
                               @SessionAttribute("tid") String tid, @RequestParam("orderId") String orderId,
                               @RequestParam("prodNo") int prodNo, @RequestParam("tranCnt") int tranCnt) throws Exception{

        System.out.println("/purchase/kakaopayCompleted : GET :: pgToken = " + pgToken + ", tid = " + tid + ", orderId = " + orderId + ", prodNo = " + prodNo + ", tranCnt = " + tranCnt);

        // 카카오 결재 요청하기
        MultiValueMap<String, String> parameters = new LinkedMultiValueMap<String, String>();
        parameters.add("cid", "TC0ONETIME");
        parameters.add("tid", tid);
        parameters.add("partner_order_id", orderId);
        parameters.add("partner_user_id", user.getUserId());
        parameters.add("pg_token", pgToken);

        MultiValueMap<String, String> headers = new LinkedMultiValueMap<String, String>();
        headers.add("Authorization", "KakaoAK 34178778d3ef4a8aad68e39b028d4864");
        headers.add("Content-Type", "application/x-www-form-urlencoded;charset=utf-8");

        HttpEntity<MultiValueMap<String, String>> requestEntity = new HttpEntity<>(parameters, headers);

        // 외부url요청 통로 열기.
        RestTemplate template = new RestTemplate();
        String url = "https://kapi.kakao.com/v1/payment/approve";
        // template으로 값을 보내고 받아온 ReadyResponse값 readyResponse에 저장.
        ApproveResponse approveResponse = template.postForObject(url, requestEntity, ApproveResponse.class);
        System.out.println("approveResponse : " + approveResponse.toString());

        return "redirect:/purchase/addPurchase?prodNo=" + prodNo + "&tranCnt=" + tranCnt + "&tranMethod=1";
    }

    @GetMapping("addPurchase")
    public String addPurchase(@RequestParam("prodNo") int prodNo, @RequestParam("tranCnt") int tranCnt,
                              @RequestParam("tranMethod") int tranMethod, @SessionAttribute("user") User user) throws Exception {
        System.out.println("/purchase/json/addPurchase : GET :: prodNo = " + prodNo + ", tranCnt = " + tranCnt);

        Product product = productService.getProduct(prodNo);

        Purchase purchase = new Purchase();
        purchase.setProdNo(prodNo);
        purchase.setTranCnt(tranCnt);
        purchase.setSellerId(product.getUserId());
        purchase.setBuyerId(user.getUserId());
        purchase.setTranCategory(product.getProdCategory());
        if (product.getProdCategory() == 0) {
            purchase.setTranMethod(tranMethod);
            purchase.setAfPopcornCnt(user.getPopcornCnt() + product.getProdCnt() * tranCnt);
        } else {
            purchase.setTranMethod(0);
            purchase.setAfPopcornCnt(user.getPopcornCnt() - product.getProdPrice() * tranCnt);

            Work work = workService.getWork(product.getWorkNo());
            purchase.setEpisodeOrder(product.getEpisodeOrder());
            purchase.setCategory(work.getCategory());
            purchase.setWorkName(work.getWorkName());
        }
        purchase.setBfPopcornCnt(user.getPopcornCnt());
        purchase.setProdPrice(product.getProdPrice());
        purchase.setNickname(user.getNickName());

        purchaseService.addPurchase(purchase);

        if (product.getProdCategory() == 0) {
            user.setPopcornCnt(user.getPopcornCnt() + product.getProdCnt() * tranCnt);
        } else {
            user.setPopcornCnt(user.getPopcornCnt() - product.getProdPrice() * tranCnt);
        }
        Map map = new HashMap();
        map.put("userId", user.getUserId());
        map.put("popcornCnt", user.getPopcornCnt());
        userService.updateUserPopcornCnt(map);

        return "redirect:/product/listProduct";
    }

}
