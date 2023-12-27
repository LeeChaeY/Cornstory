package com.cornstory.controller.support;

import com.cornstory.common.Search;
import com.cornstory.domain.Support;
import com.cornstory.domain.User;
import com.cornstory.service.support.SupportService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.StandardOpenOption;
import java.util.Map;

@Controller
@RequestMapping("/support/*")
public class SupportController {

    @Autowired
    @Qualifier("supportServiceImpl")
    private SupportService supportService;

    @RequestMapping(value = "/addSupport", method = RequestMethod.GET)
    public String addSupport() throws Exception {
        System.out.println("support/addSupport : GET");
        return "support/addSupport";
    }

    @RequestMapping(value = "/addSupport", method = RequestMethod.POST)
    public String addSupport(@ModelAttribute("support") @Validated Support support, HttpServletRequest request,
                             @RequestParam("supfile") MultipartFile file, Model model, HttpSession session) throws Exception {
        System.out.println("support/add : POST");
        String userId = ((User) session.getAttribute("user")).getUserId();
        support.setUserId(userId);
        System.out.println("support/add" +support);

        int category = support.getSupCategory();
        String supContent = request.getParameter("supContent");

        System.out.println(support + "들어온 정보 확인 하기 ");

        String fileName = support.getSupContent() + "_support" ;
        fileName = fileName.replaceAll("[^a-zA-Z0-9가-힣_]", "_");
        fileName += ".jpg";

        if (!file.isEmpty()) {
            try {
                String uploadDir = request.getServletContext().getRealPath("")+"\\..\\resources\\static\\file\\support\\";
                String filePath = uploadDir + File.separator + fileName;


                Files.write(Path.of(filePath), file.getBytes(), StandardOpenOption.CREATE, StandardOpenOption.TRUNCATE_EXISTING);

                // 파일 경로를 Work 객체에 저장

                support.setSupImage(fileName);
            } catch (IOException e) {
                e.printStackTrace();
            }

        }else{
            support.setSupImage("support.jpg");

        }

        // 공통 처리
        supportService.addSupport(support);
        System.out.println("들어온 값을 확인해보자" + support);

        return "support/getSupport";
    }

    @RequestMapping( value="getSupport", method=RequestMethod.GET )
    public String getSupport(@RequestParam("supNo") int supNo , Model model ) throws Exception {

        System.out.println("support/getSupport : GET");
        //Business Logic
        Support support = supportService.getSupport(supNo);

        // Model 과 View 연결
        model.addAttribute("support", support);

        System.out.println("getSupport"+support);

        return "support/getSupport";
    }


    @RequestMapping(value = "listSupport")
    public String listSupport(@ModelAttribute("search") Search search, Model model) throws Exception {
        System.out.println("support/listSupport : GET / POST");

        // Business logic 수행
        Map<String, Object> map = supportService.listSupport(search);

        // Model 과 View 연결
        model.addAttribute("list", map.get("list"));
        model.addAttribute("totalCount",map.get("totalCount"));
        model.addAttribute("search", search);

        // 결과 확인
        System.out.println(search.toString());
        System.out.println("리스트 map를 출력해보자 :::::"+map);
        System.out.println("=================================");
        return "support/listSupport";
    }

    @RequestMapping( value="updateSupport", method=RequestMethod.GET )
    public String updateSupport(@RequestParam("supNo") int supNo , Model model ) throws Exception {

        System.out.println("support/updateSupport : GET");
        //Business Logic
        Support support = supportService.getSupport(supNo);

        // Model 과 View 연결
        model.addAttribute("support", support);

        System.out.println("getSupport"+support);

        return "forward:/support/updateSupport.jsp";
    }

    @RequestMapping(value = "/updateSupport", method = RequestMethod.POST)
    public String updateSupport(@ModelAttribute("support") @Validated Support support, HttpServletRequest request,
                             @RequestParam("supfile") MultipartFile file, Model model, HttpSession session) throws Exception {
        System.out.println("support/add : POST");
        String userId = ((User) session.getAttribute("user")).getUserId();
        support.setUserId(userId);
        System.out.println("support/add" +support);

        int category = support.getSupCategory();
        String supContent = request.getParameter("supContent");

        System.out.println(support + "들어온 정보 확인 하기 ");

        String fileName = support.getSupContent() + "_support" ;
        fileName = fileName.replaceAll("[^a-zA-Z0-9가-힣_]", "_");
        fileName += ".jpg";

        if (!file.isEmpty()) {
            try {
                String uploadDir = request.getServletContext().getRealPath("")+"\\..\\resources\\static\\file\\support\\";
                String filePath = uploadDir + File.separator + fileName;


                Files.write(Path.of(filePath), file.getBytes(), StandardOpenOption.CREATE, StandardOpenOption.TRUNCATE_EXISTING);

                // 파일 경로를 Work 객체에 저장

                support.setSupImage(fileName);
            } catch (IOException e) {
                e.printStackTrace();
            }

        }else{
            support.setSupImage("support.jpg");

        }

        // 공통 처리
        supportService.updateSupport(support);
        System.out.println("들어온 값을 확인해보자" + support);

        return "support/getSupport";
    }
}




