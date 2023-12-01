package com.cornstory.service.support.supportImpl;

import com.cornstory.common.Search;
import com.cornstory.domain.Support;
import com.cornstory.service.support.SupportDao;
import com.cornstory.service.support.SupportService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class SupportServiceImpl implements SupportService {
    @Autowired
    private SupportDao supportDao;

    @Override
    public void addSupport(Support support) throws Exception {
        supportDao.addSupport(support);
    }

    @Override
    public Support getSupport(int supNo) throws Exception {
        return supportDao.getSupport(supNo);
    }

    @Override
    public int deleteSupport(int supNo) throws Exception {
        return supportDao.deleteSupport(supNo);
    }

    @Override
    public void updateSupport(Support support) throws Exception {
        supportDao.updateSupport(support);
    }

    @Override
    public Map<String, Object> listSupport(Search search) throws Exception {
        List<Support> list = supportDao.listSupport(search);
        int totalCount = supportDao.getTotalCount(search);

        Map<String, Object> map = new HashMap<>();
        map.put("list", list);
        map.put("totalCount", totalCount); // 이 부분에서 변경

        return map;
    }
}
