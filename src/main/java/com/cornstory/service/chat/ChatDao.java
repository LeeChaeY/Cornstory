package com.cornstory.service.chat;

import com.cornstory.domain.ChatSpace;
import com.cornstory.domain.Product;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface ChatDao {

    public int addChatSpace(ChatSpace chatSpace) throws Exception;

    public ChatSpace getChatSpace(int chatSpaceNo) throws Exception;

    public int updateChatSpace(ChatSpace chatSpace) throws Exception;

    public int deleteChatSpace(int chatSpaceNo) throws Exception;

    public int countChatSpace(Map map) throws Exception;

    public List<ChatSpace> listChatSpace(Map map) throws Exception;

    public int addChatEnter(ChatSpace chatSpace) throws Exception;

    public int deleteChatEnter(Map map) throws Exception;

    public int countChatEnterUser(int chatSpaceNo) throws Exception;

    public List<ChatSpace> listChatEnterUser(Map map) throws Exception;

}
