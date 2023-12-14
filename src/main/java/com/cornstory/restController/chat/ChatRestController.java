package com.cornstory.restController.chat;

import com.cornstory.domain.Chat;
import com.cornstory.domain.User;
import com.cornstory.service.chat.ChatService;
import com.cornstory.service.user.UserService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.io.File;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping("/chat/*")
public class ChatRestController {

    @Autowired
    private ChatService chatService;

    @Autowired
    private UserService userService;

    //    @Value("${pageUnit}")
    int pageUnit = 5;
    //    @Value("${pageSize}")
    int pageSize = 3;

    public ChatRestController() {
        System.out.println("ChatRestController 진입");
    }


    @GetMapping(value="json/deleteChatSpace/{chatSpaceNo}")
    public String deleteChatSpace(@PathVariable int chatSpaceNo,
                                  HttpServletRequest request) throws Exception {
        System.out.println("/chat/json/deleteChatSpace : GET :: " + chatSpaceNo);


        // https://action713.tistory.com/entry/%EC%8A%A4%ED%94%84%EB%A7%81-%ED%8C%8C%EC%9D%BC-%EA%B2%BD%EB%A1%9C
        String uploadDir = request.getServletContext().getRealPath("")+"\\..\\resources\\static\\file\\chat\\";
        // request.getServletContext().getRealPath(""): webapp 상대 경로

        // 기존 파일 삭제
        String deleteImg = chatService.getChatSpace(chatSpaceNo).getcSpaceImage();
        if (!deleteImg.equals("chat.jpg")) {
            try {
                String deleteDir = uploadDir + File.separator + deleteImg;
                File fileToDelete = new File(deleteDir);

                // 파일을 삭제합니다.
                if (fileToDelete.exists()) {
                    if (fileToDelete.delete()) {
                        System.out.println("파일이 성공적으로 삭제되었습니다.");
                    } else {
                        System.out.println("파일을 삭제하는 데 문제가 발생했습니다.");
                    }
                }
            } catch(Exception e){
                e.printStackTrace();
                // 파일 업로드 실패 처리
                System.out.println("파일 삭제 실패");
            }
        }

        chatService.deleteChatSpace(chatSpaceNo);

        return "삭제가 완료되었습니다.";
    }

    @GetMapping(value="json/deleteChatEnter")
    public String deleteChatEnter(@RequestParam("chatSpaceNo") int chatSpaceNo, HttpSession session) throws Exception {
        String userId = ((User) session.getAttribute("user")).getUserId();
        System.out.println("/chat/json/deleteChatEnter : GET ::: userId : " + userId + "chatSpaceNo : " + chatSpaceNo);
        Map<String, Object> map = new HashMap<String, Object>();

        map.put("userId", userId);
        map.put("chatSpaceNo", chatSpaceNo);

        chatService.deleteChatEnter(map);

        return "삭제가 완료되었습니다.";
    }



    @PostMapping(value="json/addChat")
    public Chat addChat(@RequestBody Chat chat, HttpSession session) throws Exception {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm");
        chat.setChatDate(dateFormat.format(new Timestamp(System.currentTimeMillis())));

        String userId = ((User) session.getAttribute("user")).getUserId();
        chat.setUserId(userId);
        User user = userService.getUser(userId);
        chat.setNickname(user.getNickName());
        chat.setUserImage(user.getUserImage());

        System.out.println("/chat/json/addChat : POST :: chat : " + chat);
        chatService.addChat(chat);
        return chat;
    }

}
