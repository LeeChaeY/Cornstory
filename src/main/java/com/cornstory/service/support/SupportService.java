package com.cornstory.service.support;

import com.cornstory.common.Search;
import com.cornstory.domain.Support;

import java.util.Map;

public interface SupportService {

    public void addSupport(Support support) throws Exception;

    public Support getSupport(int supNo) throws Exception;

    public int deleteSupport(int supNo) throws Exception;

    public void updateSupport(Support support) throws Exception;

    public Map<String,Object> listSupport(Search search) throws Exception;


}
