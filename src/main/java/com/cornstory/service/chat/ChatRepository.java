package com.cornstory.service.chat;

import com.cornstory.domain.Chat;
import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

// MongoDB chat 컬렉션에 접근하는 인터페이스
// MongoRepository 인터페이스를 상속받아서 사용
// MongoRepository 인터페이스는 CRUD 메소드를 제공
@Repository
public interface ChatRepository extends MongoRepository<Chat, Long> {

    // MongoDB chat 컬렉션에 저장된 데이터를 조회하는 메소드

    // 채팅 저장
    public Chat save(Chat chat);

    // 채팅 삭제
    public void deleteByChatNo(Long id);

    // 채팅방 번호로 채팅 내역 개수 조회
    public int countByChatSpaceNo(int chatSpaceNo);

    // 채팅방 번호로 채팅 내역 조회, L
    public List<Chat> findByChatSpaceNo(int chatSpaceNo);

    // 채팅방 번호와 날짜로 채팅 내역 조회, L
    public List<Chat> findByChatSpaceNoAndChatDateBetween(int chatSpaceNo, String startDate, String endDate);
}
