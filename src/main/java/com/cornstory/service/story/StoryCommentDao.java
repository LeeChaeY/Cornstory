package com.cornstory.service.story;

import com.cornstory.domain.StoryComment;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface StoryCommentDao {

    StoryComment getCommentByCommentNo(int commentNo);
    //스토리 댓글 생성
    void addComment(StoryComment comment);
    //스토리 댓글 수정
    void updateComment(StoryComment comment);
    //스토리 댓글 삭제
    void deleteComment(int commentNo);
    //스토리 댓글 목록
    List<StoryComment> listStoryComments(int storyNo);
}
