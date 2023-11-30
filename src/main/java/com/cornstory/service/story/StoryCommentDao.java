package com.cornstory.service.story;

import com.cornstory.domain.StoryComment;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface StoryCommentDao {
    StoryComment getCommentByCommentNo(int commentNo);
    void addComment(StoryComment comment);
    void updateComment(StoryComment comment);
    void deleteComment(int commentNo);
    List<StoryComment> listStoryComments(int storyNo);
}
