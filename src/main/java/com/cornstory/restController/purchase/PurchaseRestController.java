package com.cornstory.restController.purchase;


import com.cornstory.domain.Product;
import com.cornstory.domain.Purchase;
import com.cornstory.domain.User;
import com.cornstory.domain.Work;
import com.cornstory.service.product.ProductService;
import com.cornstory.service.purchase.PurchaseService;
import com.cornstory.service.user.UserService;
import com.cornstory.service.work.WorkService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

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

    @GetMapping("json/addPurchase")
    public String addPurchase(@RequestParam("prodNo") int prodNo, @RequestParam("tranCnt") int tranCnt,
                              HttpSession session) throws Exception {
        System.out.println("/purchase/json/addPurchase : GET :: prodNo = " + prodNo + ", tranCnt = " + tranCnt);

        User user = userService.getUser(((User)session.getAttribute("user")).getUserId());
        Product product = productService.getProduct(prodNo);

        Purchase purchase = new Purchase();
        purchase.setProdNo(prodNo);
        purchase.setTranCnt(tranCnt);
        purchase.setSellerId(product.getUserId());
        purchase.setBuyerId(user.getUserId());
        purchase.setTranCategory(product.getProdCategory());
        if (product.getProdCategory() == 0) {
            purchase.setTranMethod(0);
            purchase.setAfPopcornCnt(user.getPopcornCnt() + product.getProdPrice() * tranCnt);
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

        return "구매가 완료되었습니다.";
    }

    @GetMapping("json/deletePurchase")
    public String deletePurchase(@RequestParam("tranNo") int tranNo) throws Exception {
        System.out.println("/purchase/json/deletePurchase : GET :: tranNo = " + tranNo);

        purchaseService.deletePurchase(tranNo);

        return "삭제가 완료되었습니다.";
    }
}
