package com.cornstory.controller.product;

import com.cornstory.domain.Product;
import com.cornstory.service.product.ProductService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping("/product")
public class ProductController {
    @Autowired
    private ProductService productService;



    //    @Value("${pageUnit}")
    int pageUnit = 5;
    //    @Value("${pageSize}")
    int pageSize = 3;

    public ProductController() {
        System.out.println("ProductController 진입");
    }

    @GetMapping("addProduct")
    public String addProduct() throws Exception {
        System.out.println("/product/addProduct : GET");
        return "product/addProduct";
    }

    @PostMapping("addProduct")
    public String addProduct(Model model, @ModelAttribute("product") Product product,
                             @RequestParam("file") MultipartFile file, HttpServletRequest request,
                             HttpSession session) throws Exception {
        System.out.println("/product/addProduct : POST");
        return "product/addProduct";
    }

}
