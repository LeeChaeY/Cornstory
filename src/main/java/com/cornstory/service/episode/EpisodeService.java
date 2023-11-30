package com.cornstory.service.episode;

import java.util.List;

import com.cornstory.domain.Episode;

public interface EpisodeService {

    Episode getEpisodeById(int episodeNo);

    void addEpisode(Episode episode);

    void updateEpisode(Episode episode);

    void deleteEpisode(int episodeNo);

    List<Episode> listEpisode();

    List<Episode> getWorkEpisode(int workNo);
}
