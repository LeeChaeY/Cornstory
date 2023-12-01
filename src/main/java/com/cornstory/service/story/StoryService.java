package com.cornstory.service.story;

import com.cornstory.domain.Story;
import com.cornstory.domain.StoryComment;

import java.util.List;

public interface StoryService {

    public List<Story> listStory() throws Exception;

    public void addStory(Story story)throws Exception;

    public void updateStory(Story story)throws Exception;

    public void deleteStory(int storyNo)throws Exception;

    public List<Story> getMyStory(String userId)throws Exception;

    //스토리 수정할 때 자기 글 가져오기
    public Story getStory(int storyNo)throws Exception;

    public StoryComment getCommentByCommentNo(int commentNo)throws Exception;

    //스토리 댓글 생성
    public void addComment(StoryComment comment)throws Exception;

    //스토리 댓글 수정
    public void updateComment(StoryComment comment)throws Exception;

    //스토리 댓글 삭제
    public void deleteComment(int commentNo)throws Exception;

    //스토리 댓글 목록
    public List<StoryComment> listStoryComments(int storyNo)throws Exception;
}
