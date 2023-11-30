package com.cornstory.service.work;

import com.cornstory.common.Search;
import com.cornstory.domain.Work;

import java.util.List;

public interface WorkService {

    public void addWork(Work work) throws Exception;
    public Work getWork(int workNo) throws Exception;
    public void updateWork(Work work) throws Exception;
    public int deleteWork(Work work) throws Exception;
    public List<Work> listWork(Search search) throws Exception;


}
