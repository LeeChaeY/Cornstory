package com.cornstory.controller.support;

import com.cornstory.common.Search;
import com.cornstory.domain.Support;
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
import org.springframework.web.multipart.MultipartHttpServletRequest;

import java.io.File;
import java.util.List;
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
    public String addSupport(@ModelAttribute Support support,
                             @RequestParam(name = "supImage", required = false) MultipartFile supImage,
                             Model model, HttpServletRequest request, HttpSession session) throws Exception {
        System.out.println("support/add : POST");
        String userId = ((User) session.getAttribute("user")).getUserId();
        support.setUserId(userId);
        System.out.println("support/add" +support);

        int category = support.getSupCategory();

        switch (category) {
            case 0:
                // 공지사항 등록
                String supContent = request.getParameter("supContent");

                // 파일 업로드 처리 (파일이 있을 때만 수행)
                if (supImage != null && !supImage.isEmpty()) {
                    String originalFilename = supImage.getOriginalFilename();
                    // 파일을 업로드할 상대 경로 설정
                    String uploadDir = "C:\\workspaceIntellij\\Team\\src\\main\\resources\\supportImage";
                    String filePath = uploadDir + originalFilename;
                    File dest = new File(filePath);

                    // 파일을 저장
                    supImage.transferTo(dest);
                    support.setSupImage(originalFilename);
                }

                try {
                    // 공지사항 등록 로직 추가
                    // 예시: supportService.addNotice(support, supContent);
                } catch (Exception e) {
                    // 파일 업로드 예외 처리
                    e.printStackTrace();
                }
                break;

            case 1:
                // Q&A 등록
                int userRole = (int) session.getAttribute("userRole");

                if (userRole == 0) {
                    // 일반 사용자가 질문 등록
                    String questionContent = request.getParameter("supContent");
                    // Q&A 등록 로직 추가
                    // 예시: supportService.addQuestion(support, questionContent);
                } else if (userRole == 1) {
                    // 관리자가 답변 등록
                    String questionContent = request.getParameter("supPluscon");
                    String answerContent = request.getParameter("supContent");
                    // Q&A 답변 등록 로직 추가
                    // 예시: supportService.addAnswer(support, questionContent, answerContent);
                }
                break;
            case 2:
                // 신고 등록
                String reportedSupportNick = request.getParameter("supContent");
                String reportContent = request.getParameter("supPluscon");


                try {
                    // 신고 등록 로직 추가
                    // 예시: supportService.addReport(support, reportedSupportNick, reportContent);
                } catch (Exception e) {
                    // 파일 업로드 예외 처리
                    e.printStackTrace();
                }
                break;
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

}




