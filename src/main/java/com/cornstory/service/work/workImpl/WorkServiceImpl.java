package com.cornstory.service.work.workImpl;

import com.cornstory.common.Search;
import com.cornstory.domain.Bookmark;
import com.cornstory.domain.Work;
import com.cornstory.service.work.BookmarkDao;
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

    @Autowired
    private BookmarkDao bookmarkDao;

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

    @Override
    public Work getDuplication(Work work) throws Exception {
        return workDao.getDuplication(work);
    }
    @Override
    public Map<String, Object> getMyWork(String userId) throws Exception {
        List<Work> mylist = workDao.getMyWork(userId);
        int myCount = workDao.getMyWorkCount(userId);

        Map<String, Object> map = new HashMap<>();
        map.put("list", mylist);
        map.put("myCount", myCount);

        return map;
    }

    @Override
    public List<Work> listBookmark(String userId) throws Exception {

        return workDao.listBookmark(userId);
    }

    @Override
    public void updateViews(Work work) throws Exception {
        workDao.updateViews(work);
    }

    @Override
    public void addBookmark(Bookmark bookmark) {
        bookmarkDao.addBookmark(bookmark);
    }

    @Override
    public void deleteBookmark(Bookmark bookmark) {
        bookmarkDao.deleteBookmark(bookmark);
    }

    @Override
    public Bookmark getBookmarkByNo(int bookmarkNo) {
        return bookmarkDao.getBookmarkByNo(bookmarkNo);
    }

    @Override
    public List<Bookmark> getBookmarksByUserId(String userId) {
        return bookmarkDao.getBookmarksByUserId(userId);
    }


}
