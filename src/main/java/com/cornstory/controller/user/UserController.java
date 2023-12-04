package com.cornstory.controller.user;

import java.nio.charset.StandardCharsets;
import java.util.Arrays;
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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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
        System.out.println("/user/logon : GET");
        return "user/login";
    }

    @RequestMapping( value="login", method=RequestMethod.POST )
    public String login(@ModelAttribute("user") User user , HttpSession session ) throws Exception{
        System.out.println("/user/login : POST");
        User dbUser=userService.getUser(user.getUserId());

        if( user.getPassword().equals(dbUser.getPassword())){
            session.setAttribute("user", dbUser);
        }
        return "index";
    }

    @RequestMapping( value="logout", method=RequestMethod.GET )
    public String logout(HttpSession session ) throws Exception{

        System.out.println("/user/logout : POST");

        session.invalidate();

        return "index";
    }

    @RequestMapping(value="addUser", method= RequestMethod.GET)
    public String addUser() throws Exception{
        System.out.println("/user/addUser : GET");
        return "user/addUser";
    }

    @RequestMapping(value = "addUser", method = RequestMethod.POST)
    public String addUser(@ModelAttribute("user") User user, @RequestParam("userImage") MultipartFile userImage) throws Exception {
        System.out.println("/user/addUser : POST");

        // 파일 데이터를 byte 배열로 변환하여 User 객체에 저장
        user.setUserImage(Arrays.toString(userImage.getBytes()));

        userService.addUser(user);
        return "user/login";
    }




    @RequestMapping( value="getUser", method=RequestMethod.GET )
    public String getUser(@RequestParam("userId") String userId , Model model ) throws Exception {

        System.out.println("/user/getUser : GET");
        //Business Logic
        User user = userService.getUser(userId);
        // Model 과 View 연결
        model.addAttribute("user", user);

        return "user/getUser";
    }

    @RequestMapping( value="updateUser", method=RequestMethod.GET )
    public String updateUser( @RequestParam("userId") String userId , Model model ) throws Exception{

        System.out.println("/user/updateUser : GET");
        //Business Logic
        User user = userService.getUser(userId);
        // Model 과 View 연결
        model.addAttribute("user", user);

        return "forward:/user/updateUser.jsp";
    }

    @RequestMapping( value="updateUser", method=RequestMethod.POST )
    public String updateUser( @ModelAttribute("user") User user , Model model , HttpSession session) throws Exception{

        System.out.println("/user/updateUser : POST");
        //Business Logic
        userService.updateUser(user);

        String sessionId=((User)session.getAttribute("user")).getUserId();
        if(sessionId.equals(user.getUserId())){
            session.setAttribute("user", user);
        }

        return "redirect:/user/getUser?userId="+user.getUserId();
    }

    @RequestMapping( value="listUser" )
    public String listUser( @ModelAttribute("search") Search search , Model model , HttpServletRequest request) throws Exception{

        System.out.println("/user/listUser : GET / POST");

        if(search.getCurrentPage() ==0 ){
            search.setCurrentPage(1);
        }

        // Business logic 수행
        Map<String , Object> map=userService.listUser(search);



        // Model 과 View 연결
        model.addAttribute("list", map.get("list"));
        model.addAttribute("search", search);

        return "forward:/user/listUser.jsp";
    }
}
