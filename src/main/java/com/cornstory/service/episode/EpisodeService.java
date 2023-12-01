package com.cornstory.service.episode;

import java.util.List;

import com.cornstory.domain.Episode;
import com.cornstory.domain.EpisodeComment;

public interface EpisodeService {

    //작품 회차 상세보기
    Episode getEpisode(int episodeNo);

    //작품 회차 생성
    public void addEpisode(Episode episode);

    //작품 회차 수정
    public void updateEpisode(Episode episode);

    //작품 회차 삭제
    public void deleteEpisode(int episodeNo);

    //작품회차 목록 최신순
    public List<Episode> listEpisode(int workNo);

    public List<EpisodeComment> listEpisodeComment(int episodeNo) throws Exception;

    //작품 회차의 댓글 등록
    public void addEpisodeComment(EpisodeComment episodeComment)throws Exception;

    //작품 회차의 댓글 수정
    public void updateEpisodeComment(EpisodeComment episodeComment)throws Exception;

    //댓글 회차의 댓글 삭제
    public void deleteEpisodeComment(int eCommentNo)throws Exception;
}
