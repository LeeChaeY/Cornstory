package com.cornstory.service.story;

import com.cornstory.domain.Story;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface StoryDao {

    List<Story> listStory();

    void addStory(Story story);

    void updateStory(Story story);

    void deleteStory(int storyNo);

    Story getStoryById(int storyNo);

    List<Story> getMyStory(String userId);
}
