package com.cornstory.domain;

import java.util.Date;

public class EpisodeComment {

    //작품 회차 댓글No
    private int commentNo;
    //작품 회차 No
    private int episodeNo;
    //작품 No
    private int workNo;
    //회원아이디
    private String userId;
    //댓글 내용
    private String content;
    //댓글 등록일
    private Date commentDate;

    public int getEpisodeNo() {
        return episodeNo;
    }
    public void setEpisodeNo(int episodeNo) {
        this.episodeNo = episodeNo;
    }
    public int getWorkNo() {
        return workNo;
    }
    public void setWorkNo(int workNo) {
        this.workNo = workNo;
    }
    public String getUserId() {
        return userId;
    }
    public void setUserId(String userId) {
        this.userId = userId;
    }

    public int getCommentNo() {
        return commentNo;
    }

    public void setCommentNo(int commentNo) {
        this.commentNo = commentNo;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getCommentDate() {
        return commentDate;
    }

    public void setCommentDate(Date commentDate) {
        this.commentDate = commentDate;
    }

    @Override
    public String toString() {
        return "EpisodeComment [commentNo=" + commentNo + ", episodeNo=" + episodeNo + ", workNo=" + workNo
                + ", userId=" + userId + ", content=" + content + ", commentDate=" + commentDate + "]";
    }



}
