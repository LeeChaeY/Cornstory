package com.cornstory.controller.work;

import com.cornstory.common.Search;
import com.cornstory.domain.Bookmark;
import com.cornstory.domain.User;
import com.cornstory.domain.Work;
import com.cornstory.service.episode.EpisodeService;
import com.cornstory.service.product.ProductService;
import com.cornstory.service.storage.StorageService;
import com.cornstory.service.work.WorkService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.websocket.Session;
import org.apache.tomcat.util.http.fileupload.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.core.io.Resource;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;
import org.springframework.core.io.support.ResourcePatternResolver;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.ResourceUtils;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.StandardOpenOption;
import java.util.Map;
import java.util.Objects;

@Controller
@RequestMapping("/work/*")
public class WorkController {

    @Autowired
    @Qualifier("workServiceImpl")
    private WorkService workService;

    @Autowired
    @Qualifier("episodeServiceImpl")
    private EpisodeService episodeService;

    @Autowired
    @Qualifier("productServiceImpl")
    private ProductService productService;

    @Autowired
    @Qualifier("storageServiceImpl")
    private StorageService storageService;

    public WorkController(){
        System.out.println("WorkController 진입");
    }


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

    @GetMapping("addWork")
    public String addWork(Model model, @SessionAttribute(name="user", required = false)User user) throws Exception {
        System.out.println("[ WorkController.addWork() start........]");
        //user의 세션을 가져와야함.
        model.addAttribute("user",user);
        model.addAttribute("list",productService.getCopylight(user.getUserId()));
        return "work/addWork";

    }
    @PostMapping("addWork")
    public String addWork(@ModelAttribute("work") Work work, @RequestParam("thumbnailFile") MultipartFile file, @SessionAttribute(name="user", required = false)User user) throws Exception {
        System.out.println("[ WorkController.addWork() start........]");
        work.setUserId(user.getUserId());

        String extension = getFileExtension(file);

        if (extension != null && extension.equalsIgnoreCase("jpg")) {
                    String fileName = work.getUserId() + "_" + work.getWorkName();
                    fileName = fileName.replaceAll("[^a-zA-Z0-9가-힣_]", "_") + ".jpg";
                    String bucketName = "cornstory"; // 버킷 이름 지정
                    String fileKey = "work/" + fileName;

                    String fileUrl = storageService.uploadFileToS3(bucketName, fileKey, file);

                    // 파일 경로를 Work 객체에 저장
                    System.out.println(fileUrl);
                    work.setThumbnail(fileUrl);
        }else{
            work.setThumbnail("..\\khs\\images\\popcorn.jpg");
        }
        System.out.println(work.toString());

         workService.addWork(work);

        return "redirect:/work/getWork";
    }

    @GetMapping("updateWork")
    public String updateWork(@RequestParam("workNo") int workNo,Model model, @SessionAttribute(name="user", required = false)User user) throws Exception{
        System.out.println("[ WorkController.updateWork() start........]");

        //user의 세션을 가져와야함.
        model.addAttribute("work",workService.getWork(workNo));
        model.addAttribute("list",productService.getCopylight(user.getUserId()));

        return "work/updateWork";

    }

    @PostMapping("updateWork")
    public String updateWork(@ModelAttribute("work") Work work, @RequestParam("thumbnailFile") MultipartFile file) throws Exception{
        System.out.println("[ WorkController.updateWork() start........]");
        System.out.println(work.toString());

        String extension = getFileExtension(file);

        Work copyWork = workService.getWork(work.getWorkNo());

        if (extension != null && extension.equalsIgnoreCase("jpg")) {
            String fileName = work.getUserId() + "_" + work.getWorkName();
            fileName = fileName.replaceAll("[^a-zA-Z0-9가-힣_]", "_") + ".jpg";
            String bucketName = "cornstory"; // 버킷 이름 지정
            String fileKey = "work/" + fileName;


                // 새 파일을 클라우드 스토리지에 업로드
                String fileUrl = storageService.uploadFileToS3(bucketName, fileKey, file);

            if(!Objects.equals(fileUrl, copyWork.getThumbnail())){
                String key = copyWork.getThumbnail().replace("https://cornstory.kr.object.ncloudstorage.com/", "");
                storageService.deleteFileFromS3(bucketName,key);
            }


            // 파일 URL을 Work 객체에 저장
            work.setThumbnail(fileUrl);
        }else{

            work.setThumbnail(workService.getWork(work.getWorkNo()).getThumbnail());
        }
        System.out.println(work);
        workService.updateWork(work);
        return "redirect:/work/getWork";

    }


    @PostMapping("deleteWork")
    public String deleteWork(@RequestParam("workNo") int workNo) throws Exception{
        System.out.println("[ WorkController.index() start........]");
        try {
            workService.deleteWork(workNo);
        } catch (Exception e) {
            e.printStackTrace(); // 에러 로깅 또는 예외 처리
        }
        return "redirect:/work/getWork";
    }
    @RequestMapping("listWork")
    public String listWork(@ModelAttribute("search") Search search, Model model) throws Exception {
        System.out.println("[ WorkController.listWork() start........]");

        Map<String, Object> map = workService.listWork(search);

        search.setCurrentPage(1);
        search.setPageSize(5);

        //model.addAttribute("list", map.get("list"));
        model.addAttribute("totalCount", map.get("totalCount"));
        model.addAttribute("search", search);

        return "work/listWork";
    }

    @RequestMapping ("getWork")
    public String getWork( Model model, @SessionAttribute(name="user", required = false)User user) throws Exception {
        System.out.println("[ WorkController.getWork() start........]");

        Map<String, Object> map=workService.getMyWork(user.getUserId());
        model.addAttribute("list",map.get("list"));
        model.addAttribute("myCount",map.get("myCount"));
        return "work/getWork";

    }

    @RequestMapping ("getDetailWork")
    public String getDetailWork( @RequestParam("workNo") int workNo, Model model, @SessionAttribute(name="user", required = false)User user) throws Exception {
        System.out.println("[ WorkController.getWork() start........]");
        Work work = workService.getWork(workNo);
        work.setViewCnt(work.getViewCnt()+1);
        workService.updateViews(work);

        Map<String, Object> map=episodeService.listEpisode(workNo);
        model.addAttribute("bookmark",workService.getBookmarksByUserId(user.getUserId()));
        model.addAttribute("purchase",episodeService.getPurchaseEpisode(user.getUserId()));
        model.addAttribute("work",work);
        model.addAttribute("list",map.get("list"));
        model.addAttribute("totalCount",map.get("totalCount"));
        return "episode/listEpisode";
    }

    @RequestMapping ("listBookmark")
    public String listBookmark( @SessionAttribute(name="user", required = false)User user,Model model) throws Exception {
        System.out.println("[ WorkController.listBookmark() start........]");


        model.addAttribute("list",workService.listBookmark(user.getUserId()));
        //model.addAttribute("list",map.get("list"));
        //model.addAttribute("totalCount",map.get("totalCount"));
        return "work/bookmark";
    }
    @RequestMapping ("addBookmark")
    public String addBookmark( @RequestParam("workNo") int workNo, @SessionAttribute(name="user", required = false)User user,Model model) throws Exception {
        System.out.println("[ WorkController.addBookmark() start........]");
        Bookmark bookmark = new Bookmark();
        bookmark.setUserId(user.getUserId());
        bookmark.setWorkNo(workNo);
        workService.addBookmark(bookmark);
        model.addAttribute("list",workService.listBookmark(user.getUserId()));
        //model.addAttribute("list",map.get("list"));
        //model.addAttribute("totalCount",map.get("totalCount"));
        return "work/bookmark";
    }

    @RequestMapping ("deleteBookmark")
    public String deleteBookmark( @RequestParam("workNo") int workNo, @SessionAttribute(name="user", required = false)User user,Model model) throws Exception {
        System.out.println("[ WorkController.deleteBookmark() start........]");
        Bookmark bookmark = new Bookmark();
        bookmark.setUserId(user.getUserId());
        bookmark.setWorkNo(workNo);
        workService.deleteBookmark(bookmark);
        model.addAttribute("list",workService.listBookmark(user.getUserId()));
        //model.addAttribute("list",map.get("list"));
        //model.addAttribute("totalCount",map.get("totalCount"));
        return "work/bookmark";
    }


}
