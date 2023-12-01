package com.cornstory.domain;

import java.sql.Date;

public class Support {
    private int supNo;
    private String userId;
    private int supCategory;
    private String supContent;
    private String supAnswer;
    private Date supDate;

    public int getSupNo() {
        return supNo;
    }

    public void setSupNo(int supNo) {
        this.supNo = supNo;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public int getSupCategory() {
        return supCategory;
    }

    public void setSupCategory(int supCategory) {
        this.supCategory = supCategory;
    }

    public String getSupContent() {
        return supContent;
    }

    public void setSupContent(String supContent) {
        this.supContent = supContent;
    }

    public String getSupAnswer(String s) {
        return supAnswer;
    }

    public void setSupAnswer(String supAnswer) {
        this.supAnswer = supAnswer;
    }

    public Date getSupDate() {
        return supDate;
    }

    public void setSupDate(Date supDate) {
        this.supDate = supDate;
    }

    @Override
    public String toString() {
        return "Support{" +
                "supNo=" + supNo +
                ", userId='" + userId + '\'' +
                ", supCategory=" + supCategory +
                ", supContent='" + supContent + '\'' +
                ", supAnswer='" + supAnswer + '\'' +
                ", supDate=" + supDate +
                '}';
    }
}
