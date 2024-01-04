package com.cornstory.restController.chat;

import com.cornstory.domain.ChatSpace;
import com.cornstory.domain.User;
import com.cornstory.service.chat.ChatService;
import com.cornstory.service.user.UserService;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.io.File;
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



    @GetMapping(value="json/enterChatSpace")
    public Map enterChatSpace(@RequestParam("chatSpaceNo") int chatSpaceNo,
                                 @SessionAttribute("user") User user, Model model) throws Exception {
        System.out.println("/chat/json/enterChatSpace : GET/POST :: userId : " + user.getUserId() + ", chatSpaceNo : " + chatSpaceNo);

        ChatSpace chatSpace = new ChatSpace();
        chatSpace.setUserId(user.getUserId());
        chatSpace.setChatSpaceNo(chatSpaceNo);

        Map<String, Object> map01 = new HashMap<String, Object>();
        map01.put("userId", user.getUserId());
        map01.put("chatSpaceNo", chatSpaceNo);

        if (chatService.countChatEnterCheck(map01) == 0)
            chatService.addChatEnter(user.getUserId(), chatSpaceNo);

        chatSpace = chatService.getChatSpace(chatSpaceNo);
        User createUser = userService.getUser(chatSpace.getUserId());
        chatSpace.setNickname(createUser.getNickName());
        chatSpace.setUserImage(createUser.getUserImage());

        System.out.println("/chat/enterChatSpace : GET :: " + chatSpace);
        model.addAttribute("chatSpace", chatSpace);

        System.out.println(chatService.getChatEnter(user.getUserId(), chatSpaceNo).getChatEnterDate());
        String startDate = chatService.getChatEnter(user.getUserId(), chatSpaceNo).getChatEnterDate().toString();

        Map<String, Object> map02 = chatService.listChatEnterUser(chatSpaceNo);

        model.addAttribute("userList", map02.get("list"));
        model.addAttribute("totalCount", map02.get("totalCount"));
        System.out.println(map02.get("list"));

//        String url = "http://localhost:3000/";
        String url = "http://223.130.133.132:3000/";

        Map<String, Object> returnMap = new HashMap<String, Object>();
        returnMap.put("url", url);
        returnMap.put("chatSpace", chatSpace);
        returnMap.put("userList", map02.get("list"));
        returnMap.put("totalCount", map02.get("totalCount"));
        returnMap.put("user", user);
        returnMap.put("startDate", startDate);
        return returnMap;
    }

    @GetMapping(value="json/deleteChatEnter")
    public String deleteChatEnter(@RequestParam("chatSpaceNo") int chatSpaceNo, @SessionAttribute("user") User user) throws Exception {
        System.out.println("/chat/json/deleteChatEnter : GET ::: userId : " + user.getUserId() + "chatSpaceNo : " + chatSpaceNo);
        Map<String, Object> map = new HashMap<String, Object>();

        map.put("userId", user.getUserId());
        map.put("chatSpaceNo", chatSpaceNo);

        chatService.deleteChatEnter(map);

        return "삭제가 완료되었습니다.";
    }

    @GetMapping(value="json/kickOutUser")
    public String kickOutUser(@RequestParam("chatSpaceNo") int chatSpaceNo,
                              @RequestParam("userId") String userId) throws Exception {
        System.out.println("/chat/json/kickOutUser :: chatSpaceNo: "+chatSpaceNo+", userId: "+userId);
        Map<String, Object> map = new HashMap<String, Object>();

        map.put("userId", userId);
        map.put("chatSpaceNo", chatSpaceNo);

        chatService.deleteChatEnter(map);
        return "삭제가 완료되었습니다.";
    }

}
