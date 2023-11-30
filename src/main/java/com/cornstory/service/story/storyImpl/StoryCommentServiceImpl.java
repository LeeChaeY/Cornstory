package com.cornstory.service.story.storyImpl;

import com.cornstory.domain.StoryComment;
import com.cornstory.service.story.StoryCommentDao;
import com.cornstory.service.story.StoryCommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class StoryCommentServiceImpl implements StoryCommentService {

    @Autowired
    private StoryCommentDao storyCommentDao;

    @Override
    public StoryComment getCommentByCommentNo(int commentNo)throws Exception {
        return storyCommentDao.getCommentByCommentNo(commentNo);
    }

    @Override
    public void addComment(StoryComment comment)throws Exception {
        storyCommentDao.addComment(comment);
    }

    @Override
    public void updateComment(StoryComment comment)throws Exception {
        storyCommentDao.updateComment(comment);
    }

    @Override
    public void deleteComment(int commentNo)throws Exception {
        storyCommentDao.deleteComment(commentNo);
    }

    @Override
    public List<StoryComment> listStoryComments(int storyNo)throws Exception {
        return storyCommentDao.listStoryComments(storyNo);
    }
}

