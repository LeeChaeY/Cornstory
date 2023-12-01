package com.cornstory.service.episode.episodeImpl;

import java.util.List;

import com.cornstory.domain.EpisodeComment;
import com.cornstory.service.episode.EpisodeCommentDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.cornstory.domain.Episode;
import com.cornstory.service.episode.EpisodeDao;
import com.cornstory.service.episode.EpisodeService;

@Service
public class EpisodeServiceImpl implements EpisodeService{

    @Autowired
    private EpisodeDao episodeDao;

    @Autowired
    private EpisodeCommentDao episodeCommentDao;

    @Autowired
    public EpisodeServiceImpl(EpisodeDao episodeDao) {
        this.episodeDao = episodeDao;
    }

    //작품 회차 상세보기
    @Override
    public Episode getEpisode(int episodeNo) {
        return episodeDao.getEpisode(episodeNo);
    }

    //작품 회차 생성
    @Override
    public void addEpisode(Episode episode) {
        episodeDao.addEpisode(episode);
    }

    //작품 회차 수정
    @Override
    public void updateEpisode(Episode episode) {
        episodeDao.updateEpisode(episode);
    }

    //작품 회차 삭제
    @Override
    public void deleteEpisode(int episodeNo) {
        episodeDao.deleteEpisode(episodeNo);
    }

    //작품회차 목록 최신순
    @Override
    public List<Episode> listEpisode(int workNo) {
        return episodeDao.listEpisode(workNo);
    }

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
