package com.cornstory.domain;

import java.util.Date;

public class Story {

    //스토리 No
    private int storyNo;
    //회원 아이디
    private String userId;
    //스토리명
    private String storyName;
    //스토리 내용
    private String storyContent;
    //스토리 등록일
    private Date storyDate;
    //스토리 이미지명
    private String storyImage;
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
    public String getStoryName() {
        return storyName;
    }
    public void setStoryName(String storyName) {
        this.storyName = storyName;
    }
    public String getStoryContent() {
        return storyContent;
    }
    public void setStoryContent(String storyContent) {
        this.storyContent = storyContent;
    }
    public Date getStoryDate() {
        return storyDate;
    }
    public void setStoryDate(Date storyDate) {
        this.storyDate = storyDate;
    }
    public String getStoryImage() {
        return storyImage;
    }
    public void setStoryImage(String storyImage) {
        this.storyImage = storyImage;
    }
    @Override
    public String toString() {
        return "Story [storyNo=" + storyNo + ", userId=" + userId + ", storyName=" + storyName + ", storyContent="
                + storyContent + ", storyDate=" + storyDate + ", storyImage=" + storyImage + "]";
    }



}
