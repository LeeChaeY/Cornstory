package com.cornstory.domain;

import org.springframework.data.annotation.Id;
import org.springframework.data.annotation.Transient;
import org.springframework.data.mongodb.core.mapping.Document;

import java.sql.Date;

@Document(collection = "chat")
public class Chat {

//    MongoDB에 저장되는 데이터의 형식을 정의하는 클래스
//    @Document(collection = "chat"): MongoDB의 chat 컬렉션에 저장되는 데이터의 형식을 정의
//    db.createCollection("chat"): MongoDB에 chat 컬렉션을 생성
//    @Id: MongoDB의 _id 필드에 해당하는 데이터를 저장
//    @Transient: MongoDB에 저장되지 않는 데이터임을 표시
//    public static final String SEQUENCE_NAME = "auto_sequence": MongoDB의 auto_sequence 컬렉션에 저장되는 데이터의 형식을 정의
//    private Long chatNo: MongoDB의 auto_sequence 컬렉션의 _id 필드에 해당하는 데이터를 저장


    @Transient
    public static final String SEQUENCE_NAME = "auto_sequence";

    @Id
    private Long chatNo;
    private int chatSpaceNo;
    private String userId;
    private String chatContent;
    private String chatDate;                // 우선 String 타입으로, MongoDB에 insert 시
                                            // 한국 시간으로 저장하는 것이 까다로움, find시에 타입 변환오류도 있었음
    private String chatImage;

    public Chat() {
    }

    public Chat(int chatSpaceNo, String userId, String chatContent, String chatDate) {
        this.chatSpaceNo = chatSpaceNo;
        this.userId = userId;
        this.chatContent = chatContent;
        this.chatDate = chatDate;
    }

    public Chat(int chatSpaceNo, String userId, String chatContent, String chatDate, String chatImage) {
        this.chatSpaceNo = chatSpaceNo;
        this.userId = userId;
        this.chatContent = chatContent;
        this.chatDate = chatDate;
        this.chatImage = chatImage;
    }

    public Long getChatNo() {
        return chatNo;
    }

    public void setChatNo(Long chatNo) {
        this.chatNo = chatNo;
    }

    public int getChatSpaceNo() {
        return chatSpaceNo;
    }

    public void setChatSpaceNo(int chatSpaceNo) {
        this.chatSpaceNo = chatSpaceNo;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getChatContent() {
        return chatContent;
    }

    public void setChatContent(String chatContent) {
        this.chatContent = chatContent;
    }

    public String getChatDate() {
        return chatDate;
    }

    public void setChatDate(String chatDate) {
        this.chatDate = chatDate;
    }

    public String getChatImage() {
        return chatImage;
    }

    public void setChatImage(String chatImage) {
        this.chatImage = chatImage;
    }

    @Override
    public String toString() {
        return "Chat{" +
                "chatNo=" + chatNo +
                ", chatSpaceNo=" + chatSpaceNo +
                ", userId='" + userId + '\'' +
                ", chatContent='" + chatContent + '\'' +
                ", chatDate='" + chatDate + '\'' +
                ", chatImage='" + chatImage + '\'' +
                '}';
    }
}
