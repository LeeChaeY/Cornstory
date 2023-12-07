package com.cornstory.service.chat;

import com.cornstory.common.Search;
import com.cornstory.domain.Chat;
import com.cornstory.domain.ChatSpace;

import java.util.List;
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
    public Map<String, Object> listChatSpace(Search search, String userId, String genre, String enterUserId) throws Exception;

    //채팅방 입장
    public int addChatEnter(String userId, int chatSpaceNo) throws Exception;

    //채팅방 입장 여부 확인
    public ChatSpace getChatEnter(String userId, int chatSpaceNo) throws Exception;

    //채팅방 나가기, 회원 내보내기
    public int deleteChatEnter(Map map) throws Exception;

    //채팅방 회원 목록
    public Map<String, Object> listChatEnterUser(int chatSpaceNo) throws Exception;

    public int countChatEnterCheck(Map map) throws Exception;



    public Chat addChat(Chat chat) throws Exception;            //save, controller 단에서 chatDate 현재 시간으로 지정

    public void deleteChat(Long chatNo) throws Exception;       //delete

    //selectList, controller 단에서 endDate 현재 시간, 특정 시간으로 지정
    public Map<String, Object> listChat(int chatSpaceNo, String startDate, String endDate) throws Exception;
}
