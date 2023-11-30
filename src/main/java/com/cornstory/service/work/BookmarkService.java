package com.cornstory.service.work;

import com.cornstory.domain.Bookmark;

import java.util.List;

public interface BookmarkService {

    void addBookmark(Bookmark bookmark);


    void removeBookmark(int bookmarkNo);

    Bookmark getBookmarkByNo(int bookmarkNo);

    List<Bookmark> getBookmarksByUserId(String userId);


}
