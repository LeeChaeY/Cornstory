package com.cornstory.restController.story;

import com.cornstory.domain.EpisodeComment;
import com.cornstory.domain.StoryComment;
import com.cornstory.service.story.StoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/story/*")
public class StoryRestController {

    @Autowired
    private StoryService storytService;

    // 댓글 추가
    @PostMapping("json/addComment")
    public List<StoryComment> addComment(@RequestBody StoryComment comment) throws Exception {
        storytService.addComment(comment);
        return storytService.listStoryComments(comment.getStoryNo());
    }

    // 댓글 목록 조회
    @GetMapping("json/listComments")
    public List<StoryComment> listComments(@RequestParam int storyNo) throws Exception {
        return storytService.listStoryComments(storyNo);
    }

    @PostMapping("json/updateComment")
    public void updateComment(@RequestBody StoryComment comment) throws Exception {
        storytService.updateComment(comment);
    }

    @PostMapping("json/deleteComment")
    public void deleteComment(@RequestBody StoryComment comment) throws Exception {
        storytService.deleteComment(comment.getsCommentNo());
    }

}
