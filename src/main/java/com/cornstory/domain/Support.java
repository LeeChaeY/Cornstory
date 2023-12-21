package com.cornstory.domain;

import java.sql.Date;

public class Support {
    private int supNo;
    private String supName;
    private String userId;
    private String supId;
    private int supCategory;
    private String supContent;
    private String supPluscon;
    private String supImage;
    private Date supDate;
    private int supBan;

    public Support() {
    }

    public int getSupNo() {
        return supNo;
    }

    public void setSupNo(int supNo) {
        this.supNo = supNo;
    }

    public String getSupName() {
        return supName;
    }

    public void setSupName(String supName) {
        this.supName = supName;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getSupId() {
        return supId;
    }

    public void setSupId(String supId) {
        this.supId = supId;
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

    public String getSupPluscon() {
        return supPluscon;
    }

    public void setSupPluscon(String supPluscon) {
        this.supPluscon = supPluscon;
    }

    public String getSupImage() {
        return supImage;
    }

    public void setSupImage(String supImage) {
        this.supImage = supImage;
    }

    public Date getSupDate() {
        return supDate;
    }

    public void setSupDate(Date supDate) {
        this.supDate = supDate;
    }

    public int getSupBan() {
        return supBan;
    }

    public void setSupBan(int supBan) {
        this.supBan = supBan;
    }

    @Override
    public String toString() {
        return "Support{" +
                "supNo=" + supNo +
                ", supName='" + supName + '\'' +
                ", userId='" + userId + '\'' +
                ", supId='" + supId + '\'' +
                ", supCategory=" + supCategory +
                ", supContent='" + supContent + '\'' +
                ", supPluscon='" + supPluscon + '\'' +
                ", supImage='" + supImage + '\'' +
                ", supDate=" + supDate +
                ", supBan=" + supBan +
                '}';
    }
}
