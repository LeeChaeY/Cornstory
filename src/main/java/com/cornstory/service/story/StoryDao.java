package com.cornstory.service.story;

import com.cornstory.domain.Story;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface StoryDao {

    //전체 스토리 목록
    List<Story> listStory();

    //스토리 추가
    void addStory(Story story);

    //스토리 수정
    void updateStory(Story story);

    //스토리 삭제
    void deleteStory(int storyNo);

    //스토리 수정할 때 자기 글 가져오기
    Story getStory(int storyNo);

    //마이 스토리 확인
    List<Story> getMyStory(String userId);
}
