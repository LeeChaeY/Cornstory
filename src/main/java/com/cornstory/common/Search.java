package com.cornstory.common;


public class Search {
	
	private int currentPage; 
	private String searchCondition;
	private String searchKeyword;
	private String orderCondition;
	private String orderKeyword;
	private int pageSize;

	private int offset;

	public Search(){
	}

	public int getOffset() {
		return offset;
	}

	public void setOffset(int offset) {
		this.offset = offset;
	}

	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public String getSearchCondition() {
		return searchCondition;
	}
	public void setSearchCondition(String searchCondition) {
		this.searchCondition = searchCondition;
	}
	public String getSearchKeyword() {
		return searchKeyword;
	}
	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}
	public String getOrderCondition() {
		return orderCondition;
	}
	public void setOrderCondition(String orderCondition) {
		this.orderCondition = orderCondition;
	}
	public String getOrderKeyword() {
		return orderKeyword;
	}
	public void setOrderKeyword(String orderKeyword) {
		this.orderKeyword = orderKeyword;
	}
	
	@Override
	public String toString() {
		return "Search [currentPage=" + currentPage + ", searchCondition="
				+ searchCondition + ", searchKeyword=" + searchKeyword
				+ ", orderCondition=" + orderCondition + ", orderKeyword=" + orderKeyword
				+ ", pageSize=" + pageSize + "]";
	}
}