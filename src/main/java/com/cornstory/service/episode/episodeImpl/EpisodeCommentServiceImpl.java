package com.cornstory.service.episode.episodeImpl;

import com.cornstory.domain.EpisodeComment;
import com.cornstory.domain.StoryComment;
import com.cornstory.service.episode.EpisodeCommentDao;
import com.cornstory.service.episode.EpisodeCommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class EpisodeCommentServiceImpl implements EpisodeCommentService {

    @Autowired
    private EpisodeCommentDao episodeCommentDao;

    //작품 회차에 대한 목록
    @Override
    public List<EpisodeComment> listEpisodeComment(int episodeNo) throws Exception{
        return episodeCommentDao.listEpisodeComment(episodeNo);
    }

    //작품 회차의 댓글 등록
    @Override
    public void addEpisodeComment(EpisodeComment episodeComment) throws Exception{
        episodeCommentDao.addEpisodeComment(episodeComment);
    }

    //작품 회차의 댓글 수정
    @Override
    public void updateEpisodeComment(EpisodeComment episodeComment) throws Exception{
        episodeCommentDao.updateEpisodeComment(episodeComment);
    }

    //댓글 회차의 댓글 삭제
    @Override
    public void deleteEpisodeComment(int eCommentNo) throws Exception{
        episodeCommentDao.deleteEpisodeComment(eCommentNo);
    }
}
