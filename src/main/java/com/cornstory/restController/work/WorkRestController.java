package com.cornstory.restController.work;


import com.cornstory.common.Search;
import com.cornstory.domain.User;
import com.cornstory.domain.Work;
import com.cornstory.service.work.WorkService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

@RestController
@RequestMapping("/work/*")
public class WorkRestController {

    @Autowired
    @Qualifier("workServiceImpl")
    private WorkService workService;

    public WorkRestController() {
        System.out.println("WorkRestController 진입");
    }

    @GetMapping("json/checkWorkName")
    public int checkWorkName(@RequestParam String userId, @RequestParam String workName) throws Exception {
        System.out.println("checkWorkName()");
        Work work = new Work();
        work.setUserId(userId);
        work.setWorkName(workName);
        Work workNameCheck = workService.getDuplication(work);

        return (workNameCheck == null) ? 0 : 1;
    }

    @GetMapping("/json/listWork")
    public Map<String, Object> listWorks(@RequestParam(required = false) String searchCondition,
                                         @RequestParam(required = false) String orderKeyword,
                                         @RequestParam(required = false) String orderCondition) throws Exception {
        Search search = new Search();
        search.setSearchCondition(searchCondition);
        search.setOrderKeyword(orderKeyword);
        search.setOrderCondition(orderCondition);
        System.out.println("이건 RestController listWork() :"+search);
        // 작품 목록 조회
        return workService.listWork(search);
    }

}
