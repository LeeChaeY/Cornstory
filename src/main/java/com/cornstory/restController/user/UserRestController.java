package com.cornstory.restController.user;

import com.cornstory.domain.User;
import com.cornstory.service.user.UserService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/user/*")
public class UserRestController {

    @Autowired
    @Qualifier("userServiceImpl")
    private UserService userService;

    @Value("${kakao.api.native-app-key}")
    private String kakaoNativeAppKey;

    @Value("${kakao.api.rest-key}")
    private String kakaoRestKey;

    @Value("${kakao.api.js-key}")
    private String kakaoJsKey;

    @Value("${kakao.api.admin-key}")
    private String kakaoAdminKey;

    public UserRestController() {
        System.out.println("UserRestController 진입");
    }


        @RequestMapping(value = "json/login", method = RequestMethod.POST)
        public String login(@RequestParam("userId") String userId,
                                   @RequestParam("password") String password) throws Exception {
            System.out.println("user/json/login : POST");

            User dbUser = userService.getUser(userId);

            if (dbUser != null && password.equals(dbUser.getPassword())) {
                System.out.println("Login 성공");
                return "success";
            } else {
                System.out.println("Login 실패");
                return "fail";
            }
        }


    @RequestMapping(value="json/checkUserId", method=RequestMethod.GET)
    public String checkUserId(@RequestParam("userId") String userId) throws Exception {
        // 아이디 유효성 검사 로직을 수행합니다.
        // 실제로는 데이터베이스 조회 등의 작업을 통해 확인할 수 있습니다.
        boolean idCheck = userService.idCheck(userId);

        // 결과에 따라 "valid" 또는 "invalid"을 반환합니다.
        return String.valueOf(idCheck);
    }


}

