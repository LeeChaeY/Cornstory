package com.cornstory.controller.chat;

import com.cornstory.common.Page;
import com.cornstory.common.Search;
import com.cornstory.domain.ChatSpace;
import com.cornstory.service.chat.ChatService;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.util.Arrays;
import java.util.Map;
import java.util.UUID;

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

        System.out.println("/chat/addChatSpace : GET");
        return "chat/addChatSpace";
    }

    @PostMapping(value="addChatSpace")
    public String addChatSpace(@ModelAttribute("chatSpace") ChatSpace chatSpace,
                               @RequestParam("file") MultipartFile file, HttpServletRequest request) throws Exception {

        // https://action713.tistory.com/entry/%EC%8A%A4%ED%94%84%EB%A7%81-%ED%8C%8C%EC%9D%BC-%EA%B2%BD%EB%A1%9C
        String uploadDir = request.getServletContext().getRealPath("")+"\\..\\resources\\images\\";
        // request.getServletContext().getRealPath(""): webapp 상대 경로
        System.out.println("uploadDir :: "+uploadDir);

        if (!file.isEmpty()) {
            try {
                // uuid 생성
                UUID uuid = UUID.randomUUID();
                System.out.println(file.getOriginalFilename());

                //savedName 변수에 uuid + 원래 이름 추가
                String savedName = uuid + "_" + file.getOriginalFilename();
                File uploadFile = new File(uploadDir, savedName);
                file.transferTo(uploadFile);
                chatSpace.setCSpaceImage(savedName);

                System.out.println("/chat/addChatSpace : POST");
                System.out.println("/chat/addChatSpace : " + chatSpace);

                //Business Logic
                chatService.addChatSpace(chatSpace);

            } catch (Exception e) {
                e.printStackTrace();
                // 파일 업로드 실패 처리
                System.out.println("<scrpt>alert('파일의 크기는 10MB까지 입니다.");
            }
        } else {
            // 업로드된 파일이 없는 경우 처리
            System.out.println("인코딩 타입이 multipart/form-data가 아닙니다..");
        }

        return "chat/enterChatSpace";
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
        // https://action713.tistory.com/entry/%EC%8A%A4%ED%94%84%EB%A7%81-%ED%8C%8C%EC%9D%BC-%EA%B2%BD%EB%A1%9C
        String uploadDir = request.getServletContext().getRealPath("")+"\\..\\resources\\images\\";
        // request.getServletContext().getRealPath(""): webapp 상대 경로
        System.out.println("uploadDir :: "+uploadDir);

        if (!file.isEmpty()) {
            try {
                // 기존 파일 삭제
                String deleteImg = chatService.getChatSpace(chatSpace.getChatSpaceNo()).getCSpaceImage();
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
                chatSpace.setCSpaceImage(savedName);

                System.out.println("/chat/addChatSpace : POST");
                System.out.println("/chat/addChatSpace : " + chatSpace);

                //Business Logic
                chatService.updateChatSpace(chatSpace);

            } catch (Exception e) {
                e.printStackTrace();
                // 파일 업로드 실패 처리
                System.out.println("<scrpt>alert('파일의 크기는 10MB까지 입니다.");
            }
        } else {
            // 업로드된 파일이 없는 경우 처리
            System.out.println("인코딩 타입이 multipart/form-data가 아닙니다..");
        }

        return "chat/enterChatSpace";
    }

//    rest
    @GetMapping(value="deleteChatSpace")
        public String deleteChatSpace(@RequestParam("chatSpaceNo") int chatSpaceNo) throws Exception {
        System.out.println("/chat/deleteChatSpace : GET :: " + chatSpaceNo);
        chatService.deleteChatSpace(chatSpaceNo);

        return "chat/listChatSpace";
    }

    @RequestMapping(value="listChatSpace")
    public String listChatSpace(Model model, @ModelAttribute("search") Search search, @RequestParam("userId") String userId) throws Exception {
        System.out.println("/chat/listChatSpace : GET/POST :: search : " + search);
        System.out.println("/chat/listChatSpace : GET/POST :: userId : " + userId);

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
        System.out.println("/chat/listChatSpace ::"+resultPage);

        model.addAttribute("list", map.get("list"));
        model.addAttribute("resultPage", resultPage);
        model.addAttribute("search", search);

        System.out.println(map.get("list"));
        System.out.println(search);

        return "chat/listChatSpace";
    }



    @GetMapping(value="enterChatSpace")
    public String enterChatSpace(Model model, @ModelAttribute("chatSpace") ChatSpace chatSpace) throws Exception {
        System.out.println("/chat/enterChatSpace : GET :: " + chatSpace);
        ChatSpace chatSpace2 = chatService.getChatSpace(chatSpace.getChatSpaceNo());
        System.out.println("/chat/enterChatSpace : GET :: " + chatSpace2);
        model.addAttribute("chatSpace", chatSpace2);

        chatService.addChatEnter(chatSpace);
        Map <String, Object> map = chatService.listChat(chatSpace.getChatSpaceNo(), "", "");

        return "chat/enterChatSpace";
    }

}
