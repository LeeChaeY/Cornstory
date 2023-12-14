package com.cornstory.domain;

import java.sql.Date;

public class Product {
	
	private int prodNo;
	private Integer workNo;			// 팝콘이면 null
	private Integer episodeNo;		// 팝콘, 저작권이면 null
	private String userId;		// 등록한 회원 아이디, 팝콘은 
	private int prodCategory;	// 0 : 팝콘, 1: 작품 회차, 2: 저작권
	private String prodName;	// 작품 회차는 작품 이름+작품회차+'회차', 팝콘은 팝콘 수량+'개', 저작권은 작품 이름 + ' 저작권'
	private String workName;	// 목록에서 작품명 보여줄 때를 위한 필드
	private Integer episodeOrder;	// 작품 회차는 회차 순서, 저작권은 작품 완결 회차
	private String prodImage;
	private int prodPrice;		// 팝콘은 단위가 원, 작품 회차, 저작권 단위는 팝콘
	private int prodCnt;		// 작품 회차, 저작권의 상품 수량은 1
	private Date prodDate;		// yyyy-MM-dd

	private String nickname;

	public Product() {
		// TODO Auto-generated constructor stub
	}

	public Product(int prodNo, int prodPrice) {
		this.prodNo = prodNo;
		this.prodPrice = prodPrice;
	}

	public Product(int prodNo, String prodImage, int prodPrice, int prodCnt) {
		this.prodNo = prodNo;
		this.prodImage = prodImage;
		this.prodPrice = prodPrice;
		this.prodCnt = prodCnt;
	}

	public Product(String userId, int prodCategory, String prodName,
				   String prodImage, int prodPrice, int prodCnt) {
		super();
		this.userId = userId;
		this.prodCategory = prodCategory;
		this.prodName = prodName;
		this.prodImage = prodImage;
		this.prodPrice = prodPrice;
		this.prodCnt = prodCnt;
		this.prodDate = prodDate;
	}

	public Product(Integer workNo, String userId, int prodCategory, String prodName,
				   Integer episodeOrder, String prodImage, int prodPrice) {
		super();
		this.workNo = workNo;
		this.userId = userId;
		this.prodCategory = prodCategory;
		this.prodName = prodName;
		this.episodeOrder = episodeOrder;
		this.prodImage = prodImage;
		this.prodPrice = prodPrice;
		this.prodDate = prodDate;
	}

	public Product(Integer workNo, Integer episodeNo, String userId, int prodCategory, String prodName,
				   Integer episodeOrder, String prodImage, int prodPrice) {
		super();
		this.workNo = workNo;
		this.episodeNo = episodeNo;
		this.userId = userId;
		this.prodCategory = prodCategory;
		this.prodName = prodName;
		this.episodeOrder = episodeOrder;
		this.prodImage = prodImage;
		this.prodPrice = prodPrice;
		this.prodDate = prodDate;
	}

	public Product(int prodNo, Integer workNo, Integer episodeNo, String userId, int prodCategory,
				   String prodName, String workName, Integer episodeOrder, String prodImage,
				   int prodPrice, int prodCnt, Date prodDate) {
		this.prodNo = prodNo;
		this.workNo = workNo;
		this.episodeNo = episodeNo;
		this.userId = userId;
		this.prodCategory = prodCategory;
		this.prodName = prodName;
		this.workName = workName;
		this.episodeOrder = episodeOrder;
		this.prodImage = prodImage;
		this.prodPrice = prodPrice;
		this.prodCnt = prodCnt;
		this.prodDate = prodDate;
	}

	public int getProdNo() {
		return prodNo;
	}

	public void setProdNo(int prodNo) {
		this.prodNo = prodNo;
	}

	public Integer getWorkNo() {
		return workNo;
	}

	public void setWorkNo(Integer workNo) {
		this.workNo = workNo;
	}

	public Integer getEpisodeNo() {
		return episodeNo;
	}

	public void setEpisodeNo(Integer episodeNo) {
		this.episodeNo = episodeNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public int getProdCategory() {
		return prodCategory;
	}

	public void setProdCategory(int prodCategory) {
		this.prodCategory = prodCategory;
	}

	public String getProdName() {
		return prodName;
	}

	public void setProdName(String prodName) {
		this.prodName = prodName;
	}

	public String getWorkName() {
		return workName;
	}

	public void setWorkName(String workName) {
		this.workName = workName;
	}

	public Integer getEpisodeOrder() {
		return episodeOrder;
	}

	public void setEpisodeOrder(Integer episodeOrder) {
		this.episodeOrder = episodeOrder;
	}

	public String getProdImage() {
		return prodImage;
	}

	public void setProdImage(String prodImage) {
		this.prodImage = prodImage;
	}

	public int getProdPrice() {
		return prodPrice;
	}

	public void setProdPrice(int prodPrice) {
		this.prodPrice = prodPrice;
	}

	public int getProdCnt() {
		return prodCnt;
	}

	public void setProdCnt(int prodCnt) {
		this.prodCnt = prodCnt;
	}

	public Date getProdDate() {
		return prodDate;
	}

	public void setProdDate(Date prodDate) {
		this.prodDate = prodDate;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	@Override
	public String toString() {
		return "Product{" +
				"prodNo=" + prodNo +
				", workNo=" + workNo +
				", episodeNo=" + episodeNo +
				", userId='" + userId + '\'' +
				", prodCategory=" + prodCategory +
				", prodName='" + prodName + '\'' +
				", workName='" + workName + '\'' +
				", episodeOrder=" + episodeOrder +
				", prodImage='" + prodImage + '\'' +
				", prodPrice=" + prodPrice +
				", prodCnt=" + prodCnt +
				", prodDate=" + prodDate +
				", nickname='" + nickname + '\'' +
				'}';
	}
}
