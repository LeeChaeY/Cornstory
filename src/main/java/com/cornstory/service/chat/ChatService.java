package com.cornstory.service.chat;

import com.cornstory.common.Search;
import com.cornstory.domain.ChatSpace;

import java.util.Map;

public interface ChatService {

    // 채팅방 개설
    public int addChatSpace(ChatSpace chatSpace) throws Exception;

    // 채팅방 조회
    public ChatSpace getChatSpace(int chatSpaceNo) throws Exception;

    // 채팅방 정보 수정
    public int updateChatSpace(ChatSpace chatSpace) throws Exception;

    // 채팅방 삭제
    public int deleteChatSpace(int chatSpaceNo) throws Exception;

    // 채팅방 목록
    public Map<String, Object> listChatSpace(Search search, String userId, String genre, int userStatus) throws Exception;

    //채팅방 입장
    public int addChatEnter(String userId, int chatSpaceNo) throws Exception;

    //채팅방 입장 여부 확인
    public ChatSpace getChatEnter(String userId, int chatSpaceNo) throws Exception;

    //채팅방 나가기, 회원 내보내기
    public int deleteChatEnter(Map map) throws Exception;

    //채팅방 회원 목록
    public Map<String, Object> listChatEnterUser(int chatSpaceNo) throws Exception;

    public int countChatEnterCheck(Map map) throws Exception;

}
