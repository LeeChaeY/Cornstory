package com.cornstory.restController.product;

import com.cornstory.service.product.ProductService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/product/*")
public class ProductRestController {
    @Autowired
    private ProductService productService;

    //    @Value("${pageUnit}")
    int pageUnit = 5;
    //    @Value("${pageSize}")
    int pageSize = 3;

    public ProductRestController() {
        System.out.println("ProductRestController 진입");
    }


    @GetMapping("json/deleteProduct")
    public String deleteProduct(@RequestParam("prodNo") int prodNo) throws Exception {
        System.out.println("/product/json/deleteProduct : GET :: prodNo :: "+prodNo);
        productService.deleteProduct(prodNo);

        return "삭제가 완료되었습니다.";
    }

    @GetMapping("json/prodNameCheck")
    public int prodNameCheck(@RequestParam("prodCnt") int prodCnt) throws Exception {
        System.out.println("/product/json/prodNameCheck : GET :: prodCnt :: "+prodCnt);

        return productService.prodNameCheck("팝콘 "+prodCnt+" 개");
    }


}
