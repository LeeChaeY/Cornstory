package com.cornstory.service.episode;

import com.cornstory.domain.Episode;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
public interface EpisodeDao {

    //작품 회차 상세보기
    public Episode getEpisode(int episodeNo);

    //작품 회차 생성
    public void addEpisode(Episode episode);

    //작품 회차 수정
    public void updateEpisode(Episode episode);

    //작품 회차 삭제
    public void deleteEpisode(int episodeNo);

    //작품회차 목록 최신순
    public List<Episode> listEpisode(int workNo);

    public int listEpisodeCount(int workNo);
}