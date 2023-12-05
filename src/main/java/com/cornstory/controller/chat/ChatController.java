package com.cornstory.controller.chat;

import com.cornstory.common.Page;
import com.cornstory.common.Search;
import com.cornstory.domain.ChatSpace;
import com.cornstory.service.chat.ChatService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.Arrays;
import java.util.Map;

@Controller
@RequestMapping("/chat/*")
public class ChatController {

    @Autowired
    private ChatService chatService;

//    @Value("${pageUnit}")
    int pageUnit = 5;
//    @Value("${pageSize}")
    int pageSize = 3;

    public ChatController() {
        System.out.println("ChatController 진입");
    }

    @GetMapping(value="addChatSpace")
    public String addChatSpace() throws Exception {

        System.out.println("/file/chat/addChatSpace : GET");
        return "chat/addChatSpace";
    }

    @PostMapping(value="addChatSpace")
    public String addChatSpace(@ModelAttribute("chatSpace") ChatSpace chatSpace, @RequestParam("file") MultipartFile cSpaceImage) throws Exception {

        chatSpace.setcSpaceImage(Arrays.toString(cSpaceImage.getBytes()));

        System.out.println("/file/chat/addChatSpace : POST");
        System.out.println("/file/chat/addChatSpace : " +chatSpace);

        //Business Logic
        chatService.addChatSpace(chatSpace);

        return "redirect:/chat/enterChatSpace?chatScpaceNo="+chatSpace.getChatSpaceNo();
    }

//    @GetMapping(value="getChatSpace")
//    public String getChatSpace(Model model, @RequestParam("chatSpaceNo") int chatSpaceNo) throws Exception {
//
//        ChatSpace chatSpace = chatService.getChatSpace(chatSpaceNo);
//        System.out.println("/chat/getChatSpace : GET :: "+chatSpace);
//
//        model.addAttribute("chatSpace", chatSpace);
//
//        return "chat/getChatSpace";
//    }

    @GetMapping(value="updateChatSpace")
    public String updateChatSpace(Model model, @RequestParam("chatSpaceNo") int chatSpaceNo) throws Exception {
        ChatSpace chatSpace = chatService.getChatSpace(chatSpaceNo);

        System.out.println("/file/chat/updateChatSpace : GET :: " +chatSpace);
        model.addAttribute("chatSpace", chatSpace);

        return "chat/updateChatSpace";
    }

    @PostMapping(value="updateChatSpace")
    public String updateChatSpace(Model model, @ModelAttribute("chatSpace") ChatSpace chatSpace) throws Exception {
        chatService.updateChatSpace(chatSpace);
        System.out.println("/file/chat/updateChatSpace : GET :: " + chatSpace);

        model.addAttribute("chatSpace", chatSpace);

        return "redirect:/chat/enterChatSpace?chatScpaceNo="+chatSpace.getChatSpaceNo();
    }

//    rest
    @GetMapping(value="deleteChatSpace")
        public String deleteChatSpace(@RequestParam("chatSpaceNo") int chatSpaceNo) throws Exception {
        System.out.println("/file/chat/deleteChatSpace : GET :: " + chatSpaceNo);
        chatService.deleteChatSpace(chatSpaceNo);

        return "chat/listChatSpace";
    }

    @RequestMapping(value="listChatSpace")
    public String listChatSpace(Model model, @ModelAttribute("search") Search search, @RequestParam("userId") String userId) throws Exception {
        System.out.println("/file/chat/listChatSpace : GET/POST :: search : " + search);
        System.out.println("/file/chat/listChatSpace : GET/POST :: userId : " + userId);

        if (userId == null) {
            userId = "";
        }
        if (search.getSearchCondition() == null) {
            search.setSearchCondition("");
        }

        if(search.getCurrentPage() == 0 ){
            search.setCurrentPage(1);
        }
        search.setPageSize(pageSize);

        Map<String, Object> map = chatService.listChatSpace(search, userId);
        Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
        System.out.println("/file/chat/listChatSpace ::" +resultPage);

        model.addAttribute("list", map.get("list"));
        model.addAttribute("resultPage", resultPage);
        model.addAttribute("search", search);

        System.out.println(map.get("list"));
        System.out.println(search);

        return "chat/listChatSpace";
    }



    @GetMapping(value="enterChatSpace")
    public String enterChatSpace(Model model, @ModelAttribute("chatSpace") ChatSpace chatSpace) throws Exception {
        System.out.println("/file/chat/enterChatSpace : GET :: " + chatSpace);
        ChatSpace chatSpace2 = chatService.getChatSpace(chatSpace.getChatSpaceNo());
        System.out.println("/file/chat/enterChatSpace : GET :: " + chatSpace2);
        model.addAttribute("chatSpace", chatSpace2);

        chatService.addChatEnter(chatSpace);
        Map <String, Object> map = chatService.listChat(chatSpace.getChatSpaceNo(), "", "");

        return "chat/enterChatSpace";
    }

}
