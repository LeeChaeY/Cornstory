package com.cornstory.service.episode;

import com.cornstory.domain.EpisodeComment;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface EpisodeCommentDao {

    //작품 회차에 대한 목록
    public List<EpisodeComment> listEpisodeComment();

    //작품 회차의 댓글 등록
    public void addEpisodeComment(EpisodeComment episodeComment);

    //작품 회차의 댓글 수정
    public void updateEpisodeComment(EpisodeComment episodeComment);

    //댓글 회차의 댓글 삭제
    public void deleteEpisodeComment(int commentNo);
}
