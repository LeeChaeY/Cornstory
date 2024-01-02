package com.cornstory.restController.support;

import com.cornstory.domain.Support;
import com.cornstory.service.support.SupportService;

import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/support/*")
public class SupportRestController {

    @Autowired
    @Qualifier("supportServiceImpl")
    private SupportService supportService;

    public SupportRestController(){System.out.println("SupportRestController 진입");}

    @RequestMapping(value = "json/deleteSupport", method = RequestMethod.GET)
    public String deleteSupport(@RequestParam("supNo") int supNo, HttpServletResponse response, HttpSession session) {
            System.out.println("supNo는 왜 안들어 올까?"+supNo);
        try {
            supportService.deleteSupport(supNo);
            response.setStatus(HttpServletResponse.SC_OK); // 200 OK
            System.out.println("200"+response);
            return "valid"; // 삭제 성공을 클라이언트에게 알림
        } catch (Exception e) {
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            return "invalid"; // 삭제 실패를 클라이언트에게 알림
        }

    }

    @RequestMapping( value="json/getSupport/{supNo}", method=RequestMethod.GET )
    public Support getSupport(@RequestParam("supNo") int supNo , Model model ) throws Exception {

        System.out.println("support/json/getSupport : GET");
        //Business Logic
        Support support = supportService.getSupport(supNo);

        // Model 과 View 연결
        model.addAttribute("support", support);

        System.out.println("getSupport"+support);

        return supportService.getSupport(supNo);
    }

    @RequestMapping( value="json/updateSupport/{supNo}", method=RequestMethod.GET )
    public Support updateSupport(@RequestParam("supNo") int supNo , Model model ) throws Exception {

        System.out.println("support/json/getSupport : GET");
        //Business Logic
        Support support = supportService.getSupport(supNo);

        // Model 과 View 연결
        model.addAttribute("support", support);

        System.out.println("getSupport"+support);

        return supportService.getSupport(supNo);
    }

}
