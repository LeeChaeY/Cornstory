package com.cornstory.service.story.storyImpl;

import com.cornstory.domain.Story;
import com.cornstory.service.story.StoryDao;
import com.cornstory.service.story.StoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class StoryServiceImpl implements StoryService {

    @Autowired
    private StoryDao storyDao;

    @Override
    public List<Story> listStory()throws Exception {
        return storyDao.listStory();
    }

    @Override
    public void addStory(Story story)throws Exception {
        storyDao.listStory();
    }

    @Override
    public void updateStory(Story story)throws Exception {
        storyDao.updateStory(story);
    }

    @Override
    public void deleteStory(int storyNo)throws Exception {
        storyDao.deleteStory(storyNo);
    }

    @Override
    public List<Story> getMyStory(String userId)throws Exception {
        return storyDao.getMyStory(userId);
    }

    @Override
    public Story getStoryById(int storyNo)throws Exception {
        return storyDao.getStoryById(storyNo);
    }
}
