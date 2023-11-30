package com.cornstory.service.episode;

import com.cornstory.domain.EpisodeComment;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface EpisodeCommentDao {

    public EpisodeComment getEpisodeCommentById(int eCommentNo);

    public void addEpisodeComment(EpisodeComment episodeComment);

    public void updateEpisodeComment(EpisodeComment episodeComment);

    public void deleteEpisodeComment(int eCommentNo);
}
