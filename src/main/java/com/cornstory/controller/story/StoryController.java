package com.cornstory.controller.story;

import com.cornstory.domain.Story;
import com.cornstory.domain.User;
import com.cornstory.service.storage.StorageService;
import com.cornstory.service.story.StoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.StandardOpenOption;
import java.util.List;

import static java.lang.Integer.parseInt;

@Controller
@RequestMapping("/story/*")
public class StoryController {

    @Autowired
    private StoryService storyService;

    @Autowired
    @Qualifier("storageServiceImpl")
    private StorageService storageService;

    public String getFileExtension(MultipartFile file) {
        String fileName = file.getOriginalFilename();
        if (fileName == null || fileName.isEmpty()) {
            return null;
        }

        int dotIndex = fileName.lastIndexOf('.');
        if (dotIndex >= 0) {
            // 마지막 점 이후의 문자열을 확장자로 추출
            return fileName.substring(dotIndex + 1);
        } else {
            // 확장자가 없는 경우
            return null;
        }
    }

    @GetMapping("listStory")
    public String listStory(Model model,@SessionAttribute(name="user", required = false) User user) throws Exception {
        List<Story> story = storyService.listStory();
        model.addAttribute("story", story);
        model.addAttribute("user",user);
        return "story/listStory";
    }

    @GetMapping("addStory")
    public String addStory(Model model, @SessionAttribute(name="user", required = false) User user) throws Exception {
        System.out.println("[ StoryController.addStory() start........]");

        //user의 세션을 가져와야함.
        model.addAttribute("user",user);
        return "story/addStory";

    }


    @PostMapping("addStory")
    public String addStory(@ModelAttribute("story") Story story, @RequestParam("thumbnailFile") MultipartFile file) throws Exception {
        System.out.println("[ StoryController.addStory() start........]");

        String extension = getFileExtension(file);

        if (extension != null && extension.equalsIgnoreCase("jpg")) {
            String fileName = story.getUserId() + "_" + story.getStoryName();
            fileName = fileName.replaceAll("[^a-zA-Z0-9가-힣_]", "_");
            String bucketName = "cornstory"; // 버킷 이름 지정
            String fileKey = "story/" + fileName;

            String fileUrl = storageService.uploadFileToS3(bucketName, fileKey, file);

            story.setStoryImage(fileUrl);

        }
        System.out.println(story.toString());
        storyService.addStory(story);
        return "redirect:/story/getStory";

    }

    @GetMapping("updateStory")
    public String updateStory(@RequestParam("storyNo") int storyNo,Model model, @SessionAttribute(name="user", required = false) User user) throws Exception {
        System.out.println("[ StoryController.updateStory() start........]");

        Story story=storyService.getStory(storyNo);

        //user의 세션을 가져와야함.
        model.addAttribute("story",story);
        model.addAttribute("user",user);
        return "story/updateStory";

    }


    @PostMapping("updateStory")
    public String updateStory(@ModelAttribute("story") Story story, @RequestParam("thumbnailFile") MultipartFile file) throws Exception {
        System.out.println("[ StoryController.updateStory() start........]");

        String extension = getFileExtension(file);

        if (extension != null && extension.equalsIgnoreCase("jpg")) {
            String fileName = story.getUserId() + "_" + story.getStoryName();
            fileName = fileName.replaceAll("[^a-zA-Z0-9가-힣_]", "_")+".jpg";
            String bucketName = "cornstory"; // 버킷 이름 지정
            String fileKey = "story/" + fileName;

            String fileUrl = storageService.uploadFileToS3(bucketName, fileKey, file);

            story.setStoryImage(fileUrl);

        }
        System.out.println(story.toString());
        storyService.updateStory(story);
        return "redirect:/story/getStory";

    }

    @PostMapping("deleteStory")
    public String deleteStory(@RequestParam("storyNo") int storyNo) throws Exception {
        System.out.println("[ StoryController.deleteStory() start........]");

        storyService.deleteStory(storyNo);
        return "story/getStory";
    }
    @GetMapping("getStory")
    public String getStory(@SessionAttribute(name="user", required = false) User user,Model model) throws Exception {
        List<Story> story = storyService.getMyStory(user.getUserId());
        model.addAttribute("story", story);
        model.addAttribute("user",user);
        return "story/getStory";
    }

}
