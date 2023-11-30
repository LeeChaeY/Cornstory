package com.cornstory.service.work.workImpl;

import com.cornstory.domain.Bookmark;
import com.cornstory.service.work.BookmarkDao;
import com.cornstory.service.work.BookmarkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BookmarkImpl implements BookmarkService {

    @Autowired
    private BookmarkDao bookmarkDao;

    @Override
    public void addBookmark(Bookmark bookmark) {
        bookmarkDao.addBookmark(bookmark);
    }

    @Override
    public void removeBookmark(int bookmarkNo) {
        bookmarkDao.deleteBookmark(bookmarkNo);
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
