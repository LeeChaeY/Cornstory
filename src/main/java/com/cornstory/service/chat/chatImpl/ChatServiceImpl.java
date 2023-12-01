package com.cornstory.service.chat.chatImpl;

import com.cornstory.common.Search;
import com.cornstory.domain.ChatSpace;
import com.cornstory.domain.Product;
import com.cornstory.service.chat.ChatDao;
import com.cornstory.service.chat.ChatService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class ChatServiceImpl implements ChatService {

    @Autowired
    private ChatDao chatDao;

    @Override
    public int addChatSpace(ChatSpace chatSpace) throws Exception {
        chatDao.addChatSpace(chatSpace);
        return chatDao.addChatEnter(chatSpace);
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
        return chatDao.deleteChatSpace(chatSpaceNo);
    }

    @Override
    public Map<String, Object> listChatSpace(Search search, String userId) throws Exception {
        Map<String,Object> map = new HashMap<String,Object>();

        map.put("search", search);
        map.put("userId", userId);

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
    public int addChatEnter(ChatSpace chatSpace) throws Exception {
        return chatDao.addChatEnter(chatSpace);
    }

    @Override
    public int deleteChatEnter(Map map) throws Exception {
        return chatDao.deleteChatEnter(map);
    }

    @Override
    public Map<String, Object> listChatEnterUser(Search search, int chatSpaceNo) throws Exception {
        Map<String,Object> map = new HashMap<String,Object>();

        int totalCount = chatDao.countChatEnterUser(chatSpaceNo);
        System.out.println("ChatServiceImpl :: countChatEnterUser :: "+totalCount);

        map.put("chatSpaceNo", chatSpaceNo);
        map.put("startRowNum", (search.getCurrentPage()-1) * search.getPageSize() + 1);
        map.put("endRowNum", search.getCurrentPage() * search.getPageSize());

        List<ChatSpace> list = chatDao.listChatEnterUser(map);

        map.put("totalCount", totalCount);
        map.put("list", list);

        return map;
    }
}
