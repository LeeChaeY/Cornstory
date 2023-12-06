package com.cornstory.controller.user;


import java.io.File;
import java.util.Map;

import com.cornstory.common.Search;
import com.cornstory.domain.User;
import com.cornstory.service.user.UserService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping("/user/*")
public class UserController {

    //Field
    @Autowired
    @Qualifier("userServiceImpl")
    private UserService userService;

    public UserController(){
        System.out.println("UserController 진입 ");
    }



    @RequestMapping( value="login", method=RequestMethod.GET )
    public String login() throws Exception{
        System.out.println("user/login : GET");
        return "user/login";
    }

    @RequestMapping(value = "login", method = RequestMethod.POST)
    public String login(@ModelAttribute("user") User user, HttpSession session, Model model) throws Exception {
        System.out.println("user/login : POST");
        User dbUser = userService.getUser(user.getUserId());

        if (dbUser != null && user.getPassword().equals(dbUser.getPassword())) {
            session.setAttribute("user", dbUser);
            System.out.println(dbUser + " 출력해보자 로그인 정보 가져오기");
            System.out.println("Login 성공 홈페이지로 이동");
            return "index"; // 로그인 성공 시 홈페이지로 이동
        } else {
            model.addAttribute("errorMessage", "잘못된 정보 또는 없는 계정입니다.");
            System.out.println("Login 실패 로그인페이지 유지");
            return "user/login"; // 로그인 실패 시 로그인 페이지에 머무름
        }
    }


    @RequestMapping( value="logout", method=RequestMethod.POST )
    public String logout(HttpSession session ) throws Exception{

        System.out.println("user/logout : POST");

        session.invalidate();

        return "index";
    }

    @RequestMapping(value="addUser", method= RequestMethod.GET)
    public String addUser() throws Exception{
        System.out.println("user/addUser : GET");
        return "user/addUser";
    }

    @RequestMapping(value = "addUser", method = RequestMethod.POST)
    public String addUser(@ModelAttribute("user") @Validated User user, BindingResult result,
                          @RequestParam(name = "file/user", required = false) MultipartFile userImage, Model model) throws Exception {
        System.out.println("user/addUser : POST");

        // 유효성 검사 실패 시
        if (result.hasErrors()) {
            // 에러 메시지를 모델에 추가
            model.addAttribute("errorMessage", "회원가입 정보를 확인해주세요.");
            System.out.println("회원가입이 실패 되었습니다.");

            // 회원가입 화면으로 다시 이동
            return "user/addUser";
        }

        // 파일 업로드 처리 (파일이 있을 때만 수행)
        if (result.hasErrors()) {
            // 에러 메시지를 모델에 추가
            model.addAttribute("errorMessage", "회원가입 정보를 확인해주세요.");
            System.out.println("회원가입이 실패 되었습니다.");

            // 콘솔에 유효성 검사 에러 메시지 출력
            result.getAllErrors().forEach(error -> System.out.println(error.getDefaultMessage()));

            // 회원가입 화면으로 다시 이동
            return "user/addUser";
        }

        // 나머지 비즈니스 로직 처리
        userService.addUser(user);
        System.out.println(user + "님의 회원가입 성공");

        // 회원가입이 성공하면 회원 정보 페이지로 이동
        model.addAttribute("user", user);
        return "user/getUser";
    }




    @RequestMapping( value="getUser", method=RequestMethod.GET )
    public String getUser(@RequestParam("userId") String userId , Model model ) throws Exception {

        System.out.println("user/getUser : GET");
        //Business Logic
        User user = userService.getUser(userId);
        //User user = userService.getUser("user001");
        // Model 과 View 연결
        model.addAttribute("user", user);

        System.out.println("getUser"+user);

        return "user/getUser";
    }

    @RequestMapping( value="updateUser", method=RequestMethod.GET )
    public String updateUser( @RequestParam("userId") String userId , Model model ) throws Exception{

        System.out.println("user/updateUser : GET");
        //Business Logic
        User user = userService.getUser(userId);
        // Model 과 View 연결
        model.addAttribute("user", user);

        System.out.println("updateUser 들어가기"+user);

        return "forward:/user/updateUser.jsp";
    }

    @RequestMapping( value="updateUser", method=RequestMethod.POST )
    public String updateUser( @ModelAttribute("user") User user , Model model , HttpSession session) throws Exception{

        System.out.println("user/updateUser : POST");
        //Business Logic
        userService.updateUser(user);

        String sessionId=((User)session.getAttribute("user")).getUserId();
        if(sessionId.equals(user.getUserId())){
            session.setAttribute("user", user);
        }

        //return "user/getUser?userId="+user.getUserId();
        return "user/getUser";
    }

    @RequestMapping(value = "listUser")
    public String listUser(@ModelAttribute("search") Search search, Model model, HttpServletRequest request) throws Exception {
        System.out.println("user/listUser : GET / POST");

        if (search.getCurrentPage() == 0) {
            search.setCurrentPage(1);
        }

        // Business logic 수행
        Map<String, Object> map = userService.listUser(search);
        System.out.println("리스트 map를 출력해보자 :::::"+map);
        // Model 과 View 연결
        model.addAttribute("list", map.get("list"));
        model.addAttribute("totalCount",map.get("totalCount"));
        model.addAttribute("search", search);

        // 현재 페이지 번호를 Attribute로 추가
        model.addAttribute("currentPage", search.getCurrentPage());

        return "user/listUser";
    }

}
