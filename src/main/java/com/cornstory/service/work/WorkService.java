package com.cornstory.service.work;

import com.cornstory.common.Search;
import com.cornstory.domain.Work;

import java.util.Map;

public interface WorkService {

    // 작품 등록
    public void addWork(Work work) throws Exception;

    // 작품 상세 조회
    public Work getWork(int workNo) throws Exception;

    // 작품 수정
    public void updateWork(Work work) throws Exception;

    // 작품 삭제
    public int deleteWork(int workNo) throws Exception;

    // 작품 목록
    public Map<String,Object> listWork(Search search) throws Exception;

}
