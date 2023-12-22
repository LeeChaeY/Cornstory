package com.cornstory.service.chat.chatImpl;

import com.cornstory.common.Search;
import com.cornstory.domain.ChatSpace;
import com.cornstory.service.chat.ChatDao;
import com.cornstory.service.chat.ChatService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;

@Service
public class ChatServiceImpl implements ChatService {

    @Autowired
    private ChatDao chatDao;

    @Override
    public int addChatSpace(ChatSpace chatSpace) throws Exception {
        chatDao.addChatSpace(chatSpace);
        chatDao.addChatEnter(chatSpace);
        return chatSpace.getChatSpaceNo();
    }

    @Override
    public ChatSpace getChatSpace(int chatSpaceNo) throws Exception {
        return chatDao.getChatSpace(chatSpaceNo);
    }

    @Override
    public int updateChatSpace(ChatSpace chatSpace) throws Exception {
        return chatDao.updateChatSpace(chatSpace);
    }

    @Override
    public int deleteChatSpace(int chatSpaceNo) throws Exception {
        Map<String,Object> map = new HashMap<String,Object>();

        map.put("chatSpaceNo", chatSpaceNo);
        map.put("userId", "");
        chatDao.deleteChatEnter(map);

        return chatDao.deleteChatSpace(chatSpaceNo);
    }

    @Override
    public Map<String, Object> listChatSpace(Search search, String userId, String genre, int userStatus) throws Exception {
        Map<String,Object> map = new HashMap<String,Object>();

        map.put("search", search);
        map.put("userId", userId);
        map.put("genre", genre);
        map.put("userStatus", userStatus);

        int totalCount = chatDao.countChatSpace(map);
        System.out.println("ChatServiceImpl :: countChatSpace :: "+totalCount);

        map.put("startRowNum", (search.getCurrentPage()-1) * search.getPageSize() + 1);
        map.put("endRowNum", search.getCurrentPage() * search.getPageSize());

        List<ChatSpace> list = chatDao.listChatSpace(map);

        map.put("totalCount", totalCount);
        map.put("list", list);

        return map;
    }

    @Override
    public int addChatEnter(String userId, int chatSpaceNo) throws Exception {
        ChatSpace chatSpace = new ChatSpace();
        chatSpace.setUserId(userId);
        chatSpace.setChatSpaceNo(chatSpaceNo);

        chatDao.addChatEnter(chatSpace);
        chatSpace.setcSpaceImage("");
        chatSpace.setcSpaceName("");
        chatSpace.setcSpaceUserCnt(1);
        return chatDao.updateChatSpace(chatSpace);
    }

    @Override
    public ChatSpace getChatEnter(String userId, int chatSpaceNo) throws Exception {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("userId", userId);
        map.put("chatSpaceNo", chatSpaceNo);

        return chatDao.getChatEnter(map);
    }

    @Override
    public int deleteChatEnter(Map map) throws Exception {
        chatDao.deleteChatEnter(map);

        ChatSpace chatSpace = new ChatSpace();
        chatSpace.setChatSpaceNo((int)map.get("chatSpaceNo"));
        chatSpace.setcSpaceUserCnt(-1);
        System.out.println(chatSpace);
        return chatDao.updateChatSpace(chatSpace);
    }

    @Override
    public Map<String, Object> listChatEnterUser(int chatSpaceNo) throws Exception {
        Map<String,Object> map = new HashMap<String,Object>();

        int totalCount = chatDao.countChatEnterUser(chatSpaceNo);
        System.out.println("ChatServiceImpl :: countChatEnterUser :: "+totalCount);

        map.put("chatSpaceNo", chatSpaceNo);
//        map.put("startRowNum", (search.getCurrentPage()-1) * search.getPageSize() + 1);
//        map.put("endRowNum", search.getCurrentPage() * search.getPageSize());

        List<ChatSpace> list = chatDao.listChatEnterUser(chatSpaceNo);

        map.put("totalCount", totalCount);
        map.put("list", list);

        return map;
    }

    @Override
    public int countChatEnterCheck(Map map) throws Exception {
        return chatDao.countChatEnterCheck(map);
    }
}
