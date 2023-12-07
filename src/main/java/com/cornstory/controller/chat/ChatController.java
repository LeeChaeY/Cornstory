package com.cornstory.controller.chat;

import com.cornstory.common.Page;
import com.cornstory.common.Search;
import com.cornstory.domain.Chat;
import com.cornstory.domain.ChatSpace;
import com.cornstory.domain.User;
import com.cornstory.service.chat.ChatService;
import com.cornstory.service.user.UserService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.util.*;

@Controller
@RequestMapping("/chat")
public class ChatController {

    @Autowired
    private ChatService chatService;

    @Autowired
    private UserService userService;

//    @Value("${pageUnit}")
    int pageUnit = 5;
//    @Value("${pageSize}")
    int pageSize = 3;

    public ChatController() {
        System.out.println("ChatController 진입");
    }

    @GetMapping(value="addChatSpace")
    public String addChatSpace() throws Exception {
        System.out.println("/chat/addChatSpace : GET");
        return "chat/addChatSpace";
    }

    @PostMapping(value="addChatSpace")
    public String addChatSpace(Model model, @ModelAttribute("chatSpace") ChatSpace chatSpace,
                               @RequestParam("file") MultipartFile file, HttpServletRequest request,
                               HttpSession session) throws Exception {
        System.out.println("/chat/addChatSpace : POST");
        String userId = ((User) session.getAttribute("user")).getUserId();
        chatSpace.setUserId(userId);
        System.out.println("/chat/addChatSpace : " + chatSpace);

        // https://action713.tistory.com/entry/%EC%8A%A4%ED%94%84%EB%A7%81-%ED%8C%8C%EC%9D%BC-%EA%B2%BD%EB%A1%9C
        String uploadDir = request.getServletContext().getRealPath("")+"\\..\\resources\\static\\file\\chat\\";
        // request.getServletContext().getRealPath(""): webapp 상대 경로

        if (!file.isEmpty()) {
            try {
                // uuid 생성
                UUID uuid = UUID.randomUUID();
                System.out.println(file.getOriginalFilename());

                //savedName 변수에 uuid + 원래 이름 추가
                String savedName = uuid + "_" + file.getOriginalFilename();
                File uploadFile = new File(uploadDir, savedName);
                file.transferTo(uploadFile);
                chatSpace.setcSpaceImage(savedName);

            } catch (Exception e) {
                e.printStackTrace();
                // 파일 업로드 실패 처리
                System.out.println("<scrpt>alert('파일의 크기는 10MB까지 입니다.");
            }
        } else {
            // 업로드된 파일이 없는 경우 처리
            chatSpace.setcSpaceImage("chat.jpg");
        }

        //Business Logic
        chatService.addChatSpace(chatSpace);

        return "redirect:/chat/listChatSpace";
    }

    @GetMapping(value="updateChatSpace")
    public String updateChatSpace(Model model, @RequestParam("chatSpaceNo") int chatSpaceNo) throws Exception {
        ChatSpace chatSpace = chatService.getChatSpace(chatSpaceNo);

        System.out.println("/chat/updateChatSpace : GET :: "+chatSpace);
        model.addAttribute("chatSpace", chatSpace);

        return "chat/updateChatSpace";
    }

    @PostMapping(value="updateChatSpace")
    public String updateChatSpace(Model model, @ModelAttribute("chatSpace") ChatSpace chatSpace,
                                  @RequestParam("file") MultipartFile file, HttpServletRequest request) throws Exception {
        System.out.println("/chat/updateChatSpace : POST");
        System.out.println("/chat/updateChatSpace : " + chatSpace);

        // https://action713.tistory.com/entry/%EC%8A%A4%ED%94%84%EB%A7%81-%ED%8C%8C%EC%9D%BC-%EA%B2%BD%EB%A1%9C
        String uploadDir = request.getServletContext().getRealPath("")+"\\..\\resources\\static\\file\\chat\\";
        // request.getServletContext().getRealPath(""): webapp 상대 경로

        if (!file.isEmpty()) {
            try {
                // 기존 파일 삭제
                String deleteImg = chatService.getChatSpace(chatSpace.getChatSpaceNo()).getcSpaceImage();
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

                // uuid 생성
                UUID uuid = UUID.randomUUID();
                System.out.println(file.getOriginalFilename());

                //savedName 변수에 uuid + 원래 이름 추가
                String savedName = uuid + "_" + file.getOriginalFilename();
                File uploadFile = new File(uploadDir, savedName);
                file.transferTo(uploadFile);
                chatSpace.setcSpaceImage(savedName);

            } catch (Exception e) {
                e.printStackTrace();
                // 파일 업로드 실패 처리
                System.out.println("<scrpt>alert('파일의 크기는 10MB까지 입니다.");
            }
        } else {
            // 업로드된 파일이 없는 경우 처리
            chatSpace.setcSpaceImage("");
        }

        //Business Logic
        chatService.updateChatSpace(chatSpace);

        return "redirect:/chat/listChatSpace";
    }

    @RequestMapping(value="listChatSpace")
    public String listChatSpace(Model model, @ModelAttribute("search") Search search,
                                HttpServletRequest request, HttpSession session) throws Exception {
        String userId = "";
        String enterUserId = "";
        String genre = "";
        int chatSpaceNo2 = 0;
        if (request.getParameter("userId") != null) userId = request.getParameter("userId");
        if (request.getParameter("enterUserId") != null) enterUserId = request.getParameter("enterUserId");
        if (request.getParameter("genre") != null) genre = request.getParameter("genre");
        if (request.getParameter("chatSpaceNo2") != null) chatSpaceNo2 = Integer.parseInt(request.getParameter("chatSpaceNo2"));

        System.out.println("/chat/listChatSpace : GET/POST :: search : " + search);
        System.out.println("/chat/listChatSpace : GET/POST :: userId : " + userId);
        System.out.println("/chat/listChatSpace : GET/POST :: enterUserId : " + enterUserId);
        System.out.println("/chat/listChatSpace : GET/POST :: genre : " + genre);

        if (search.getSearchCondition() == null) {
            search.setSearchCondition("");
        }

        if(search.getCurrentPage() == 0 ){
            search.setCurrentPage(1);
        }
        search.setPageSize(pageSize);

        Map<String, Object> map = chatService.listChatSpace(search, userId, genre, enterUserId);
        Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
        System.out.println("/chat/listChatSpace ::"+resultPage);

        Map<String, Object> map01 = new HashMap<String, Object>();
        map01.put("userId", ((User) session.getAttribute("user")).getUserId());
        for (ChatSpace chatSpace : (List<ChatSpace>)map.get("list")) {
            map01.put("chatSpaceNo", chatSpace.getChatSpaceNo());
            chatSpace.setChatEnterCheck(chatService.countChatEnterCheck(map01));
        }

        model.addAttribute("list", map.get("list"));
        model.addAttribute("resultPage", resultPage);
        model.addAttribute("search", search);
        model.addAttribute("chatSpaceNo2", chatSpaceNo2);

        System.out.println(map.get("list"));
        System.out.println(search);

        return "chat/listChatSpace";
    }




    @RequestMapping(value="enterChatSpace")
    public String enterChatSpace(@RequestParam("chatSpaceNo") int chatSpaceNo,
                                 HttpSession session, Model model) throws Exception {
        String userId = ((User) session.getAttribute("user")).getUserId();
        System.out.println("/chat/enterChatSpace : GET/POST :: userId : " + userId + ", chatSpaceNo : " + chatSpaceNo);

        ChatSpace chatSpace = chatService.getChatSpace(chatSpaceNo);
        chatSpace.setUserId(userId);

        Map<String, Object> map01 = new HashMap<String, Object>();
        map01.put("userId", userId);
        map01.put("chatSpaceNo", chatSpaceNo);

        if (chatService.countChatEnterCheck(map01) == 0)
            chatService.addChatEnter(userId, chatSpaceNo);

        chatSpace = chatService.getChatSpace(chatSpaceNo);
        User createUser = userService.getUser(chatSpace.getUserId());
        chatSpace.setNickname(createUser.getNickName());
        chatSpace.setUserImage(createUser.getUserImage());

        System.out.println("/chat/enterChatSpace : GET :: " + chatSpace);
        model.addAttribute("chatSpace", chatSpace);

        String startDate = chatService.getChatEnter(userId, chatSpaceNo).getChatEnterDate().toString();

        Map <String, Object> map = chatService.listChat(chatSpace.getChatSpaceNo(), startDate, "");
        System.out.println("/chat/enterChatSpace : GET :: " + map.get("list"));
        model.addAttribute("list", map.get("list"));

        Map<String, Object> map02 = chatService.listChatEnterUser(chatSpaceNo);

        model.addAttribute("userList", map02.get("list"));
        model.addAttribute("totalCount", map02.get("totalCount"));

        System.out.println(map02.get("list"));


        return "chat/enterChatSpace";
    }


}
