package com.cornstory.service.episode;

import com.cornstory.domain.EpisodeComment;
import com.cornstory.domain.StoryComment;

import java.util.List;

public interface EpisodeCommentService {
    //작품 회차에 대한 목록
    public List<EpisodeComment> listEpisodeComment(int episodeNo) throws Exception;

    //작품 회차의 댓글 등록
    public void addEpisodeComment(EpisodeComment episodeComment)throws Exception;

    //작품 회차의 댓글 수정
    public void updateEpisodeComment(EpisodeComment episodeComment)throws Exception;

    //댓글 회차의 댓글 삭제
    public void deleteEpisodeComment(int eCommentNo)throws Exception;
}
