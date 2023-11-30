package com.cornstory.service.episode.episodeImpl;

import com.cornstory.domain.EpisodeComment;
import com.cornstory.domain.StoryComment;
import com.cornstory.service.episode.EpisodeCommentDao;
import com.cornstory.service.episode.EpisodeCommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class EpisodeCommentServiceImpl implements EpisodeCommentService {
    @Autowired
    private EpisodeCommentDao episodeCommentDAO;

    @Override
    public EpisodeComment getEpisodeCommentById(int eCommentNo) throws Exception{
        return episodeCommentDAO.getEpisodeCommentById(eCommentNo);
    }

    @Override
    public void addEpisodeComment(EpisodeComment episodeComment) throws Exception{
        episodeCommentDAO.addEpisodeComment(episodeComment);
    }

    @Override
    public void updateEpisodeComment(EpisodeComment episodeComment) throws Exception{
        episodeCommentDAO.updateEpisodeComment(episodeComment);
    }

    @Override
    public void deleteEpisodeComment(int eCommentNo) throws Exception{
        episodeCommentDAO.deleteEpisodeComment(eCommentNo);
    }
}
