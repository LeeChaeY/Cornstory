package com.cornstory.domain;

import java.sql.Date;

//==>회원정보를 모델링(추상화/캡슐화)한 Bean
public class User {
	
	//Field
	private String user_id; 	// 회원 아이디
	private int role;			// 회원 구분 0: 회원 1: 관리자
	private String user_name; 	// 회원 이름
	private String nickname; 	// 회원 닉네임
	private String password; 	// 회원 비밀번호
	private Date birthday; 		// 회원 생년 월일
	private String addr;		// 주소
	private String address;		// 상세 주소
	private String phone;		// 전화번호
	private String email;		// 이메일
	private String user_image;	// 회원 사진
	private int popcorn_cnt;	// 보유한 팝콘수
	private Date r_Date;		// 회원 가입일
	
	///Constructor
	public User(){}
	
	//Method
	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public int getRole() {
		return role;
	}

	public void setRole(int role) {
		this.role = role;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
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

	public String getUser_image() {
		return user_image;
	}

	public void setUser_image(String user_image) {
		this.user_image = user_image;
	}

	public int getPopcorn_cnt() {
		return popcorn_cnt;
	}

	public void setPopcorn_cnt(int popcorn_cnt) {
		this.popcorn_cnt = popcorn_cnt;
	}

	public Date getR_Date() {
		return r_Date;
	}

	public void setR_Date(Date r_Date) {
		this.r_Date = r_Date;
	}

	@Override
	public String toString() {
		return "User [user_id=" + user_id + ", role=" + role + ", user_name=" + user_name + ", nickname=" + nickname
				+ ", password=" + password + ", birthday=" + birthday + ", addr=" + addr + ", address=" + address
				+ ", phone=" + phone + ", email=" + email + ", user_image=" + user_image + ", popcorn_cnt="
				+ popcorn_cnt + ", r_Date=" + r_Date + "]";
	}
	
	
}