package com.cornstory.domain;

import java.sql.Date;

//==>회원정보를 모델링(추상화/캡슐화)한 Bean
public class User {
	
	//Field
	private String userId; 	// 회원 아이디
	private int role;			// 회원 구분 0: 회원 1: 관리자
	private String userName; 	// 회원 이름
	private String nickName; 	// 회원 닉네임
	private String password; 	// 회원 비밀번호
	private Date birthday; 		// 회원 생년 월일
	private String addr;		// 주소
	private String address;		// 상세 주소
	private String phone;		// 전화번호
	private String email;		// 이메일
	private String userImage;	// 회원 사진
	private int popcornCnt;	// 보유한 팝콘수
	private Date rDate;		// 회원 가입일
	private Date banDate;		// 회원 가입일
	private int social;		//소셜 연동 여부
	///Constructor
	public User(){}

	//Method


	@Override
	public String toString() {
		return "User{" +
				"userId='" + userId + '\'' +
				", role=" + role +
				", userName='" + userName + '\'' +
				", nickName='" + nickName + '\'' +
				", password='" + password + '\'' +
				", birthday=" + birthday +
				", addr='" + addr + '\'' +
				", address='" + address + '\'' +
				", phone='" + phone + '\'' +
				", email='" + email + '\'' +
				", userImage='" + userImage + '\'' +
				", popcornCnt=" + popcornCnt +
				", rDate=" + rDate +
				", banDate=" + banDate +
				", social=" + social +
				'}';
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public int getRole() {
		return role;
	}

	public void setRole(int role) {
		this.role = role;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Date getBirthday() {
		return birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getUserImage() {
		return userImage;
	}

	public void setUserImage(String userImage) {
		this.userImage = userImage;
	}

	public int getPopcornCnt() {
		return popcornCnt;
	}

	public void setPopcornCnt(int popcornCnt) {
		this.popcornCnt = popcornCnt;
	}

	public Date getrDate() {
		return rDate;
	}

	public void setrDate(Date rDate) {
		this.rDate = rDate;
	}

	public Date getBanDate() {
		return banDate;
	}

	public void setBanDate(Date banDate) {
		this.banDate = banDate;
	}

	public int getSocial() {
		return social;
	}

	public void setSocial(int social) {
		this.social = social;
	}
}