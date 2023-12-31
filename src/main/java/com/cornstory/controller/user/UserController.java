package com.cornstory.controller.user;


import com.cornstory.common.Search;
import com.cornstory.domain.KakaoAPI;
import com.cornstory.domain.User;
import com.cornstory.service.storage.StorageService;
import com.cornstory.service.user.UserService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
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
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/user/*")
public class UserController {

    //Field
    @Autowired
    @Qualifier("userServiceImpl")
    private UserService userService;

    @Autowired
    @Qualifier("storageServiceImpl")
    private StorageService storageService;

    public UserController(){
        System.out.println("UserController 진입 ");
    }

    @RequestMapping(value = "/slogin")
    public ModelAndView slogin(@ModelAttribute("user") User user, @RequestParam("code") String code, HttpSession session) throws Exception {
        ModelAndView mav = new ModelAndView();

        // 1. 카카오 로그인 처리
        String accessToken = kakaoApi.getAccessToken(code);
        HashMap<String, Object> userInfo = kakaoApi.getUserInfo(accessToken);

        System.out.println("카카오 토큰 정보 : " + accessToken);
        System.out.println("카카오 로그인 정보: " + userInfo.toString());
        String userId = userInfo.get("id").toString();

        // 2. 사용자가 이미 회원인지 확인
        User dbUser = userService.getUser(userId);

        if (dbUser != null) {
            // 이미 회원인 경우
            System.out.println("카카오 로그인 정보를 가져왔으며 이미 회원인 경우");

            // 세션에 사용자 정보 저장
            session.setAttribute("accessToken", accessToken);
            System.out.println("2222 카카오 토큰 정보 : " + accessToken);
            session.setAttribute("user", dbUser);
            //session.setAttribute("accessToken", accessToken);

            //mav.addObject("userId", userId);
            mav.setViewName("redirect:/index.jsp");  // 로그인 후 이동할 페이지를 지정하세요.
        } else {
            // 회원이 아닌 경우
            System.out.println("카카오 로그인 정보를 가져왔으며 비회원인 경우");

            // 회원가입 페이지로 이동
            mav.addObject("social", 1);
            mav.addObject("userId", userId);
            mav.addObject("kakaoUserInfo", userInfo);

            mav.setViewName("forward:/user/addUser");  // 회원가입 페이지 경로를 지정하세요.0
            System.out.println("mav 값 출력: " + mav);
        }

        return mav;
    }

    @RequestMapping(value = "/slogout", method = RequestMethod.POST)
    public String slogout(HttpSession session) throws Exception {
        System.out.println("user/slogout : POST");

        String accessToken = (String) session.getAttribute("accessToken");
        System.out.println("accessToken: " + accessToken);

        if (accessToken != null) {
            // 토큰이 존재할 경우에만 로그아웃 시도
            kakaoApi.kakaoLogout(accessToken);
            session.removeAttribute("accessToken");
            session.removeAttribute("userId");
            session.removeAttribute("user");

            System.out.println("Logout successful");
        } else {
            System.out.println("No access token found in session");
        }

        return "redirect:/index.jsp";
    }

    @RequestMapping( value="login", method=RequestMethod.GET )
    public String login(HttpServletResponse response) throws Exception{
        System.out.println("user/login : GET");
        return "user/login";
    }
    KakaoAPI kakaoApi = new KakaoAPI();

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

        String extension = getFileExtension(file);

        if (extension != null && extension.equalsIgnoreCase("jpg")) {
            String fileName = user.getUserId() + "_user" ;
            fileName = fileName.replaceAll("[^a-zA-Z0-9가-힣_]", "_")+ ".jpg";
            String bucketName = "cornstory"; // 버킷 이름 지정
            String fileKey = "user/" + fileName;

            String fileUrl = storageService.uploadFileToS3(bucketName, fileKey, file);

            // 파일 경로를 Work 객체에 저장searchCondition
            user.setUserImage(fileUrl);

        }else{
            user.setUserImage("user.jpg");
        }

        // 나머지 비즈니스 로직 처리
        userService.addUser(user);
        System.out.println(user + "님의 회원가입 성공");

        // 회원가입이 성공하면 회원 정보 페이지로 이동
        model.addAttribute("user", user);
        return "user/welcomeUser";
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
    public String updateUser(@ModelAttribute("user") @Validated User user, HttpServletRequest request,
                             @RequestParam("userfile") MultipartFile file , HttpSession session) throws Exception{

        System.out.println("user/updateUser : POST");
        //Business Logic


        String extension = getFileExtension(file);

        if (extension != null && extension.equalsIgnoreCase("jpg")) {
            String fileName = user.getUserId() + "_user" ;
            fileName = fileName.replaceAll("[^a-zA-Z0-9가-힣_]", "_")+ ".jpg";
            String bucketName = "cornstory"; // 버킷 이름 지정
            String fileKey = "user/" + fileName;

            String fileUrl = storageService.uploadFileToS3(bucketName, fileKey, file);

            // 파일 경로를 Work 객체에 저장
            user.setUserImage(fileUrl);

        }else{
            user.setUserImage("user.jpg");
        }

        userService.updateUser(user);
        System.out.println(user);


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

    public String getFileExtension(MultipartFile file) {
        String fileName = file.getOriginalFilename();
        if (fileName == null || fileName.isEmpty()) {
            return null;
        }

        int dotIndex = fileName.lastIndexOf('.');
        if (dotIndex >= 0) {
            // 마지막 점 이후의 문자열을 확장자로 추출
            return fileName.substring(dotIndex + 1);
        } else {
            // 확장자가 없는 경우
            return null;
        }
    }

}
