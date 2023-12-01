package com.cornstory.domain;

import java.sql.Date;

public class Work {
    private int workNo;
    private String userId;
    private int category;
    private String genre1;
    private String genre2;
    private String genre3;
    private int fap;
    private String workName;
    private String note;
    private String thumbnail;
    private int viewCnt;
    private Date workDate;
    private int status;
    private String workDesc;
    private int complete;

    // 생성자, getter 및 setter 메서드는 생략하였습니다.


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

    public int getCategory() {
        return category;
    }

    public void setCategory(int category) {
        this.category = category;
    }

    public String getGenre1() {
        return genre1;
    }

    public void setGenre1(String genre1) {
        this.genre1 = genre1;
    }

    public String getGenre2() {
        return genre2;
    }

    public void setGenre2(String genre2) {
        this.genre2 = genre2;
    }

    public String getGenre3() {
        return genre3;
    }

    public void setGenre3(String genre3) {
        this.genre3 = genre3;
    }

    public int getFap() {
        return fap;
    }

    public void setFap(int fap) {
        this.fap = fap;
    }

    public String getWorkName() {
        return workName;
    }

    public void setWorkName(String workName) {
        this.workName = workName;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public String getThumbnail() {
        return thumbnail;
    }

    public void setThumbnail(String thumbnail) {
        this.thumbnail = thumbnail;
    }

    public int getViewCnt() {
        return viewCnt;
    }

    public void setViewCnt(int viewCnt) {
        this.viewCnt = viewCnt;
    }

    public Date getWorkDate() {
        return workDate;
    }

    public void setWorkDate(Date workDate) {
        this.workDate = workDate;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getWorkDesc() {
        return workDesc;
    }

    public void setWorkDesc(String workDesc) {
        this.workDesc = workDesc;
    }

    public int getComplete() {
        return complete;
    }

    public void setComplete(int complete) {
        this.complete = complete;
    }

    @Override
    public String toString() {
        return "Work{" +
                "workNo=" + workNo +
                ", userId='" + userId + '\'' +
                ", category=" + category +
                ", genre1='" + genre1 + '\'' +
                ", genre2='" + genre2 + '\'' +
                ", genre3='" + genre3 + '\'' +
                ", fap=" + fap +
                ", workName='" + workName + '\'' +
                ", note='" + note + '\'' +
                ", thumbnail='" + thumbnail + '\'' +
                ", viewCnt=" + viewCnt +
                ", workDate=" + workDate +
                ", status=" + status +
                ", workDesc='" + workDesc + '\'' +
                ", complete=" + complete +
                '}';
    }
}

