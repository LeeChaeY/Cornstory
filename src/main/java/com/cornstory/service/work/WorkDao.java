package com.cornstory.service.work;

import com.cornstory.common.Search;
import com.cornstory.domain.Work;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface WorkDao {

    public void addWork(Work work);
    public Work getWork(int workNo);
    public void updateWork(Work work);
    public int deleteWork(Work work);
    public List<Work> listWork(Search search);

}
