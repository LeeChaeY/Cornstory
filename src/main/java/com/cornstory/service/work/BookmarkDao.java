package com.cornstory.service.work;

import com.cornstory.domain.Bookmark;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface BookmarkDao {

    void addBookmark(Bookmark bookmark);

    void deleteBookmark(int bookmarkNo);

    Bookmark getBookmarkByNo(int bookmarkNo);

    List<Bookmark> getBookmarksByUserId(String userId);


}
