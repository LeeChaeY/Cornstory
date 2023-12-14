package com.cornstory;

import com.cornstory.common.Search;
import com.cornstory.domain.Episode;
import com.cornstory.domain.Product;
import com.cornstory.domain.Work;
import com.cornstory.service.product.ProductService;
import com.cornstory.service.work.WorkService;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.sql.Date;
import java.util.List;
import java.util.Map;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class WorkTests {

	@Autowired
	private WorkService workService;

	int num = 10011;

	//@Test
	public void testAddWork() throws Exception {
		//작품 추가 test
		System.out.println("Add");
		Work work = new Work();

		work.setUserId("how");
		work.setCategory(1);
		work.setGenre1("로맨스");
		work.setGenre2("");
		work.setGenre3("");
		work.setFap(1);
		work.setWorkName("test웹드라마");
		work.setNote("미입력");
		work.setThumbnail("thumbnail_image.jpg");
		work.setViewCnt(0);
		work.setStatus(0);
		work.setWorkDesc("작품에 대한 설명을 작성해주세요.");
		work.setComplete(0);

		workService.addWork(work);
		System.out.println("성공적으로 생성 되었습니다." + work + "\n");

	}

	//@Test
	public void testGetWork() throws Exception {
		System.out.println("GET");
		Work work = workService.getWork(num);
		// 조회된 작품이 null이 아니면 성공
//		assertNotNull(work);
//		assertEquals("test웹드라마", work.getWorkName());
//		assertEquals("how", work.getUserId());

		System.out.println(work);
	}

	//@Test
	public void testUpdateWork() throws Exception {
		Work work = workService.getWork(num); // 작품 번호에 맞게 변경
		assertNotNull(work);
		System.out.println("기존 작품 정보: " + work);

		// 업데이트할 정보 설정
		work.setWorkName("수정된 이야기");
		work.setGenre1("학원");
		work.setGenre2(null);
		work.setGenre3(null);
		work.setNote("작가의 노트 수정");
		work.setWorkDesc("미입력");
		work.setThumbnail("thumbnail_image.jpg");
		work.setFap(1);
		work.setComplete(1);

		// 작품 정보 업데이트
		workService.updateWork(work);
		System.out.println("업데이트된 작품 정보: " + work);

		// 업데이트 후의 작품 정보 확인
		Work updatedWork = workService.getWork(num); // 작품 번호에 맞게 변경
		assertEquals("수정된 이야기", updatedWork.getWorkName());
	}

	//@Test
	public void testDeleteWork() throws Exception {
		int result = workService.deleteWork(num);  // 삭제할 작품의 번호로 변경
		assertEquals(1, result);
		System.out.println("삭제 완료");

		// 삭제 후에는 해당 작품이 존재하지 않아야 함
		Work nonExistentWork = workService.getWork(num);  // 삭제한 작품의 번호로 변경
		assertNull(nonExistentWork);
		System.out.println("기존 작품 정보: " + nonExistentWork);
	}

	//@Test
	public void testListWorkAll() throws Exception {
		System.out.println("List All");
		Search search = new Search();

		search.setSearchCondition("0");
		//search.setSearchKeyword("user001");
		search.setOrderKeyword("일상");
		search.setOrderCondition("1");


		Map<String, Object> result = workService.listWork(search);
		assertNotNull(result);
		int totalCount = (int) result.get("totalCount");
		System.out.println("전체 작품 개수: " + totalCount);
		List<Work> list = (List<Work>) result.get("list");
		for (Work work : list) {
			System.out.println("전체 작품 목록: " + work);
		}




		//assertTrue(totalCount >= 0);
		//assertTrue(list.size() >= 0);
	}
}
