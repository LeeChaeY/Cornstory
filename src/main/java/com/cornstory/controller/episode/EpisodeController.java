package com.cornstory.controller.episode;

import com.cornstory.domain.*;
import com.cornstory.service.episode.EpisodeService;
import com.cornstory.service.product.ProductService;
import com.cornstory.service.work.WorkService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
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

    @Autowired
    @Qualifier("productServiceImpl")
    private ProductService productService;



    @GetMapping("addEpisode")
    public String addEpisode(@ModelAttribute("workNo") int workNo, Model model, @SessionAttribute(name="user", required = false) User user) throws Exception {
        System.out.println("[ EpisodeController.addEpisode() start........]");

        //user의 세션을 가져와야함.
        model.addAttribute("max",episodeService.episodeMax(workNo)+1);
        model.addAttribute("user",user);
        model.addAttribute("work",workService.getWork(workNo));
        return "episode/addEpisode";

    }
    @PostMapping("addEpisode")
    public String addEpisode(@ModelAttribute("episode")Episode episode, @ModelAttribute("workNo")int workNo, @RequestParam("thumbnailFile") MultipartFile thumbnailFile,  @RequestParam("episodeFile") MultipartFile episodeFile, HttpServletRequest request, HttpServletResponse response) throws Exception {
        System.out.println("[ EpisodeController.addEpisode() start........]");
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
                episode.setThumbnail(filePath);
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


        //System.out.println("작품 회차 팝콘 : "+episodeService.getLatestEpisode(work.getWorkNo()).toString());
        Episode episode1=episodeService.getLatestEpisode(episode);

       Product product=new Product();
       int episodeNo = episodeService.addEpisode(episode);
       product.setEpisodeNo(episodeNo);
       product.setWorkNo(workNo);
       product.setUserId(work.getUserId());
       product.setProdCategory(1);
       product.setProdName(work.getWorkName()+" "+episode.getEpisodeOrder()+" 회차");
       product.setWorkName(work.getWorkName());
       product.setEpisodeOrder(episode.getEpisodeOrder());
       product.setProdImage(episode.getThumbnail());
       product.setProdCnt(1);
       if(work.getFap() == 0){
           product.setProdPrice(0);
       }else{
           if(work.getCategory()==0){
               product.setProdPrice(2);
           }else if(work.getCategory()==1){
               product.setProdPrice(3);
           }else if(work.getCategory()==2){
               product.setProdPrice(5);
           }
       }

        product.setProdCnt(1);

        System.out.println(" 상품 등록 가능??????"+product.toString());
        productService.addProduct(product);


        return "index";
    }

    @GetMapping("updateEpisode")
    public String updateEpisode(@ModelAttribute("episodeNo") int episodeNo, Model model, @SessionAttribute(name="user", required = false) User user) throws Exception {
        System.out.println("[ EpisodeController.updateEpisode() start........]");
        Episode episode= episodeService.getEpisode(episodeNo);


        model.addAttribute("work",workService.getWork(episode.getWorkNo()));
        model.addAttribute("user",user);
        model.addAttribute("episode",episode);
        return "episode/updateEpisode";

    }
    @PostMapping("updateEpisode")
    public String updateEpisode(@ModelAttribute("episode")Episode episode, @RequestParam("thumbnailFile") MultipartFile thumbnailFile,  @RequestParam("episodeFile") MultipartFile episodeFile, HttpServletRequest request, HttpServletResponse response) throws Exception {
        System.out.println("[ EpisodeController.updateEpisode() start........]");
        //Work work = workService.getWork(episode.getWorkNo());

        Episode episodesub = episodeService.getEpisode(episode.getEpisodeNo());
        episode.setThumbnail(episodesub.getThumbnail());
        episode.setFileName(episodesub.getFileName());
        episode.setDirectory(episodesub.getDirectory());
        String fileName="";
        String uploadDir="";
        String filePath="";
        if (!thumbnailFile.isEmpty()) {
            try {
                filePath = episode.getThumbnail();


                Files.write(Path.of(filePath), thumbnailFile.getBytes(), StandardOpenOption.CREATE, StandardOpenOption.TRUNCATE_EXISTING);


            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        if (!episodeFile.isEmpty()) {
            try {

                filePath = episode.getDirectory()+ File.separator +episode.getFileName();

                Files.write(Path.of(filePath), episodeFile.getBytes(), StandardOpenOption.CREATE, StandardOpenOption.TRUNCATE_EXISTING);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        System.out.println(episode.toString());

        episodeService.updateEpisode(episode);

        return "index";
    }

    @PostMapping("deleteEpisode")
    public String deleteEpisode(@RequestParam("episodeNo") int episodeNo) {
        try {
            episodeService.deleteEpisode(episodeNo);
        } catch (Exception e) {
            e.printStackTrace(); // 에러 로깅 또는 예외 처리
        }
        return "index";
    }

    @GetMapping("getEpisode")
    public String getEpisode(@ModelAttribute("episodeNo") int episodeNo, Model model, @SessionAttribute(name="user", required = false) User user) throws Exception {
        System.out.println("[ EpisodeController.updateEpisode() start........]");
        Episode episode= episodeService.getEpisode(episodeNo);
        Work work =workService.getWork(episode.getWorkNo());
        if (work.getCategory() == 0) {
            String textContent = readTextFile(episode.getDirectory(), episode.getFileName());
            model.addAttribute("textContent", textContent);
        }else{
            model.addAttribute("files",episode.getDirectory()+ File.separator + episode.getFileName());
        }


        model.addAttribute("list",episodeService.listEpisodeComment());
        model.addAttribute("work",work);
        model.addAttribute("user",user);
        model.addAttribute("episode",episode);
        return "episode/getEpisode";

    }
    // 추가: 텍스트 파일을 읽어오는 메서드
    private String readTextFile(String directory, String fileName) throws IOException {
        // 실제 파일 경로를 만들어줍니다.
        String filePath = directory + File.separator + fileName;

        // 파일을 읽어오기 위한 BufferedReader를 사용합니다.
        try (BufferedReader br = new BufferedReader(new FileReader(filePath))) {
            StringBuilder content = new StringBuilder();
            String line;
            // 한 줄씩 읽어와서 StringBuilder에 추가합니다.
            while ((line = br.readLine()) != null) {
                content.append(line).append("\n");
            }
            return content.toString();
        }
    }


}
