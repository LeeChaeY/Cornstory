package com.cornstory.controller.chat;

import com.cornstory.common.Page;
import com.cornstory.common.Search;
import com.cornstory.domain.*;
import com.cornstory.service.chat.ChatService;
import com.cornstory.service.storage.StorageService;
import com.cornstory.service.user.UserService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.core.io.ClassPathResource;
import org.springframework.http.HttpEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.util.StreamUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.multipart.MultipartFile;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
@RequestMapping("/chat")
public class ChatController {

    @Autowired
    private ChatService chatService;

    @Autowired
    @Qualifier("storageServiceImpl")
    private StorageService storageService;

//    @Value("${pageUnit}")
    int pageUnit = 5;
//    @Value("${pageSize}")
    int pageSize = 100;

    public ChatController() {
        System.out.println("ChatController 진입");
    }

    @GetMapping(value="addChatSpace")
    public String addChatSpace(HttpServletRequest request) throws Exception {
        System.out.println("/chat/addChatSpace : GET");

        return "chat/addChatSpace";
    }

    @PostMapping(value="addChatSpace")
    public String addChatSpace(@ModelAttribute("chatSpace") ChatSpace chatSpace,
                               @RequestPart("file") MultipartFile file,
                               HttpServletRequest request,
                               @SessionAttribute("user") User user) throws Exception {
        System.out.println("/chat/addChatSpace : POST");
        chatSpace.setUserId(user.getUserId());
        System.out.println("/chat/addChatSpace : " + chatSpace);

        String bucketName = "cornstory"; // 버킷 이름 지정
        String fileKey = "chat/";
        if (!file.isEmpty()) {
            try {
                System.out.println("file : " + file.getOriginalFilename());

                String savedName = user.getUserId()+"_"+chatSpace.getcSpaceName();
                savedName = savedName.replaceAll("[^a-zA-Z0-9가-힣_]", "_");
                savedName += ".jpg";

                fileKey += savedName;
            } catch (Exception e) {
                e.printStackTrace();
                // 파일 업로드 실패 처리
                System.out.println("<scrpt>alert('파일의 크기는 10MB까지 입니다.");
            }
        } else {
            // 업로드된 파일이 없는 경우 처리
            fileKey += "chat.jpg";
        }

        // 새 파일을 클라우드 스토리지에 업로드
        String fileUrl = storageService.uploadFileToS3(bucketName, fileKey, file);
        chatSpace.setcSpaceImage(fileUrl);
        System.out.println("fileUrl :: "+fileUrl);

        //Business Logic
        int chatSpaceNo = chatService.addChatSpace(chatSpace);

        return "redirect:/chat/json/enterChatSpace?chatSpaceNo="+chatSpaceNo;
    }

    @GetMapping(value="updateChatSpace")
    public String updateChatSpace(Model model, @RequestParam("chatSpaceNo") int chatSpaceNo) throws Exception {
        ChatSpace chatSpace = chatService.getChatSpace(chatSpaceNo);

        System.out.println("/chat/updateChatSpace : GET :: "+chatSpace);
        model.addAttribute("chatSpace", chatSpace);
        model.addAttribute("cSpaceNameCnt", chatSpace.getcSpaceName().length());

        return "chat/updateChatSpace";
    }

    @PostMapping(value="updateChatSpace")
    public String updateChatSpace(@ModelAttribute("chatSpace") ChatSpace chatSpace,
                                  @RequestPart(value = "file") MultipartFile file,
                                  HttpServletRequest request,
                                  @SessionAttribute("user") User user) throws Exception {
        System.out.println("/chat/updateChatSpace : POST");
        System.out.println("/chat/updateChatSpace : " + chatSpace);

       if (!file.isEmpty()) {
            try {
                System.out.println("file : " + file.getOriginalFilename());

                String savedName = user.getUserId()+"_"+chatSpace.getcSpaceName();
                savedName = savedName.replaceAll("[^a-zA-Z0-9가-힣_]", "_");
                savedName += ".jpg";

                String bucketName = "cornstory"; // 버킷 이름 지정
                String fileKey = "chat/" + savedName;

                // 새 파일을 클라우드 스토리지에 업로드
                String fileUrl = storageService.uploadFileToS3(bucketName, fileKey, file);

                String deleteImg = chatService.getChatSpace(chatSpace.getChatSpaceNo()).getcSpaceImage();
                if(!Objects.equals(fileUrl, deleteImg)) {
                    String key = deleteImg.replace("https://cornstory.kr.object.ncloudstorage.com/", "");
                    if (!key.replace("chat/", "").equals("chat.jpg"))
                        storageService.deleteFileFromS3(bucketName,key);
                }
                chatSpace.setcSpaceImage(fileUrl);
                System.out.println("fileUrl :: "+fileUrl);
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

        return "redirect:/chat/json/enterChatSpace?chatSpaceNo="+chatSpace.getChatSpaceNo();
    }

    @RequestMapping(value="listChatSpace")
    public String listChatSpace(Model model, @ModelAttribute("search") Search search,
                                @RequestParam(name="userStatus", defaultValue="0") int userStatus,
                                @RequestParam(name="genre", required=false) String genre,
                                @SessionAttribute("user") User user) throws Exception {

        System.out.println("/chat/listChatSpace : GET/POST :: userStatus : " + userStatus);
        System.out.println("/chat/listChatSpace : GET/POST :: genre : " + genre);
        System.out.println("/chat/listChatSpace : GET/POST :: search : " + search);

        if(search.getCurrentPage() == 0 ){
            search.setCurrentPage(1);
        }
        search.setPageSize(pageSize);

        Map<String, Object> map = chatService.listChatSpace(search, user.getUserId(), genre, userStatus);

        Map<String, Object> map01 = new HashMap<String, Object>();
        map01.put("userId", user.getUserId());
        for (ChatSpace chatSpace : (List<ChatSpace>)map.get("list")) {
            map01.put("chatSpaceNo", chatSpace.getChatSpaceNo());
            chatSpace.setChatEnterCheck(chatService.countChatEnterCheck(map01));
        }

        model.addAttribute("list", map.get("list"));
        model.addAttribute("totalCount", map.get("totalCount"));
        model.addAttribute("search", search);
        model.addAttribute("userStatus", userStatus);
        model.addAttribute("genre", genre);

        System.out.println(map.get("list"));
        System.out.println(search);

        return "chat/listChatSpace";
    }
}
