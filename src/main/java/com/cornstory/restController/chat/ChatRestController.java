package com.cornstory.restController.chat;

import com.cornstory.service.chat.ChatService;
import com.cornstory.service.user.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping("/chat/*")
public class ChatRestController {

    @Autowired
    private ChatService chatService;

    //    @Value("${pageUnit}")
    int pageUnit = 5;
    //    @Value("${pageSize}")
    int pageSize = 3;

    public ChatRestController() {
        System.out.println("ChatRestController 진입");
    }


    @GetMapping(value="json/deleteChatSpace/{chatSpaceNo}")
    public String deleteChatSpace(@PathVariable int chatSpaceNo) throws Exception {
        System.out.println("/chat/json/deleteChatSpace : GET :: " + chatSpaceNo);
        chatService.deleteChatSpace(chatSpaceNo);

        return "삭제가 완료되었습니다.";
    }

    @GetMapping(value="json/deleteChatEnter")
    public String deleteChatEnter(@RequestParam("userId") String userId,
                                  @RequestParam("chatSpaceNo") int chatSpaceNo) throws Exception {
        System.out.println("/chat/json/deleteChatEnter : GET :: userId : " + userId + "chatSpaceNo : " + chatSpaceNo);
        Map<String, Object> map = new HashMap<String, Object>();

        map.put("userId", userId);
        map.put("chatSpaceNo", chatSpaceNo);

        chatService.deleteChatEnter(map);

        return "삭제가 완료되었습니다.";
    }

}
