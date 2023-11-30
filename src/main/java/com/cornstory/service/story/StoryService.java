package com.cornstory.service.story;

import com.cornstory.domain.Story;

import java.util.List;

public interface StoryService {

    public List<Story> listStory() throws Exception;

    public void addStory(Story story)throws Exception;

    public void updateStory(Story story)throws Exception;

    public void deleteStory(int storyNo)throws Exception;

    public List<Story> getMyStory(String userId)throws Exception;

    public Story getStoryById(int storyNo)throws Exception;
}
