package com.cornstory.service.work;

import com.cornstory.common.Search;
import com.cornstory.domain.Work;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface WorkDao {
    // INSERT
    public void addWork(Work work) throws Exception ;

    // SELECT ONE
    public Work getWork(int workNo) throws Exception ;

    // UPDATE
    public void updateWork(Work work) throws Exception ;

    // delete
    public int deleteWork(int workNo) throws Exception ;

    // SELECT LIST
    public List<Work> listWork(Search search) throws Exception;

    // 게시판 Page 처리를 위한 전체Row(totalCount)  return
    public int getTotalCount(Search search) throws Exception ;
}
