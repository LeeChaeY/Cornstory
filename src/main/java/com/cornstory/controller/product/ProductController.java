package com.cornstory.controller.product;

import com.cornstory.domain.Product;
import com.cornstory.domain.User;
import com.cornstory.service.product.ProductService;
import com.cornstory.service.work.WorkService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.util.UUID;

@Controller
@RequestMapping("/product")
public class ProductController {
    @Autowired
    private ProductService productService;

    @Autowired
    private WorkService workService;



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

        String userId = ((User) session.getAttribute("user")).getUserId();
        product.setUserId(userId);
        System.out.println("/product/addProduct : " + product);

        // https://action713.tistory.com/entry/%EC%8A%A4%ED%94%84%EB%A7%81-%ED%8C%8C%EC%9D%BC-%EA%B2%BD%EB%A1%9C
        String uploadDir = request.getServletContext().getRealPath("")+"\\..\\resources\\static\\file\\chat\\";
        // request.getServletContext().getRealPath(""): webapp 상대 경로

        if (!file.isEmpty()) {
            try {
                // uuid 생성
                UUID uuid = UUID.randomUUID();
                System.out.println(file.getOriginalFilename());

                //savedName 변수에 uuid + 원래 이름 추가
                String savedName = uuid + "_" + file.getOriginalFilename();
                File uploadFile = new File(uploadDir, savedName);
                file.transferTo(uploadFile);
                product.setProdImage(savedName);

            } catch (Exception e) {
                e.printStackTrace();
                // 파일 업로드 실패 처리
                System.out.println("<scrpt>alert('파일의 크기는 10MB까지 입니다.");
            }
        } else {
            // 업로드된 파일이 없는 경우 처리
            if (product.getProdCategory() == 0) {
                product.setProdImage("popcorn.png");
            } else {
                product.setProdImage(workService.getWork(product.getWorkNo()).getThumbnail());
            }
        }
        if (product.getProdCategory() == 0) {

        }
        if (product.getProdCategory() == 1)
            product.setEpisodeOrder(product.getEpisodeOrder());

        return "product/addProduct";
    }

}
