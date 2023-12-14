package com.cornstory.restController.product;

import com.cornstory.domain.Product;
import com.cornstory.service.product.ProductService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.io.File;

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
    public String deleteProduct(@RequestParam("prodNo") int prodNo, HttpServletRequest request) throws Exception {
        System.out.println("/product/json/deleteProduct : GET :: prodNo :: "+prodNo);

        // https://action713.tistory.com/entry/%EC%8A%A4%ED%94%84%EB%A7%81-%ED%8C%8C%EC%9D%BC-%EA%B2%BD%EB%A1%9C
        String uploadDir = request.getServletContext().getRealPath("")+"\\..\\resources\\static\\file\\product\\";
        // request.getServletContext().getRealPath(""): webapp 상대 경로
        Product product = productService.getProduct(prodNo);

        // 기존 파일 삭제
        String deleteImg = product.getProdImage();
        if (product.getProdCategory() == 0 && !deleteImg.equals("popcorn.jpg")) {
            try {
                String deleteDir = uploadDir + File.separator + deleteImg;
                File fileToDelete = new File(deleteDir);

                // 파일을 삭제합니다.
                if (fileToDelete.exists()) {
                    if (fileToDelete.delete()) {
                        System.out.println("파일이 성공적으로 삭제되었습니다.");
                    } else {
                        System.out.println("파일을 삭제하는 데 문제가 발생했습니다.");
                    }
                }
            } catch(Exception e){
                e.printStackTrace();
                // 파일 업로드 실패 처리
                System.out.println("파일 삭제 실패");
            }
        }

        productService.deleteProduct(prodNo);

        return "삭제가 완료되었습니다.";
    }

    @GetMapping("json/prodNameCheck")
    public int prodNameCheck(@RequestParam("prodCnt") int prodCnt) throws Exception {
        System.out.println("/product/json/prodNameCheck : GET :: prodCnt :: "+prodCnt);

        return productService.prodNameCheck(prodCnt);
    }


}
