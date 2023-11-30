package com.cornstory.service.episode.episodeImpl;

import java.util.List;

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

    @Override
    public Episode getEpisodeById(int episodeNo) {
        return episodeDao.getEpisodeById(episodeNo);
    }

    @Override
    public void addEpisode(Episode episode) {
        episodeDao.addEpisode(episode);

    }

    @Override
    public void updateEpisode(Episode episode) {
        episodeDao.updateEpisode(episode);

    }

    @Override
    public void deleteEpisode(int episodeNo) {
        episodeDao.deleteEpisode(episodeNo);

    }

    @Override
    public List<Episode> listEpisode() {
        return episodeDao.listEpisode();
    }


    @Override
    public  List<Episode> getWorkEpisode(int workNo){
        return episodeDao.getWorkEpisode(workNo);
    }


}
