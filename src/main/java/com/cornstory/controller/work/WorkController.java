package com.cornstory.controller.work;

import com.cornstory.common.Search;
import com.cornstory.domain.Bookmark;
import com.cornstory.domain.User;
import com.cornstory.domain.Work;
import com.cornstory.service.episode.EpisodeService;
import com.cornstory.service.product.ProductService;
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

    public WorkController(){
        System.out.println("WorkController 진입");
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
        String fileName = work.getUserId() + "_" + work.getWorkName();
        fileName = fileName.replaceAll("[^a-zA-Z0-9가-힣_]", "_");
        fileName += ".jpg";
        if (!file.isEmpty()) {
            try {
                String uploadDir = "C:\\CornStory\\src\\main\\resources\\static\\file\\work";
                String filePath = uploadDir + File.separator + fileName;


                Files.write(Path.of(filePath), file.getBytes(), StandardOpenOption.CREATE, StandardOpenOption.TRUNCATE_EXISTING);

                // 파일 경로를 Work 객체에 저장
                System.out.println(filePath);
                work.setThumbnail("..\\file\\work"+ File.separator + fileName);
                System.out.println(work.toString());
            } catch (IOException e) {
                e.printStackTrace();
            }

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
        String fileName = work.getUserId() + "_" + work.getWorkName();
        fileName = fileName.replaceAll("[^a-zA-Z0-9가-힣_]", "_");
        fileName += ".jpg";
        if (!file.isEmpty()) {
            try {
                String uploadDir = "C:\\CornStory\\src\\main\\resources\\static\\file\\work";
                String filePath = uploadDir + File.separator + fileName;


                Files.write(Path.of(filePath), file.getBytes(), StandardOpenOption.CREATE, StandardOpenOption.TRUNCATE_EXISTING);

                // 파일 경로를 Work 객체에 저장

                work.setThumbnail("..\\file\\work"+ File.separator + fileName);
            } catch (IOException e) {
                e.printStackTrace();
            }

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
        workService.deleteBookmark(bookmark);;
        model.addAttribute("list",workService.listBookmark(user.getUserId()));
        //model.addAttribute("list",map.get("list"));
        //model.addAttribute("totalCount",map.get("totalCount"));
        return "work/bookmark";
    }


}
