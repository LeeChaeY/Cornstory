package com.cornstory.service.story;

import com.cornstory.domain.Story;

import java.util.List;

public interface StoryService {

    //전체 스토리 목록
    public List<Story> listStory() throws Exception;

    //스토리 추가
    public void addStory(Story story)throws Exception;

    //스토리 수정
    public void updateStory(Story story)throws Exception;

    //스토리 삭제
    public void deleteStory(int storyNo)throws Exception;

    //마이 스토리 확인
    public List<Story> getMyStory(String userId)throws Exception;

    //스토리 수정할 때 자기 글 가져오기
    public Story getStory(int storyNo)throws Exception;
}
