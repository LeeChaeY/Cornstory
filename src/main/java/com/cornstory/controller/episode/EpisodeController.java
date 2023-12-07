package com.cornstory.controller.episode;

import com.cornstory.domain.Episode;
import com.cornstory.domain.User;
import com.cornstory.domain.Work;
import com.cornstory.service.episode.EpisodeService;
import com.cornstory.service.work.WorkService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
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

@Controller
@RequestMapping("/episode/*")
public class EpisodeController {

    @Autowired
    @Qualifier("episodeServiceImpl")
    private EpisodeService episodeService;

    @Autowired
    @Qualifier("workServiceImpl")
    private WorkService workService;

    @GetMapping("addEpisode")
    public String addEpisode(@ModelAttribute("workNo") int workNo, Model model, @SessionAttribute(name="user", required = false) User user) throws Exception {
        System.out.println("[ EpisodeController.addWork() start........]");

        //user의 세션을 가져와야함.
        model.addAttribute("max",episodeService.episodeMax(workNo)+1);
        model.addAttribute("user",user);
        model.addAttribute("work",workService.getWork(workNo));
        return "episode/addEpisode";

    }
    @PostMapping("addEpisode")
    public String addEpisode(@ModelAttribute("episode")Episode episode, @ModelAttribute("workNo")int workNo, @RequestParam("thumbnailFile") MultipartFile thumbnailFile,  @RequestParam("episodeFile") MultipartFile episodeFile, HttpServletRequest request, HttpServletResponse response) throws Exception {
        System.out.println("[ EpisodeController.addWork() start........]");
        Work work = workService.getWork(workNo);
        String fileName="";
        String uploadDir="";
        String filePath="";
        if (!thumbnailFile.isEmpty()) {
            try {
                fileName = work.getUserId() + "_" + episode.getWorkNo() +"_" +episode.getEpisodeOrder();
                fileName = fileName.replaceAll("[^a-zA-Z0-9가-힣_]", "_");
                fileName += ".jpg";
                uploadDir = "C:\\CornStory\\src\\main\\resources\\static\\file\\episode";
                filePath = uploadDir + File.separator + fileName;


                Files.write(Path.of(filePath), thumbnailFile.getBytes(), StandardOpenOption.CREATE, StandardOpenOption.TRUNCATE_EXISTING);

                // 파일 경로를 Work 객체에 저장
                episode.setThumbnail(fileName);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        if (!episodeFile.isEmpty()) {
            try {
                fileName = work.getUserId() + "_" + episode.getWorkNo() +"_" +episode.getEpisodeOrder();
                fileName = fileName.replaceAll("[^a-zA-Z0-9가-힣_]", "_");
                if(work.getCategory()==0){
                    uploadDir = "C:\\CornStory\\src\\main\\resources\\static\\file\\episode\\webnovel";
                    fileName += ".txt";
                }else if(work.getCategory()==1){
                    uploadDir = "C:\\CornStory\\src\\main\\resources\\static\\file\\episode\\webtoon";
                    fileName += ".jpg";
                }else if(work.getCategory()==2){
                    uploadDir = "C:\\CornStory\\src\\main\\resources\\static\\file\\episode\\webdrama";
                    fileName += ".mp4";
                }

                filePath = uploadDir + File.separator + fileName;

                Files.write(Path.of(filePath), episodeFile.getBytes(), StandardOpenOption.CREATE, StandardOpenOption.TRUNCATE_EXISTING);

                // 파일 경로를 Work 객체에 저장
                episode.setDirectory(uploadDir);
                episode.setFileName(fileName);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        System.out.println(episode.toString());

       episodeService.addEpisode(episode);

        return "index";
    }

    @GetMapping("updateEpisode")
    public String updateEpisode(@ModelAttribute("episodeNo") int episodeNo, Model model, @SessionAttribute(name="user", required = false) User user) throws Exception {
        System.out.println("[ EpisodeController.addWork() start........]");


        model.addAttribute("user",user);
        model.addAttribute("episode",episodeService.getEpisode(episodeNo));
        return "episode/updateEpisode";

    }
//    @PostMapping("updateEpisode")
//    public String updateEpisode(@ModelAttribute("episode")Episode episode, @ModelAttribute("workNo")int workNo, @RequestParam("thumbnailFile") MultipartFile thumbnailFile,  @RequestParam("episodeFile") MultipartFile episodeFile, HttpServletRequest request, HttpServletResponse response) throws Exception {
//        System.out.println("[ EpisodeController.addWork() start........]");
//        Work work = workService.getWork(workNo);
//        String fileName="";
//        String uploadDir="";
//        String filePath="";
//        if (!thumbnailFile.isEmpty()) {
//            try {
//                fileName = work.getUserId() + "_" + episode.getWorkNo() +"_" +episode.getEpisodeOrder();
//                fileName = fileName.replaceAll("[^a-zA-Z0-9가-힣_]", "_");
//                fileName += ".jpg";
//                uploadDir = "C:\\CornStory\\src\\main\\resources\\static\\file\\episode";
//                filePath = uploadDir + File.separator + fileName;
//
//
//                Files.write(Path.of(filePath), thumbnailFile.getBytes(), StandardOpenOption.CREATE, StandardOpenOption.TRUNCATE_EXISTING);
//
//                // 파일 경로를 Work 객체에 저장
//                episode.setThumbnail(fileName);
//            } catch (IOException e) {
//                e.printStackTrace();
//            }
//        }
//        if (!episodeFile.isEmpty()) {
//            try {
//                fileName = work.getUserId() + "_" + episode.getWorkNo() +"_" +episode.getEpisodeOrder();
//                fileName = fileName.replaceAll("[^a-zA-Z0-9가-힣_]", "_");
//                if(work.getCategory()==0){
//                    uploadDir = "C:\\CornStory\\src\\main\\resources\\static\\file\\episode\\webnovel";
//                    fileName += ".txt";
//                }else if(work.getCategory()==1){
//                    uploadDir = "C:\\CornStory\\src\\main\\resources\\static\\file\\episode\\webtoon";
//                    fileName += ".jpg";
//                }else if(work.getCategory()==2){
//                    uploadDir = "C:\\CornStory\\src\\main\\resources\\static\\file\\episode\\webdrama";
//                    fileName += ".mp4";
//                }
//
//                filePath = uploadDir + File.separator + fileName;
//
//                Files.write(Path.of(filePath), episodeFile.getBytes(), StandardOpenOption.CREATE, StandardOpenOption.TRUNCATE_EXISTING);
//
//                // 파일 경로를 Work 객체에 저장
//                episode.setDirectory(uploadDir);
//                episode.setFileName(fileName);
//            } catch (IOException e) {
//                e.printStackTrace();
//            }
//        }
//        System.out.println(episode.toString());
//
//        //episodeService.addEpisode(episode);
//
//        return "index";
//    }
}
