package com.cornstory.restController.support;

import com.cornstory.common.Search;
import com.cornstory.domain.Support;
import com.cornstory.domain.User;
import com.cornstory.service.support.SupportService;
import com.cornstory.service.user.UserService;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;


@RestController
@RequestMapping("/support/*")
public class SupportRestController {

    @Autowired
    @Qualifier("supportServiceImpl")
    private SupportService supportService;

    @Autowired
    @Qualifier("userServiceImpl")
    private UserService userService;

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

    @RequestMapping( value="json/banSupport", method=RequestMethod.GET )
    public String banSupport(@RequestParam("supId") String supId,@RequestParam("supBan") String supBan ,HttpServletResponse response, HttpSession session, Model model ) throws Exception {

        System.out.println("support/json/getSupport : GET");
        System.out.println(supBan);

        try {
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            java.util.Date utilDate = sdf.parse(supBan);

            // java.util.Date를 java.sql.Date로 변환합니다.
            Date sqlDate = new Date(utilDate.getTime());

            User user = new User();
            user.setUserId(supId);
            user.setBanDate(sqlDate);
            System.out.println(user);
            userService.banUser(user);
            return "valid"; // 삭제 성공을 클라이언트에게 알림
        } catch (Exception e) {
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            return "invalid"; // 삭제 실패를 클라이언트에게 알림
        }
    }

    @RequestMapping(value = "json/getUserIdByNickname", method = RequestMethod.GET)
    public ResponseEntity<String> getUserIdByNickname(@RequestParam("nickName") String nickName) throws Exception {
        Search search = new Search();
        Map<String, Object> map = userService.listUser(search);
        List<User> list = (List<User>)map.get("list");

        for (User user : list) {
            if (user.getNickName().equals(nickName)) {
                return new ResponseEntity<>(user.getUserId(), HttpStatus.OK);
            }
        }
        return new ResponseEntity<>("", HttpStatus.NOT_FOUND);
    }

}
