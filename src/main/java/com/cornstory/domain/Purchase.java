package com.cornstory.domain;

import java.sql.Date;

public class Purchase {

	private int tranNo;
	private int prodNo;
	private String sellerId;			// 판매한 회원 아이디, product에서 가져오기
	private String buyerId;			// 구매한 회원 아이디
	private int tranCategory;		// 0 : 팝콘, 1: 작품 회차, 2: 저작권, product꺼 그대로 가져오기
	private String tranMethod;
	private int tranCnt;			// 팝콘은 팝콘 수량, 작품 회차, 저작권은 디폴트 1
	private int prodCnt;
	private int bfPopcornCnt;		// 구매 전 회원이 보유한 팝콘수, 회원에서 정보 가져오기
	private int afPopcornCnt;		// 구매 후 회원의 팝콘수, 팝콘은 bfPopcornCnt+상품 수량, 작품 회차, 저작권은 bfPopcornCnt-상품 가격
	private Integer episodeOrder;	// 작품 회차는 회차 순서, 저작권은 작품 완결 회차, product꺼 그대로 가져오기
	private int prodPrice;			// 팝콘은 단위가 원, 작품 회차, 저작권 단위는 팝콘, product꺼 그대로 가져오기
	private Date tranDate;			// yyyy-MM-dd
	private int category;			// 0 : 웹소설, 1 : 웹툰, 2 : 웹드라마, work에서 가져와서 저장
	private String workName;		// 작품명, work에서 가져와서 저장
	private String nickname;		// 구매한 회원 닉네임, user에서 가져와서 저장, 관리자가 전체 구매내역 볼때 회원 닉네임 필요

	public Purchase() {
		// TODO Auto-generated constructor stub
	}

	public Purchase(int prodNo, String sellerId, String buyerId, int tranCategory, String tranMethod,
					int tranCnt, int bfPopcornCnt, int afPopcornCnt, int prodPrice) {
		this.prodNo = prodNo;
		this.sellerId = sellerId;
		this.buyerId = buyerId;
		this.tranCategory = tranCategory;
		this.tranMethod = tranMethod;
		this.tranCnt = tranCnt;
		this.bfPopcornCnt = bfPopcornCnt;
		this.afPopcornCnt = afPopcornCnt;
		this.prodPrice = prodPrice;
	}

	public Purchase(int prodNo, String sellerId, String buyerId, int tranCategory, String tranMethod,
					int bfPopcornCnt, int afPopcornCnt, Integer episodeOrder, int prodPrice) {
		this.prodNo = prodNo;
		this.sellerId = sellerId;
		this.buyerId = buyerId;
		this.tranCategory = tranCategory;
		this.tranMethod = tranMethod;
		this.bfPopcornCnt = bfPopcornCnt;
		this.afPopcornCnt = afPopcornCnt;
		this.episodeOrder = episodeOrder;
		this.prodPrice = prodPrice;
	}

	public Purchase(int prodNo, String sellerId, String buyerId, int tranCategory, String tranMethod,
					int tranCnt, int bfPopcornCnt, int afPopcornCnt, Integer episodeOrder,
					int prodPrice) {
		this.prodNo = prodNo;
		this.sellerId = sellerId;
		this.buyerId = buyerId;
		this.tranCategory = tranCategory;
		this.tranMethod = tranMethod;
		this.tranCnt = tranCnt;
		this.bfPopcornCnt = bfPopcornCnt;
		this.afPopcornCnt = afPopcornCnt;
		this.episodeOrder = episodeOrder;
		this.prodPrice = prodPrice;
	}

	public Purchase(int tranNo, int prodNo, String sellerId, String buyerId, int tranCategory, String tranMethod,
					int tranCnt, int bfPopcornCnt, int afPopcornCnt, Integer episodeOrder,
					int prodPrice, Date tranDate, int category, String workName, String nickname) {
		this.tranNo = tranNo;
		this.prodNo = prodNo;
		this.sellerId = sellerId;
		this.buyerId = buyerId;
		this.tranCategory = tranCategory;
		this.tranMethod = tranMethod;
		this.tranCnt = tranCnt;
		this.bfPopcornCnt = bfPopcornCnt;
		this.afPopcornCnt = afPopcornCnt;
		this.episodeOrder = episodeOrder;
		this.prodPrice = prodPrice;
		this.tranDate = tranDate;
		this.category = category;
		this.workName = workName;
		this.nickname = nickname;
	}

	public int getTranNo() {
		return tranNo;
	}

	public void setTranNo(int tranNo) {
		this.tranNo = tranNo;
	}

	public int getProdNo() {
		return prodNo;
	}

	public void setProdNo(int prodNo) {
		this.prodNo = prodNo;
	}

	public String getSellerId() {
		return sellerId;
	}

	public void setSellerId(String sellerId) {
		this.sellerId = sellerId;
	}

	public String getBuyerId() {
		return buyerId;
	}

	public void setBuyerId(String buyerId) {
		this.buyerId = buyerId;
	}

	public int getTranCategory() {
		return tranCategory;
	}

	public void setTranCategory(int tranCategory) {
		this.tranCategory = tranCategory;
	}

	public String getTranMethod() {
		return tranMethod;
	}

	public void setTranMethod(String tranMethod) {
		this.tranMethod = tranMethod;
	}

	public int getTranCnt() {
		return tranCnt;
	}

	public void setTranCnt(int tranCnt) {
		this.tranCnt = tranCnt;
	}

	public int getProdCnt() {
		return prodCnt;
	}

	public void setProdCnt(int prodCnt) {
		this.prodCnt = prodCnt;
	}

	public int getBfPopcornCnt() {
		return bfPopcornCnt;
	}

	public void setBfPopcornCnt(int bfPopcornCnt) {
		this.bfPopcornCnt = bfPopcornCnt;
	}

	public int getAfPopcornCnt() {
		return afPopcornCnt;
	}

	public void setAfPopcornCnt(int afPopcornCnt) {
		this.afPopcornCnt = afPopcornCnt;
	}

	public Integer getEpisodeOrder() {
		return episodeOrder;
	}

	public void setEpisodeOrder(Integer episodeOrder) {
		this.episodeOrder = episodeOrder;
	}

	public int getProdPrice() {
		return prodPrice;
	}

	public void setProdPrice(int prodPrice) {
		this.prodPrice = prodPrice;
	}

	public Date getTranDate() {
		return tranDate;
	}

	public void setTranDate(Date tranDate) {
		this.tranDate = tranDate;
	}

	public int getCategory() {
		return category;
	}

	public void setCategory(int category) {
		this.category = category;
	}

	public String getWorkName() {
		return workName;
	}

	public void setWorkName(String workName) {
		this.workName = workName;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	@Override
	public String toString() {
		return "Purchase{" +
				"tranNo=" + tranNo +
				", prodNo=" + prodNo +
				", sellerId='" + sellerId + '\'' +
				", buyerId='" + buyerId + '\'' +
				", tranCategory=" + tranCategory +
				", tranMethod=" + tranMethod +
				", tranCnt=" + tranCnt +
				", prodCnt=" + prodCnt +
				", bfPopcornCnt=" + bfPopcornCnt +
				", afPopcornCnt=" + afPopcornCnt +
				", episodeOrder=" + episodeOrder +
				", prodPrice=" + prodPrice +
				", tranDate=" + tranDate +
				", category=" + category +
				", workName='" + workName + '\'' +
				", nickname='" + nickname + '\'' +
				'}';
	}
}
