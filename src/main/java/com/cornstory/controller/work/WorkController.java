package com.cornstory.controller.work;

import com.cornstory.common.Search;
import com.cornstory.domain.Work;
import com.cornstory.service.product.ProductService;
import com.cornstory.service.work.WorkService;
import jakarta.servlet.http.HttpServletRequest;
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
@RequestMapping("/work")
public class WorkController {

    @Autowired
    @Qualifier("workServiceImpl")
    private WorkService workService;

    @Autowired
    @Qualifier("productServiceImpl")
    private ProductService productService;

    public WorkController(){
        System.out.println("WorkController 진입");
    }

    @GetMapping("/addWork")
    public String addWork(Model model) throws Exception {
        System.out.println("[ WorkController.index() start........]");
        //user의 세션을 가져와야함.
        model.addAttribute("list",productService.getCopylight("user001"));
        return "work/addWork";

    }
    @PostMapping("/addWork")
    public String addWork(@ModelAttribute("work") Work work, @RequestParam("thumbnailFile") MultipartFile file) throws Exception {
        String fileName = work.getUserId() + "_" + work.getWorkName();
        fileName.replaceAll("[^a-zA-Z0-9_]", "_");
        fileName+=".jpg";
        if (!file.isEmpty()) {
            try {
                String uploadDir = "C:\\CornStory\\src\\main\\resources\\file\\work";
                String filePath = uploadDir + File.separator + fileName;

                Files.write(Path.of(filePath), file.getBytes(), StandardOpenOption.CREATE, StandardOpenOption.TRUNCATE_EXISTING);

                // 파일 경로를 Work 객체에 저장

                work.setThumbnail(filePath);
            } catch (IOException e) {
                e.printStackTrace();
            }

        }




        // 여기서 workService를 이용하여 작품 추가 로직을 호출해야 함
        //프론트좀더해야됨
         workService.addWork(work);

        return "index";
    }

    @GetMapping("/updateWork")
    public String updateWork() throws Exception{
        System.out.println("[ WorkController.index() start........]");

        return "redirect:/work/updateWork";

    }
    @GetMapping("/deleteWork")
    public String deleteWork() throws Exception{
        System.out.println("[ WorkController.index() start........]");

        return "redirect:/work/deleteWork";

    }
    @RequestMapping ("/listWork")
    public String listWork(@ModelAttribute("search") Search search, Model model) throws Exception {
        System.out.println("[ WorkController.index() start........]");

        Map<String, Object> map=workService.listWork(search);

        model.addAttribute("list",map.get("list"));
        model.addAttribute("totalCount",map.get("totalCount"));
        model.addAttribute("search", search);
        return "work/listWork";

    }

}
