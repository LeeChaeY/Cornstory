package com.cornstory.service.episode;

import com.cornstory.domain.EpisodeComment;
import com.cornstory.domain.StoryComment;

public interface EpisodeCommentService {
    public EpisodeComment getEpisodeCommentById(int eCommentNo) throws Exception;

    public void addEpisodeComment(EpisodeComment episodeComment)throws Exception;

    public void updateEpisodeComment(EpisodeComment episodeComment)throws Exception;

    public void deleteEpisodeComment(int eCommentNo)throws Exception;
}
