package com.cornstory.service.episode;

import com.cornstory.domain.Episode;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
public interface EpisodeDao {

    Episode getEpisodeById(int episodeNo);

    void addEpisode(Episode episode);

    void updateEpisode(Episode episode);

    void deleteEpisode(int episodeNo);

    List<Episode> listEpisode();

    List<Episode> getWorkEpisode(int workNo);
}