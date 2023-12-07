package com.cornstory.restController.user;

import com.cornstory.domain.User;
import com.cornstory.service.user.UserService;
import jakarta.servlet.http.HttpServletResponse;
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
        System.out.println("중복체크 아이디 : "+idCheck);
        // 결과에 따라 "valid" 또는 "invalid"을 반환합니다.
        return String.valueOf(idCheck);
    }

    @RequestMapping(value="json/checkNickName", method=RequestMethod.GET)
    public String checkNickName(@RequestParam("nickName") String nickName) throws Exception {
        // 아이디 유효성 검사 로직을 수행합니다.
        // 실제로는 데이터베이스 조회 등의 작업을 통해 확인할 수 있습니다.
        boolean nickNameCheck = userService.nickNameCheck(nickName);
        System.out.println("중복체크 닉네임 : "+nickNameCheck);
        // 결과에 따라 "valid" 또는 "invalid"을 반환합니다.
        return String.valueOf(nickNameCheck);
    }

    @RequestMapping(value = "json/deleteUser", method = RequestMethod.GET)
    public String deleteUser(@RequestParam("userId") String userId, HttpServletResponse response, HttpSession session) {
        try {
            userService.deleteUser(userId);
            response.setStatus(HttpServletResponse.SC_OK); // 200 OK
            System.out.println("200"+response);
            session.invalidate(); // 세션 무효화
            return "valid"; // 삭제 성공을 클라이언트에게 알림
        } catch (Exception e) {
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            return "invalid"; // 삭제 실패를 클라이언트에게 알림
        }

    }

}

