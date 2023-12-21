package com.cornstory.service.episode;

import java.util.List;
import java.util.Map;

import com.cornstory.domain.Episode;
import com.cornstory.domain.EpisodeComment;

public interface EpisodeService {

    //작품 회차 상세보기
    Episode getEpisode(int episodeNo);

    //작품 회차 생성
    public int addEpisode(Episode episode);

    //작품 회차 수정
    public void updateEpisode(Episode episode);

    //작품 회차 삭제
    public void deleteEpisode(int episodeNo);

    //작품회차 목록 최신순
    public Map<String, Object> listEpisode(int workNo);

    //작품회차 최고 목록
    public int episodeMax(int workNo) throws Exception;

    public List<EpisodeComment> listEpisodeComment() throws Exception;

    //작품 회차의 댓글 등록
    public void addEpisodeComment(EpisodeComment episodeComment)throws Exception;

    //작품 회차의 댓글 수정
    public void updateEpisodeComment(EpisodeComment episodeComment)throws Exception;

    //댓글 회차의 댓글 삭제
    public void deleteEpisodeComment(int commentNo)throws Exception;

    public Episode getLatestEpisode(Episode episode)throws Exception;

    public List<Episode> getPurchaseEpisode(String userId) throws  Exception;
}
