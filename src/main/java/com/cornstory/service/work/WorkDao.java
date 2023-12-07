package com.cornstory.service.work;

import com.cornstory.common.Search;
import com.cornstory.domain.Work;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

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
    public int getTotalCount(Search search) throws Exception;

    public Work getDuplication(Work work) throws Exception;

    //작가 작품의 리스트
    public List<Work> getMyWork(String userId) throws Exception;

    //작가 작품의 리스트 갯수
    public int getMyWorkCount(String userId) throws Exception;
}
