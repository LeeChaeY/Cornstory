package com.cornstory.domain;

import java.sql.Date;

public class Product {
	
	private int prodNo;
	private int workNo;			// 팝콘이면 null
	private int episodeNo;		// 팝콘, 저작권이면 null
	private String userId;		// 등록한 회원 아이디, 팝콘은 
	private int prodCategory;	// 0 : 팝콘, 1: 작품 회차, 2: 저작권
	private String prodName;	// 작품 회차는 작품 이름, 팝콘은 팝콘 수량+개, 저작권은 작품 이름 + 저작권
	private int prodPrice;		// 팝콘은 단위가 원, 작품 회차, 저작권 단위는 팝콘
	private int prodCnt;		// 작품 회차, 저작권의 상품 수량은 1
	private String prodImage;	
	private Date prodDate;		// yyyy-MM-dd

	public Product() {
		// TODO Auto-generated constructor stub
	}
	
	public Product(String userId, int prodCategory, String prodName,
			int prodPrice, int prodCnt, String prodImage, Date prodDate) {
		super();
		this.userId = userId;
		this.prodCategory = prodCategory;
		this.prodName = prodName;
		this.prodPrice = prodPrice;
		this.prodCnt = prodCnt;
		this.prodImage = prodImage;
		this.prodDate = prodDate;
	}

	public Product(int workNo, int episodeNo, String userId, int prodCategory, String prodName,
			int prodPrice, int prodCnt, String prodImage, Date prodDate) {
		super();
		this.workNo = workNo;
		this.episodeNo = episodeNo;
		this.userId = userId;
		this.prodCategory = prodCategory;
		this.prodName = prodName;
		this.prodPrice = prodPrice;
		this.prodCnt = prodCnt;
		this.prodImage = prodImage;
		this.prodDate = prodDate;
	}
	
	public Product(int prodNo, int workNo, int episodeNo, String userId, int prodCategory, String prodName,
			int prodPrice, int prodCnt, String prodImage, Date prodDate) {
		super();
		this.prodNo = prodNo;
		this.workNo = workNo;
		this.episodeNo = episodeNo;
		this.userId = userId;
		this.prodCategory = prodCategory;
		this.prodName = prodName;
		this.prodPrice = prodPrice;
		this.prodCnt = prodCnt;
		this.prodImage = prodImage;
		this.prodDate = prodDate;
	}

	public int getProdNo() {
		return prodNo;
	}

	public void setProdNo(int prodNo) {
		this.prodNo = prodNo;
	}

	public int getWorkNo() {
		return workNo;
	}

	public void setWorkNo(int workNo) {
		this.workNo = workNo;
	}

	public int getEpisodeNo() {
		return episodeNo;
	}

	public void setEpisodeNo(int episodeNo) {
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

	public String getProdImage() {
		return prodImage;
	}

	public void setProdImage(String prodImage) {
		this.prodImage = prodImage;
	}

	public Date getProdDate() {
		return prodDate;
	}

	public void setProdDate(Date prodDate) {
		this.prodDate = prodDate;
	}

	@Override
	public String toString() {
		return "Product [prodNo=" + prodNo + ", workNo=" + workNo + ", episodeNo=" + episodeNo + ", userId=" + userId
				+ ", prodCategory=" + prodCategory + ", prodName=" + prodName + ", prodPrice=" + prodPrice
				+ ", prodCnt=" + prodCnt + ", prodImage=" + prodImage + ", prodDate=" + prodDate + "]";
	}
	

}
