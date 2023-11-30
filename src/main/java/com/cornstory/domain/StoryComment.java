package com.cornstory.domain;

import java.util.Date;

public class StoryComment {

    private int sCommentNo;
    private int storyNo;
    private String userId;
    private String sContent;
    private Date sCommentDate;
    public int getsCommentNo() {
        return sCommentNo;
    }
    public void setsCommentNo(int sCommentNo) {
        this.sCommentNo = sCommentNo;
    }
    public int getStoryNo() {
        return storyNo;
    }
    public void setStoryNo(int storyNo) {
        this.storyNo = storyNo;
    }
    public String getUserId() {
        return userId;
    }
    public void setUserId(String userId) {
        this.userId = userId;
    }
    public String getsContent() {
        return sContent;
    }
    public void setsContent(String sContent) {
        this.sContent = sContent;
    }
    public Date getsCommentDate() {
        return sCommentDate;
    }
    public void setsCommentDate(Date sCommentDate) {
        this.sCommentDate = sCommentDate;
    }

    @Override
    public String toString() {
        return "StoryComment [sCommentNo=" + sCommentNo + ", storyNo=" + storyNo + ", userId=" + userId + ", sContent="
                + sContent + ", sCommentDate=" + sCommentDate + "]";
    }



}
