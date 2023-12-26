package com.cornstory.domain;

import java.sql.Date;
import java.sql.Timestamp;

public class ChatSpace {

	// 채팅방, 채팅 입장에 대한 정보를 담는 VO 클래스

	private int chatSpaceNo;
	private String userId;			// 채팅방 개설한 회원 아이디, 팝콘은
	private String cSpaceName;
	private String cSpaceImage;		// 채팅방 이미지, 설정 안하면 기본 이미지
	private int cSpaceUserCnt;	// 채팅방에 입장한 회원수
	private Date cSpaceDate;		// 채팅방 개설 날짜, yyyy-MM-dd
	private String genre;			// 채팅방 장르, 1개만 선택
	private String nickname;
	private String userImage;
	private int chatEnterNo;
	private Timestamp chatEnterDate;		// 입장 시간, yyyy-MM-dd hh:mm:ss

	private int chatEnterCheck;		// 채팅방 입장 여부, 0: 입장 안함, 1: 입장함

	public ChatSpace() {
		// TODO Auto-generated constructor stub
	}

	public ChatSpace(int chatSpaceNo) {
		this.chatSpaceNo = chatSpaceNo;
	}

	public ChatSpace(String userId, String cSpaceName, String cSpaceImage, String genre) {
		this.userId = userId;
		this.cSpaceName = cSpaceName;
		this.cSpaceImage = cSpaceImage;
		this.genre = genre;
	}

	public ChatSpace(int chatSpaceNo, String cSpaceName, String cSpaceImage) {
		this.chatSpaceNo = chatSpaceNo;
		this.cSpaceName = cSpaceName;
		this.cSpaceImage = cSpaceImage;
	}

	public ChatSpace(int chatSpaceNo, int cSpaceUserCnt) {
		this.chatSpaceNo = chatSpaceNo;
		this.cSpaceUserCnt = cSpaceUserCnt;
	}

	public ChatSpace(int chatSpaceNo, String userId) {
		this.chatSpaceNo = chatSpaceNo;
		this.userId = userId;
	}

	public ChatSpace(int chatSpaceNo, String userId, String cSpaceName, String cSpaceImage,
					 int cSpaceUserCnt, Date cSpaceDate, String genre, String nickname,
					 String userImage, int chatEnterNo, Timestamp chatEnterDate) {
		this.chatSpaceNo = chatSpaceNo;
		this.userId = userId;
		this.cSpaceName = cSpaceName;
		this.cSpaceImage = cSpaceImage;
		this.cSpaceUserCnt = cSpaceUserCnt;
		this.cSpaceDate = cSpaceDate;
		this.genre = genre;
		this.nickname = nickname;
		this.userImage = userImage;
		this.chatEnterNo = chatEnterNo;
		this.chatEnterDate = chatEnterDate;
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

	public String getcSpaceName() {
		return cSpaceName;
	}

	public void setcSpaceName(String cSpaceName) {
		this.cSpaceName = cSpaceName;
	}

	public String getcSpaceImage() {
		return cSpaceImage;
	}

	public void setcSpaceImage(String cSpaceImage) {
		this.cSpaceImage = cSpaceImage;
	}

	public int getcSpaceUserCnt() {
		return cSpaceUserCnt;
	}

	public void setcSpaceUserCnt(int cSpaceUserCnt) {
		this.cSpaceUserCnt = cSpaceUserCnt;
	}

	public Date getcSpaceDate() {
		return cSpaceDate;
	}

	public void setcSpaceDate(Date cSpaceDate) {
		this.cSpaceDate = cSpaceDate;
	}

	public String getGenre() {
		return genre;
	}

	public void setGenre(String genre) {
		this.genre = genre;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getUserImage() {
		return userImage;
	}

	public void setUserImage(String userImage) {
		this.userImage = userImage;
	}

	public int getChatEnterNo() {
		return chatEnterNo;
	}

	public void setChatEnterNo(int chatEnterNo) {
		this.chatEnterNo = chatEnterNo;
	}

	public Timestamp getChatEnterDate() {
		return chatEnterDate;
	}

	public void setChatEnterDate(Timestamp chatEnterDate) {
		this.chatEnterDate = chatEnterDate;
	}

	public int getChatEnterCheck() {
		return chatEnterCheck;
	}

	public void setChatEnterCheck(int chatEnterCheck) {
		this.chatEnterCheck = chatEnterCheck;
	}

	@Override
	public String toString() {
		return "ChatSpace{" +
				"chatSpaceNo=" + chatSpaceNo +
				", userId='" + userId + '\'' +
				", cSpaceName='" + cSpaceName + '\'' +
				", cSpaceImage='" + cSpaceImage + '\'' +
				", cSpaceUserCnt=" + cSpaceUserCnt +
				", cSpaceDate=" + cSpaceDate +
				", genre='" + genre + '\'' +
				", nickname='" + nickname + '\'' +
				", userImage='" + userImage + '\'' +
				", chatEnterNo=" + chatEnterNo +
				", chatEnterDate=" + chatEnterDate +
				", chatEnterCheck=" + chatEnterCheck +
				'}';
	}

}
