package com.cornstory.restController.purchase;


import com.cornstory.common.Search;
import com.cornstory.domain.*;
import com.cornstory.service.product.ProductService;
import com.cornstory.service.purchase.PurchaseService;
import com.cornstory.service.user.UserService;
import com.cornstory.service.work.WorkService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.client.RestTemplate;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Map;

@RestController
@RequestMapping("/purchase/*")
public class PurchaseRestController {
    @Autowired
    private PurchaseService purchaseService;

    @Autowired
    private ProductService productService;

    @Autowired
    private UserService userService;

    @Autowired
    private WorkService workService;


    //    @Value("${pageUnit}")
    int pageUnit = 5;
    //    @Value("${pageSize}")
    int pageSize = 3;

    public PurchaseRestController() { System.out.println("PurchaseRestController 진입"); }


    @GetMapping("json/kakaopayReady")
    @ResponseBody
    public ReadyResponse kakaopayReady(@SessionAttribute("user") User user,
                                       @RequestParam("prodNo") int prodNo, @RequestParam("tranCnt") int tranCnt,
                                       Model model, HttpSession session) throws Exception {
        System.out.println("/purchase/json/kakaopay : GET :: prodNo = " + prodNo + ", tranCnt = " + tranCnt);
        Product product = productService.getProduct(prodNo);

        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd-HH-mm");
        String orderId = prodNo + "_" + user.getUserId() + "_" + dateFormat.format(new Timestamp(System.currentTimeMillis()));
        String approval_url = "http://localhost:8088/purchase/kakaopayCompleted?orderId=" + orderId + "&prodNo=" + prodNo + "&tranCnt=" + tranCnt;

        // 카카오가 요구한 결제요청request값을 담아줍니다.
        MultiValueMap<String, String> parameters = new LinkedMultiValueMap<String, String>();
        parameters.add("cid", "TC0ONETIME");
        parameters.add("partner_order_id", orderId);
        parameters.add("partner_user_id", user.getUserId());
        parameters.add("item_name", product.getProdName());
        parameters.add("quantity", String.valueOf(tranCnt));
        parameters.add("total_amount", String.valueOf(product.getProdPrice() * tranCnt));
        parameters.add("tax_free_amount", "0");
        parameters.add("approval_url", approval_url); // 결제승인시 넘어갈 url
        parameters.add("cancel_url", "http://localhost:8088/product/listProduct"); // 결제취소시 넘어갈 url
        parameters.add("fail_url", "http://localhost:8088/product/listProduct"); // 결제 실패시 넘어갈 url

        MultiValueMap<String, String> headers = new LinkedMultiValueMap<String, String>();
        headers.add("Authorization", "KakaoAK 34178778d3ef4a8aad68e39b028d4864");
        headers.add("Content-Type", "application/x-www-form-urlencoded;charset=utf-8");

        HttpEntity<MultiValueMap<String, String>> requestEntity = new HttpEntity<>(parameters, headers);

        // 외부url요청 통로 열기.
        RestTemplate template = new RestTemplate();
        String url = "https://kapi.kakao.com/v1/payment/ready";
        // template으로 값을 보내고 받아온 ReadyResponse값 readyResponse에 저장.
        ReadyResponse readyResponse = template.postForObject(url, requestEntity, ReadyResponse.class);
        System.out.println("readyResponse : " + readyResponse.toString());

        model.addAttribute("tid", readyResponse.getTid());
        session.setAttribute("tid", readyResponse.getTid());
        model.addAttribute("orderId", orderId);
        model.addAttribute("prodNo", prodNo);
        model.addAttribute("tranCnt", tranCnt);

        // Order정보를 모델에 저장
//        model.addAttribute("order",order);

        // 받아온 값 return
        return readyResponse;
    }

    @GetMapping("json/deletePurchase")
    public String deletePurchase(@RequestParam("tranNo") int tranNo) throws Exception {
        System.out.println("/purchase/json/deletePurchase : GET :: tranNo = " + tranNo);

        purchaseService.deletePurchase(tranNo);

        return "삭제가 완료되었습니다.";
    }
}
