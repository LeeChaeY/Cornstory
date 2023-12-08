package com.cornstory.restController.purchase;


import com.cornstory.domain.Product;
import com.cornstory.domain.Purchase;
import com.cornstory.domain.User;
import com.cornstory.service.product.ProductService;
import com.cornstory.service.purchase.PurchaseService;
import com.cornstory.service.user.UserService;
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

    //    @Value("${pageUnit}")
    int pageUnit = 5;
    //    @Value("${pageSize}")
    int pageSize = 3;

    public PurchaseRestController() { System.out.println("PurchaseRestController 진입"); }

    @GetMapping("json/addPurchase")
    public String addPurchase(@RequestParam("prodNo") int prodNo, @RequestParam("tranCnt") int tranCnt,
                              HttpSession session) throws Exception {
        System.out.println("/purchase/json/addPurchase : GET :: prodNo = " + prodNo + ", tranCnt = " + tranCnt);

        User user = (User) session.getAttribute("user");
        Product product = productService.getProduct(prodNo);

        Purchase purchase = new Purchase();
        purchase.setProdNo(prodNo);
        purchase.setTranCnt(tranCnt);
        purchase.setSellerId(product.getUserId());
        purchase.setBuyerId(user.getUserId());
        purchase.setTranCategory(product.getProdCategory());
        purchase.setTranMethod(0);
        purchase.setBfPopcornCnt(user.getPopcornCnt());
        purchase.setAfPopcornCnt(user.getPopcornCnt() - product.getProdPrice() * tranCnt);
        purchase.setEpisodeOrder(product.getEpisodeOrder());
        purchase.setProdPrice(product.getProdPrice());


        purchaseService.addPurchase(purchase);

        return "purchase/addPurchase";
    }
}
