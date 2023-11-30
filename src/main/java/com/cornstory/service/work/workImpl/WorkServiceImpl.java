package com.cornstory.service.work.workImpl;

import com.cornstory.common.Search;
import com.cornstory.domain.Work;
import com.cornstory.service.work.WorkDao;
import com.cornstory.service.work.WorkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.nio.file.WatchService;
import java.util.List;

@Service
public class WorkServiceImpl implements WorkService {

    @Autowired
    private WorkDao workDao;

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
    public int deleteWork(Work work) throws Exception {
        return workDao.deleteWork(work);
    }

    @Override
    public List<Work> listWork(Search search) throws Exception {
        return workDao.listWork(search);
    }
}
