package com.cornstory.service.work.workImpl;

import com.cornstory.common.Search;
import com.cornstory.domain.Work;
import com.cornstory.service.work.WorkDao;
import com.cornstory.service.work.WorkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class WorkServiceImpl implements WorkService {

    @Autowired
    private WorkDao workDao;

    //Constructor
    public WorkServiceImpl(){
    }

    //Method
    @Override
    public void addWork(Work work) throws Exception {
        workDao.addWork(work);
    }

    @Override
    public Work getWork(int workNo) throws Exception {
        return workDao.getWork(workNo);
    }

    @Override
    public void updateWork(Work work) throws Exception {
        workDao.updateWork(work);
    }

    @Override
    public int deleteWork(int workNo) throws Exception {
        return workDao.deleteWork(workNo);
    }

    @Override
    public Map<String, Object> listWork(Search search) throws Exception {
        List<Work> list = workDao.listWork(search);
        int totalCount = workDao.getTotalCount(search);

        Map<String, Object> map = new HashMap<>();
        map.put("list", list);
        map.put("totalCount", totalCount);

        return map;
    }
}
