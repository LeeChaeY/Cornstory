package com.cornstory.service.story;

import com.cornstory.domain.StoryComment;

import java.util.List;

public interface StoryCommentService {
    public StoryComment getCommentByCommentNo(int commentNo)throws Exception;
    public void addComment(StoryComment comment)throws Exception;
    public void updateComment(StoryComment comment)throws Exception;
    public void deleteComment(int commentNo)throws Exception;
    public List<StoryComment> listStoryComments(int storyNo)throws Exception;
}
