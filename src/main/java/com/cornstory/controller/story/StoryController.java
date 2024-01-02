package com.cornstory.controller.story;

import com.cornstory.domain.Story;
import com.cornstory.domain.User;
import com.cornstory.service.story.StoryService;
import org.springframework.beans.factory.annotation.Autowired;
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

    @GetMapping("/listStory")
    public String listStory(Model model,@SessionAttribute(name="user", required = false) User user) throws Exception {
        List<Story> story = storyService.listStory();
        model.addAttribute("story", story);
        model.addAttribute("user",user);
        return "story/listStory";
    }

    @GetMapping("/addStory")
    public String addStory(Model model, @SessionAttribute(name="user", required = false) User user) throws Exception {
        System.out.println("[ StoryController.addStory() start........]");

        //user의 세션을 가져와야함.
        model.addAttribute("user",user);
        return "story/addStory";

    }


    @PostMapping("/addStory")
    public String addStory(@ModelAttribute("story") Story story, @RequestParam("thumbnailFile") MultipartFile file) throws Exception {

        String fileName = story.getUserId() + "_" + story.getStoryName();
        fileName = fileName.replaceAll("[^a-zA-Z0-9가-힣_]", "_");
        fileName += ".jpg";
        if (!file.isEmpty()) {
            try {
                String uploadDir = "C:\\CornStory\\src\\main\\resources\\static\\file\\story";
                String filePath = uploadDir + File.separator + fileName;


                Files.write(Path.of(filePath), file.getBytes(), StandardOpenOption.CREATE, StandardOpenOption.TRUNCATE_EXISTING);

                // 파일 경로를 Work 객체에 저장

                story.setStoryImage(filePath);
            } catch (IOException e) {
                e.printStackTrace();
            }

        }
        System.out.println(story.toString());
        storyService.addStory(story);
        return "story/getStory";

    }

    @GetMapping("/updateStory")
    public String updateStory(@RequestParam("storyNo") int storyNo,Model model, @SessionAttribute(name="user", required = false) User user) throws Exception {
        System.out.println("[ StoryController.updateStory() start........]");

        Story story=storyService.getStory(storyNo);

        //user의 세션을 가져와야함.
        model.addAttribute("story",story);
        model.addAttribute("user",user);
        return "story/updateStory";

    }


    @PostMapping("/updateStory")
    public String updateStory(@ModelAttribute("story") Story story, @RequestParam(value = "storyNo", required = false) Integer storyNo,@RequestParam("thumbnailFile") MultipartFile file) throws Exception {

        System.out.println(story.getStoryNo());
        String fileName = story.getUserId() + "_" + story.getStoryName();
        fileName = fileName.replaceAll("[^a-zA-Z0-9가-힣_]", "_");
        fileName += ".jpg";
        if (!file.isEmpty()) {
            try {
                String uploadDir = "C:\\CornStory\\src\\main\\resources\\static\\file\\story";
                String filePath = uploadDir + File.separator + fileName;


                Files.write(Path.of(filePath), file.getBytes(), StandardOpenOption.CREATE, StandardOpenOption.TRUNCATE_EXISTING);

                // 파일 경로를 Work 객체에 저장

                story.setStoryImage(filePath);
            } catch (IOException e) {
                e.printStackTrace();
            }

        }
        System.out.println(story.toString());
        storyService.updateStory(story);
        return "redirect:/story/getStory";

    }

    @PostMapping("/deleteStory")
    public String deleteStory(@RequestParam("storyNo") int storyNo) throws Exception {
        System.out.println("[ StoryController.deleteStory() start........]");

        storyService.deleteStory(storyNo);
        return "story/getStory";
    }
    @GetMapping("/getStory")
    public String getStory(@SessionAttribute(name="user", required = false) User user,Model model) throws Exception {
        List<Story> story = storyService.getMyStory(user.getUserId());
        model.addAttribute("story", story);
        model.addAttribute("user",user);
        return "story/getStory";
    }

}
