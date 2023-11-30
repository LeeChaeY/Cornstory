package com.cornstory;

import com.cornstory.domain.Bookmark;
import com.cornstory.domain.Episode;
import com.cornstory.domain.Work;
import com.cornstory.common.Search;
import com.cornstory.service.work.BookmarkService;
import com.cornstory.service.work.WorkService;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
public class WorkTests {

	@Autowired
	private WorkService workService;

	@Autowired
	private BookmarkService bookmarkService;
	//@Test
	public void testAddWork() throws Exception {
		Work testWork = createTestWork();
		workService.addWork(testWork);

		Work addedWork = workService.getWork(testWork.getWorkNo());

		assertNotNull(addedWork);
		assertEquals(testWork.getWorkNo(), addedWork.getWorkNo());
		assertEquals(testWork.getUserId(), addedWork.getUserId());
		// 추가로 필요한 필드들을 검증합니다.
	}

	//@Test
	public void testListWork() throws Exception {
		// 데이터베이스에 적절한 테스트 데이터가 있어야 합니다.
		Search testSearch = new Search();
		//testSearch.setSearchCondition("0");
		testSearch.setSearchKeyword("user001");
		//testSearch.setOrderKeyword("일상");
		//testSearch.setOrderCondition("1");

		List<Work> workList = workService.listWork(testSearch);
		for (Work work : workList) {
			System.out.println(work);
		}
		//assertNotNull(workList);
		//assertFalse(workList.isEmpty());
		// 필요에 따라 리스트의 사이즈, 각 원소의 필드 등을 검증합니다.
	}

	//@Test
	public void testUpdateWork() throws Exception {
		Work testWork = createTestWork();
		workService.addWork(testWork);

		testWork.setWorkName("Updated Test Work");
		workService.updateWork(testWork);

		Work updatedWork = workService.getWork(testWork.getWorkNo());

		assertNotNull(updatedWork);
		assertEquals(testWork.getWorkNo(), updatedWork.getWorkNo());
		assertEquals("Updated Test Work", updatedWork.getWorkName());
		// 필요에 따라 수정된 필드를 검증합니다.
	}

	//@Test
	public void testDeleteWork() throws Exception {
		Work testWork = createTestWork();
		workService.addWork(testWork);

		workService.deleteWork(testWork);

		Work deletedWork = workService.getWork(testWork.getWorkNo());

		assertNull(deletedWork);
		// 삭제 후에는 null이 반환되어야 합니다.
	}

	private Work createTestWork() {
		Work testWork = new Work();
		testWork.setUserId("testUser");
		testWork.setCategory(1);
		testWork.setGenre1("Action");
		testWork.setWorkName("Test Work");
		testWork.setThumbnail("test_thumbnail.jpg");
		// 필요한 필드들을 채워넣습니다.

		return testWork;
	}

	@Test
	public void testAddAndGetBookmark() {
		Bookmark bookmark = new Bookmark();
		bookmark.setUserId("user001");
		bookmark.setWorkNo(10001);

		bookmarkService.addBookmark(bookmark);

		//assertNull(bookmark.getBookmarkNo()); // 삽입 후에는 bookmarkNo가 설정되어야 함

		Bookmark retrievedBookmark = bookmarkService.getBookmarkByNo(bookmark.getBookmarkNo());
		assertEquals("user001", retrievedBookmark.getUserId());
		assertEquals(10001, retrievedBookmark.getWorkNo());
	}

	//@Test
	public void testRemoveBookmark() {
		Bookmark bookmark = new Bookmark();
		bookmark.setUserId("user004");
		bookmark.setWorkNo(10004);

		bookmarkService.addBookmark(bookmark);

		assertNotNull(bookmarkService.getBookmarksByUserId(bookmark.getUserId()));
	}

	//@Test
	public void testGetBookmarksByUserId() {
		// 특정 사용자에 대한 북마크 조회
		List<Bookmark> bookmarks = bookmarkService.getBookmarksByUserId("user001");
		for (Bookmark bookmark : bookmarks) {
			System.out.println(bookmark);
		}
		assertNotNull(bookmarks);
	}


}
