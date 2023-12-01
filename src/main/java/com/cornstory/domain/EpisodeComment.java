package com.cornstory.domain;

import java.util.Date;

public class EpisodeComment {

    //작품 회차 댓글No
    private int eCommentNo;
    //작품 회차 No
    private int episodeNo;
    //작품 No
    private int workNo;
    //회원아이디
    private String userId;
    //댓글 내용
    private String eContent;
    //댓글 등록일
    private Date eCommentDate;
    public int getECommentNo() {
        return eCommentNo;
    }
    public void setECommentNo(int eCommentNo) {
        this.eCommentNo = eCommentNo;
    }
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
    public String getEContent() {
        return eContent;
    }
    public void setEContent(String eContent) {
        this.eContent = eContent;
    }
    public Date getECommentDate() {
        return eCommentDate;
    }
    public void setECommentDate(Date eCommentDate) {
        this.eCommentDate = eCommentDate;
    }
    @Override
    public String toString() {
        return "EpisodeComment [eCommentNo=" + eCommentNo + ", episodeNo=" + episodeNo + ", workNo=" + workNo
                + ", userId=" + userId + ", eContent=" + eContent + ", eCommentDate=" + eCommentDate + "]";
    }



}
