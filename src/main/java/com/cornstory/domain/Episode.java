package com.cornstory.domain;

import java.io.Serializable;
import java.util.Date;

public class Episode{

    private int episodeNo;
    private int workNo;
    private String episodeName;
    private int episodeOrder;
    private String eThumbnail;
    private Date episodeDate;
    private String fileName;
    private String directory;

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
    public String getEpisodeName() {
        return episodeName;
    }
    public void setEpisodeName(String episodeName) {
        this.episodeName = episodeName;
    }
    public int getEpisodeOrder() {
        return episodeOrder;
    }
    public void setEpisodeOrder(int episodeOrder) {
        this.episodeOrder = episodeOrder;
    }
    public Date getEpisodeDate() {
        return episodeDate;
    }
    public void setEpisodeDate(Date episodeDate) {
        this.episodeDate = episodeDate;
    }
    public String getFileName() {
        return fileName;
    }
    public void setFileName(String fileName) {
        this.fileName = fileName;
    }
    public String getDirectory() {
        return directory;
    }
    public void setDirectory(String directory) {
        this.directory = directory;
    }
    public String getEThumbnail() {return eThumbnail;}
    public void setEThumbnail(String eThumbnail) {this.eThumbnail = eThumbnail;}
    @Override
    public String toString() {
        return "Episode [episodeNo=" + episodeNo + ", workNo=" + workNo + ", episodeName=" + episodeName
                + ", episodeOrder=" + episodeOrder + ", thumbnail=" + eThumbnail + ", episodeDate=" + episodeDate
                + ", fileName=" + fileName + ", directory=" + directory + "]";
    }



}
