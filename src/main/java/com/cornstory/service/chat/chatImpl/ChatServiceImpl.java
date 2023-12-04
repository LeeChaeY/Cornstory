package com.cornstory.service.chat.chatImpl;

import com.cornstory.common.Search;
import com.cornstory.domain.Chat;
import com.cornstory.domain.ChatSpace;
import com.cornstory.service.chat.ChatDao;
import com.cornstory.service.chat.ChatRepository;
import com.cornstory.service.chat.ChatService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class ChatServiceImpl implements ChatService {

    @Autowired
    private ChatDao chatDao;

    @Autowired
    private ChatRepository chatRepository;

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

    @Override
    public Chat addChat(Chat chat) throws Exception {
        return chatRepository.save(chat);

    }

    @Override
    public void deleteChat(Long chatNo) throws Exception {
        chatRepository.deleteByChatNo(chatNo);
    }

    @Override
    public Map<String, Object> listChat(int chatSpaceNo, String startDate, String endDate) throws Exception {
        Map<String,Object> map = new HashMap<String,Object>();

//        map.put("search", search);
//        map.put("chatSpaceNo", chatSpaceNo);

        int totalCount = chatRepository.countByChatSpaceNo(chatSpaceNo);
        System.out.println("ChatServiceImpl :: countByChatSpaceNo :: "+totalCount);

//        map.put("startRowNum", (search.getCurrentPage()-1) * search.getPageSize() + 1);
//        map.put("endRowNum", search.getCurrentPage() * search.getPageSize());

        List<Chat> list = new ArrayList<Chat>();
        if (startDate != null && !startDate.equals("") && endDate != null && !endDate.equals("")) {
            list = chatRepository.findByChatSpaceNoAndChatDateBetween(chatSpaceNo, startDate, endDate);
        } else {
            list = chatRepository.findByChatSpaceNo(chatSpaceNo);
        }
        map.put("totalCount", totalCount);
        map.put("list", list);

        return map;
    }
}
