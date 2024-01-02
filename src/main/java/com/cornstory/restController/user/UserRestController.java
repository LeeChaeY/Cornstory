package com.cornstory.restController.user;

import com.cornstory.domain.KakaoAPI;
import com.cornstory.domain.User;
import com.cornstory.service.user.UserService;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;


import java.io.File;
import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping("/user/*")
public class UserRestController {

    @Autowired
    @Qualifier("userServiceImpl")
    private UserService userService;

    public UserRestController() {
        System.out.println("UserRestController 진입");
    }




        @RequestMapping(value = "json/login", method = RequestMethod.POST)
        public ResponseEntity<Object> login(@RequestParam("userId") String userId,
                                            @RequestParam("password") String password) throws Exception {
            System.out.println("user/json/login : POST");

            User dbUser = userService.getUser(userId);

            if (dbUser != null && password.equals(dbUser.getPassword())) {
                System.out.println("Login 성공");
                return new ResponseEntity<>(dbUser, HttpStatus.OK);
            } else {
                System.out.println("Login 실패");
                return new ResponseEntity<>("Login 실패", HttpStatus.UNAUTHORIZED); // 실패 메시지와 함께 비인증 상태 코드 반환
            }
        }

    @RequestMapping(value = "json/addUser", method = RequestMethod.POST)
    public String addUser(@ModelAttribute("user") @Validated User user,
                          BindingResult result,
                          @RequestParam(name = "userImage", required = false) MultipartFile userImage,
                          Model model) throws Exception {

        // 유효성 검사 실패 시
        if (result.hasErrors()) {
            System.out.println(user);
            System.out.println(result.getAllErrors().get(0).getDefaultMessage());
            return "fail: " + result.getAllErrors().get(0).getDefaultMessage();
        }

        // 파일 업로드 처리 (파일이 있을 때만 수행)
        if (userImage != null && !userImage.isEmpty()) {
            // 파일 형식 변환 및 검사
            String originalFilename = userImage.getOriginalFilename();
            String uploadDir = "C:\\workspaceIntellij\\Team\\src\\main\\resources\\userImage";
            String filePath = uploadDir + File.separator + originalFilename;

            // 여기에서 추가적인 파일 형식 변환 및 검사를 수행할 수 있습니다.
            // 예: 이미지 크기, 해상도, 기타 검사 수행

            // 파일을 저장
            File dest = new File(filePath);
            userImage.transferTo(dest);

            // 저장된 파일명을 user 객체의 userImage 필드에 설정
            user.setUserImage(originalFilename);
        }

        // 나머지 비즈니스 로직 처리
        userService.addUser(user);

        // 가입 성공 시 "success" 반환
        return "success";
    }

    @RequestMapping(value="json/checkUserId", method=RequestMethod.GET)
    public String checkUserId(@RequestParam("userId") String userId) throws Exception {
        // 아이디 유효성 검사 로직을 수행합니다.
        boolean idCheck = userService.idCheck(userId);
        return String.valueOf(idCheck);
    }

    @RequestMapping(value="json/checkNickName", method=RequestMethod.GET)
    public String checkNickName(@RequestParam("nickName") String nickName) throws Exception {
        // 닉네임 유효성 검사 로직을 수행합니다.
        boolean nickNameCheck = userService.nickNameCheck(nickName);
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

