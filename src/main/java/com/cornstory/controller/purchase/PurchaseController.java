package com.cornstory.controller.purchase;

import com.cornstory.service.purchase.PurchaseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/purchase")
public class PurchaseController {
    @Autowired
    private PurchaseService purchaseService;


    //    @Value("${pageUnit}")
    int pageUnit = 5;
    //    @Value("${pageSize}")
    int pageSize = 3;

    public PurchaseController() {
        System.out.println("PurchaseController 진입");
    }



}
