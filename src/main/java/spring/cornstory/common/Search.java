package spring.cornstory.common;


public class Search {
	
	private int currentPage; 
	private String searchCondition; // 0�̸� id�� �˻�, 1�̸� �̸����� �˻�
	private String searchKeyword; //id or name
	private String orderCondition;
	private String orderKeyword;
	private int pageSize; //pageSize
	
	public Search(){
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