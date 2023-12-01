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

    //전체 스토리 목록
    @Override
    public List<Story> listStory()throws Exception {
        return storyDao.listStory();
    }

    //스토리 추가
    @Override
    public void addStory(Story story)throws Exception {
        storyDao.listStory();
    }

    //스토리 수정
    @Override
    public void updateStory(Story story)throws Exception {
        storyDao.updateStory(story);
    }

    //스토리 삭제
    @Override
    public void deleteStory(int storyNo)throws Exception {
        storyDao.deleteStory(storyNo);
    }

    //마이 스토리 확인
    @Override
    public List<Story> getMyStory(String userId)throws Exception {
        return storyDao.getMyStory(userId);
    }

    //스토리 수정할 때 자기 글 가져오기
    @Override
    public Story getStory(int storyNo)throws Exception {
        return storyDao.getStory(storyNo);
    }
}
