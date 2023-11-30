package com.cornstory.domain;

public class Bookmark {

    private int bookmarkNo;
    private String userId;
    private int workNo;

    public int getBookmarkNo() {
        return bookmarkNo;
    }

    public void setBookmarkNo(int bookmarkNo) {
        this.bookmarkNo = bookmarkNo;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public int getWorkNo() {
        return workNo;
    }

    public void setWorkNo(int workNo) {
        this.workNo = workNo;
    }

    @Override
    public String toString() {
        return "Bookmark{" +
                "bookmarkNo=" + bookmarkNo +
                ", userId='" + userId + '\'' +
                ", workNo=" + workNo +
                '}';
    }
}
