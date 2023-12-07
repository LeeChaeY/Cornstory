//package com.cornstory.controller.product;
//
//import com.cornstory.domain.Episode;
//import com.cornstory.domain.Product;
//import com.cornstory.domain.User;
//import com.cornstory.domain.Work;
//import com.cornstory.service.episode.EpisodeService;
//import com.cornstory.service.product.ProductService;
//import com.cornstory.service.work.WorkService;
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpSession;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.*;
//import org.springframework.web.multipart.MultipartFile;
//
//import java.io.File;
//import java.util.UUID;
//
//@Controller
//@RequestMapping("/product")
//public class ProductController {
//    @Autowired
//    private ProductService productService;
//
//    @Autowired
//    private WorkService workService;
//
//    @Autowired
//    private EpisodeService episodeService;
//
//
//
//    //    @Value("${pageUnit}")
//    int pageUnit = 5;
//    //    @Value("${pageSize}")
//    int pageSize = 3;
//
//    public ProductController() {
//        System.out.println("ProductController 진입");
//    }
//
//    @GetMapping("addProduct")
//    public String addProduct() throws Exception {
//        System.out.println("/product/addProduct : GET");
//        return "product/addProduct";
//    }
//
//    @PostMapping("addProduct")
//    public String addProduct(Model model, @ModelAttribute("product") Product product,
//                             @RequestParam("file") MultipartFile file, HttpServletRequest request,
//                             HttpSession session) throws Exception {
//        System.out.println("/product/addProduct : POST");
//        String userId = ((User) session.getAttribute("user")).getUserId();
//        product.setUserId(userId);
//
//        Work work = null;
//        Episode episode = null;
//
//        if (product.getProdCategory() != 0) {
//            work = workService.getWork(product.getWorkNo());
//            product.setProdImage(work.getThumbnail());
//            if (work.getCategory() == 2) product.setProdPrice(work.getCategory()+3);
//            else product.setProdPrice(work.getCategory()+2);
//            product.setProdCnt(1);
//        }
//
//        if (product.getProdCategory() == 0) {
//            product.setProdName("팝콘 "+product.getProdCnt()+" 개");
//        }
//        else if (product.getProdCategory() == 1) {
//            episode = episodeService.getEpisode(product.getEpisodeNo());
//            product.setEpisodeOrder(episode.getEpisodeOrder());
//            product.setProdName(work.getWorkName()+" "+episode.getEpisodeOrder()+" 회차");
//        } else if (product.getProdCategory() == 2) {
//            product.setProdName(work.getWorkName()+" 저작권");
//        }
//        System.out.println("/product/addProduct : " + product);
//
//
//        // https://action713.tistory.com/entry/%EC%8A%A4%ED%94%84%EB%A7%81-%ED%8C%8C%EC%9D%BC-%EA%B2%BD%EB%A1%9C
//        String uploadDir = request.getServletContext().getRealPath("")+"\\..\\resources\\static\\file\\chat\\";
//        // request.getServletContext().getRealPath(""): webapp 상대 경로
//
//        if (product.getProdCategory() == 0) {
//            if (!file.isEmpty()) {
//                try {
//                    // uuid 생성
//                    UUID uuid = UUID.randomUUID();
//                    System.out.println(file.getOriginalFilename());
//
//                    //savedName 변수에 uuid + 원래 이름 추가
//                    String savedName = uuid + "_" + file.getOriginalFilename();
//                    File uploadFile = new File(uploadDir, savedName);
//                    file.transferTo(uploadFile);
//                    product.setProdImage(savedName);
//
//                } catch (Exception e) {
//                    e.printStackTrace();
//                    // 파일 업로드 실패 처리
//                    System.out.println("<scrpt>alert('파일의 크기는 10MB까지 입니다.");
//                }
//            } else {
//                // 업로드된 파일이 없는 경우 처리
//                product.setProdImage("popcorn.png");
//            }
//        }
//        return "product/addProduct";
//    }
//
//    @GetMapping("updateProduct")
//    public String updateProduct(Model model, @RequestParam("prodNo") int prodNo) throws Exception {
//        Product product = productService.getProduct(prodNo);
//
//        System.out.println("/product/updateProduct : GET :: " + product);
//        model.addAttribute("product", product);
//
//        return "product/updateProduct";
//    }
//
//    @GetMapping("updateProduct")
//    public String updateProduct(Model model, @ModelAttribute("product") Product product,
//                                @RequestParam("file") MultipartFile file, HttpServletRequest request,
//                                HttpSession session) throws Exception {
//        System.out.println("/product/updateProduct : POST");
//
//        String userId = ((User) session.getAttribute("user")).getUserId();
//        product.setUserId(userId);
//
//
//        // https://action713.tistory.com/entry/%EC%8A%A4%ED%94%84%EB%A7%81-%ED%8C%8C%EC%9D%BC-%EA%B2%BD%EB%A1%9C
//        String uploadDir = request.getServletContext().getRealPath("")+"\\..\\resources\\static\\file\\chat\\";
//        // request.getServletContext().getRealPath(""): webapp 상대 경로
//        if (product.getProdCategory() == 0) {
//            if (!file.isEmpty()) {
//                try {
//                    // 기존 파일 삭제
//                    String deleteImg = productService.getProduct(product.getProdNo()).getProdImage();
//                    String deleteDir = uploadDir + File.separator + deleteImg;
//                    File fileToDelete = new File(deleteDir);
//
//                    // 파일을 삭제합니다.
//                    if (fileToDelete.exists()) {
//                        if (fileToDelete.delete()) {
//                            System.out.println("파일이 성공적으로 삭제되었습니다.");
//                        } else {
//                            System.out.println("파일을 삭제하는 데 문제가 발생했습니다.");
//                        }
//                    }
//
//                    // uuid 생성
//                    UUID uuid = UUID.randomUUID();
//                    System.out.println(file.getOriginalFilename());
//
//                    //savedName 변수에 uuid + 원래 이름 추가
//                    String savedName = uuid + "_" + file.getOriginalFilename();
//                    File uploadFile = new File(uploadDir, savedName);
//                    file.transferTo(uploadFile);
//                    product.setProdImage(savedName);
//
//                } catch (Exception e) {
//                    e.printStackTrace();
//                    // 파일 업로드 실패 처리
//                    System.out.println("<scrpt>alert('파일의 크기는 10MB까지 입니다.");
//                }
//            } else {
//                // 업로드된 파일이 없는 경우 처리
//                product.setProdImage("");
//            }
//        }
//
//        return "product/updateProduct";
//    }
//
//    @RequestMapping("listProduct")
//    public String listProduct(Model model, @ModelAttribute("search") Search search) throws Exception {
//        System.out.println("/product/listProduct : GET / POST");
//        if (search.getCurrentPage() == 0) {
//            search.setCurrentPage(1);
//        }
//        search.setPageSize(pageSize);
//
//        Map<String, Object> map = productService.listProduct(search);
//        Page resultPage = new Page(search.getCurrentPage(), ((Integer) map.get("totalCount")).intValue(), pageUnit, pageSize);
//
//        model.addAttribute("list", map.get("list"));
//    }
//
//
//}
