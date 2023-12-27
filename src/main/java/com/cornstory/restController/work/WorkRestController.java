package com.cornstory.restController.work;


import com.cornstory.common.Search;
import com.cornstory.domain.User;
import com.cornstory.domain.Work;
import com.cornstory.service.work.WorkService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
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
    public String checkWorkName(@RequestParam String userId, @RequestParam String workName) throws Exception {
        System.out.println("checkWorkName()");
        Work work = new Work();
        work.setUserId(userId);
        work.setWorkName(workName);

        return workService.getDuplication(work).getWorkName();
    }

    @GetMapping("json/listWork")
    public Map<String, Object> listWorksPaged(@RequestParam(required = false) String searchCondition,
                                              @RequestParam(required = false) String orderKeyword,
                                              @RequestParam(required = false) String orderCondition,
                                              @RequestParam(required = false) String searchKeyword,
                                              @RequestParam int currentPage,
                                              @RequestParam int pageSize) throws Exception {
        Search search = new Search();
        search.setSearchKeyword(searchKeyword);
        search.setSearchCondition(searchCondition);
        search.setOrderKeyword(orderKeyword);
        search.setOrderCondition(orderCondition);
        search.setCurrentPage(currentPage);
        search.setPageSize(pageSize);



        // 작품 목록 조회
        Map<String, Object> map = workService.listWork(search);

        map.put("list", map.get("list"));
        map.put("totalCount", map.get("totalCount"));
        map.put("search", search);

        return map;
    }

}
