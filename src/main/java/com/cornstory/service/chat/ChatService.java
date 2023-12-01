package com.cornstory.service.chat;

import com.cornstory.common.Search;
import com.cornstory.domain.ChatSpace;

import java.util.List;
import java.util.Map;

public interface ChatService {

    public int addChatSpace(ChatSpace chatSpace) throws Exception;

    public ChatSpace getChatSpace(int chatSpaceNo) throws Exception;

    public int updateChatSpace(ChatSpace chatSpace) throws Exception;

    public int deleteChatSpace(int chatSpaceNo) throws Exception;

    public Map<String, Object> listChatSpace(Search search, String userId) throws Exception;

    public int addChatEnter(ChatSpace chatSpace) throws Exception;

    public int deleteChatEnter(Map map) throws Exception;

    public Map<String, Object> listChatEnterUser(Search search, int chatSpaceNo) throws Exception;
}
