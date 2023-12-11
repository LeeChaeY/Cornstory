package com.cornstory.restController.episode;

import com.cornstory.domain.EpisodeComment;
import com.cornstory.service.episode.EpisodeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/episode/*")
public class EpisodeRestController {

    @Autowired
    private EpisodeService episodeService;

    // 댓글 목록 조회
    @GetMapping("json/listComment")
    public List<EpisodeComment> listEpisodeComments() throws Exception {
        return episodeService.listEpisodeComment();
    }

    // 댓글 추가
    @PostMapping("json/addComment")
    public void addEpisodeComment(@RequestBody EpisodeComment episodeComment) throws Exception {
        episodeService.addEpisodeComment(episodeComment);
    }

    // 댓글 수정
    @PostMapping("json/updateComment")
    public void updateEpisodeComment(@RequestBody EpisodeComment episodeComment) throws Exception {
        episodeService.updateEpisodeComment(episodeComment);
    }

    // 댓글 삭제
    @PostMapping("json/deleteComment")
    public void deleteEpisodeComment(@RequestBody EpisodeComment episodeComment) throws Exception {
        episodeService.deleteEpisodeComment(episodeComment.getCommentNo());
    }



}
