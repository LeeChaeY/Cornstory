package com.cornstory.controller.purchase;

import com.cornstory.common.Search;
import com.cornstory.domain.*;
import com.cornstory.service.product.ProductService;
import com.cornstory.service.purchase.PurchaseService;
import com.cornstory.service.user.UserService;
import com.cornstory.service.work.WorkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.client.RestTemplate;

import java.util.HashMap;
import java.util.List;
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
    int pageSize = 100;

    public PurchaseController() {
        System.out.println("PurchaseController 진입");
    }


    // 결제승인요청
//    @GetMapping("/kakaopayCompleted")
//    public String kakaopayCompleted(@SessionAttribute("user") User user, @RequestParam("pg_token") String pgToken,
//                               @SessionAttribute("tid") String tid, @RequestParam("orderId") String orderId,
//                               @RequestParam("prodNo") int prodNo, @RequestParam("tranCnt") int tranCnt) throws Exception{
//
//        System.out.println("/purchase/kakaopayCompleted : GET :: pgToken = " + pgToken + ", tid = " + tid + ", orderId = " + orderId + ", prodNo = " + prodNo + ", tranCnt = " + tranCnt);
//
//        // 카카오 결재 요청하기
//        MultiValueMap<String, String> parameters = new LinkedMultiValueMap<String, String>();
//        parameters.add("cid", "TC0ONETIME");
//        parameters.add("tid", tid);
//        parameters.add("partner_order_id", orderId);
//        parameters.add("partner_user_id", user.getUserId());
//        parameters.add("pg_token", pgToken);
//
//        MultiValueMap<String, String> headers = new LinkedMultiValueMap<String, String>();
//        headers.add("Authorization", "KakaoAK 34178778d3ef4a8aad68e39b028d4864");
//        headers.add("Content-Type", "application/x-www-form-urlencoded;charset=utf-8");
//
//        HttpEntity<MultiValueMap<String, String>> requestEntity = new HttpEntity<>(parameters, headers);
//
//        // 외부url요청 통로 열기.
//        RestTemplate template = new RestTemplate();
//        String url = "https://kapi.kakao.com/v1/payment/approve";
//        // template으로 값을 보내고 받아온 ReadyResponse값 readyResponse에 저장.
//        ApproveResponse approveResponse = template.postForObject(url, requestEntity, ApproveResponse.class);
//        System.out.println("approveResponse : " + approveResponse.toString());
//
//        return "redirect:/purchase/addPurchase?prodNo=" + prodNo + "&tranCnt=" + tranCnt + "&tranMethod=1";
//    }

    @GetMapping("addPurchase")
    public String addPurchase(@RequestParam(value = "episodeNo", required = false, defaultValue = "0") int episodeNo,
                              @RequestParam(value = "prodNo", required = false, defaultValue = "0") int prodNo,
                              @RequestParam(name="tranCnt", required = false, defaultValue="1") int tranCnt,
                              @RequestParam(name="tranMethod", required = false, defaultValue="팝콘") String tranMethod,
                              @RequestParam(name="cardName", required = false) String cardName, @SessionAttribute("user") User user) throws Exception {
        System.out.println("/purchase/json/addPurchase : GET :: prodNo = " + prodNo + ", tranCnt = " + tranCnt);
        System.out.println("/purchase/json/addPurchase : GET :: tranMethod = " + tranMethod);

        Product product = null;
        if (episodeNo != 0) {
            product = productService.getProductByEpisodeNo(episodeNo);
            prodNo = product.getProdNo();
        }
        if (prodNo != 0) {
            product = productService.getProduct(prodNo);
        }

        Purchase purchase = new Purchase();
        purchase.setProdNo(prodNo);
        purchase.setTranCnt(tranCnt);
        purchase.setSellerId(product.getUserId());
        purchase.setBuyerId(user.getUserId());
        purchase.setTranCategory(product.getProdCategory());
        if (product.getProdCategory() == 0) {
            switch (tranMethod) {
                case "naverpay" -> tranMethod = "네이버페이";
                case "kakopay" -> tranMethod = "카카오페이";
                case "payco" -> tranMethod = "페이코";
                case "samsungpay" -> tranMethod = "삼성페이";
                case "ssgpay" -> tranMethod = "SSG페이";
                case "lpay" -> tranMethod = "L페이";
                case "applepay" -> tranMethod = "애플페이";
                case "tosspay", "toss_brandpay" -> tranMethod = "토스페이";
            }
            purchase.setTranMethod(tranMethod);
            purchase.setAfPopcornCnt(user.getPopcornCnt() + product.getProdCnt() * tranCnt);
        } else {
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
        if (product.getProdCategory() == 1) {
            return "redirect:/episode/getEpisode?episodeNo=" + episodeNo;
        } else {
            return "redirect:/purchase/listPurchase?tranCategory=" + product.getProdCategory();
        }
    }

    @RequestMapping("listPurchase")
    public String listPurchase(Model model, @ModelAttribute("search") Search search,
                               @SessionAttribute("user") User user,
                               @RequestParam(name="tranCategory", defaultValue="0") int tranCategory) throws Exception {
        System.out.println("/purchase/listPurchase : GET/POST :: search = " + search);
        System.out.println("/purchase/listPurchase : GET/POST :: tranCategory = " + tranCategory);

        if (search.getCurrentPage() == 0) {
            search.setCurrentPage(1);
        }
        search.setPageSize(pageSize);

        Map<String, Object> map = purchaseService.listPurchase(search, user.getUserId(), user.getRole(), tranCategory);

        model.addAttribute("totalCount", map.get("totalCount"));
        model.addAttribute("list", map.get("list"));
        model.addAttribute("search", search);
        model.addAttribute("userId", user.getUserId());
        model.addAttribute("tranCategory", tranCategory);

        System.out.println(map);
        System.out.println(search);
        if (tranCategory == 0) {
            return "purchase/listPopcornPurchase";
        } else {
            return "purchase/listPurchase";
        }
    }

    @RequestMapping("listSale")
    public String listSale(Model model, @ModelAttribute("search") Search search,
                               @SessionAttribute("user") User user) throws Exception {
        System.out.println("/purchase/listSale : GET/POST :: search = " + search);

        if (search.getCurrentPage() == 0) {
            search.setCurrentPage(1);
        }
        search.setPageSize(pageSize);

        Map<String, Object> map = purchaseService.countWorkTotalPopcorn(search, user.getUserId(), user.getRole());

        model.addAttribute("workList", map.get("workList"));
        model.addAttribute("totalCount", map.get("totalCount"));
        model.addAttribute("search", search);
        model.addAttribute("userId", user.getUserId());

        System.out.println(map);
        System.out.println(search);

        return "purchase/listSale";
    }

    @PostMapping("listTotalSale")
    public String listTotalSale(Model model, @RequestParam(name="condition", defaultValue="0") int condition) throws Exception {
        System.out.println("/purchase/listTotalSale : GET :: condition = " + condition);

        Map<String, Object> map = purchaseService.listTotalSale(condition);

        model.addAttribute("list", map.get("list"));
        model.addAttribute("totalCount", map.get("totalCount"));
        model.addAttribute("condition", condition);

        System.out.println(map);

        return "purchase/listTotalSale";
    }

}
