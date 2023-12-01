package com.cornstory.service.support;

import com.cornstory.common.Search;
import com.cornstory.domain.Support;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface SupportDao {
    public void addSupport(Support support) throws Exception;

    public Support getSupport(int supNo) throws Exception;

    public int deleteSupport(int supNo) throws Exception;

    public void updateSupport(Support support) throws Exception;

    public List<Support> listSupport(Search search) throws Exception;

    public int getTotalCount(Search search) throws Exception ;
}
