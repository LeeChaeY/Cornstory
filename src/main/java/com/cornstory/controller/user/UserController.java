package com.cornstory.controller.user;


import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.StandardOpenOption;
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
            return "redirect:/index.jsp"; // 로그인 성공 시 홈페이지로 이동
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
    public String addUser(@ModelAttribute("user") @Validated User user, HttpServletRequest request,
                          @RequestParam("userfile") MultipartFile file, Model model) throws Exception {
        System.out.println("user/addUser : POST");

        // 유효성 검사 실패 시
        System.out.println(user + "들어온 정보 확인 하기 ");

        String fileName = user.getUserId() + "_user" ;
        fileName = fileName.replaceAll("[^a-zA-Z0-9가-힣_]", "_");
        fileName += ".jpg";

        if (!file.isEmpty()) {
            try {
                String uploadDir = request.getServletContext().getRealPath("")+"\\..\\resources\\static\\file\\user\\";
                String filePath = uploadDir + File.separator + fileName;


                Files.write(Path.of(filePath), file.getBytes(), StandardOpenOption.CREATE, StandardOpenOption.TRUNCATE_EXISTING);

                // 파일 경로를 Work 객체에 저장

                user.setUserImage(filePath);
            } catch (IOException e) {
                e.printStackTrace();
            }

        }

        // 나머지 비즈니스 로직 처리
        userService.addUser(user);
        System.out.println(user + "님의 회원가입 성공");

        // 회원가입이 성공하면 회원 정보 페이지로 이동
        model.addAttribute("user", user);
        return "user/addEnd";
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
    public String listUser(@ModelAttribute("search") Search search, Model model) throws Exception {
        System.out.println("user/listUser : GET / POST");

        // Business logic 수행
        Map<String, Object> map = userService.listUser(search);

        // Model 과 View 연결
        model.addAttribute("list", map.get("list"));
        model.addAttribute("totalCount",map.get("totalCount"));
        model.addAttribute("search", search);

        // 결과 확인
        System.out.println(search.toString());
        System.out.println("리스트 map를 출력해보자 :::::"+map);
        System.out.println("=================================");
        return "user/listUser";
    }

}
