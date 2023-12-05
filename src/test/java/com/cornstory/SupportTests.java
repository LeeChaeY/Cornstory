package com.cornstory;

import com.cornstory.common.Search;
import com.cornstory.domain.Support;
import com.cornstory.service.support.SupportService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;
import java.util.Map;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class SupportTests {


	@Autowired
	private SupportService supportService;

	int num =10000;
//	@Test
	public void testAddSupport() throws Exception {
		System.out.println("Add Support");
		/*
		*  category = 0 : Q&A 1: 공지사항
		* ROLE = Q 질문 A 답변 G 공지사항
		* */
		// 테스트용 Support 객체 생성
		Support support = new Support();
		support.setUserId("static/file/user");
		support.setSupCategory(1);
		support.setSupContent("등록 내용");



		// Support 추가
		supportService.addSupport(support);

		// Support가 정상적으로 추가되었는지 확인
		//assertNotNull(support.getSupNo());
	}

	//@Test
	public void testGetSupport()throws Exception{
		System.out.println("GET");
		Support support = supportService.getSupport(num);
		// 조회된 작품이 null이 아니면 성공
		assertNotNull(support);


		System.out.println(support);
	}

	//@Test
	public void testUpdateWork() throws Exception {
		Support support = supportService.getSupport(num); // 작품 번호에 맞게 변경
		assertNotNull(support);
		System.out.println("기존 정보: " + support);

		// 업데이트할 정보 설정
		support.setUserId("testUser");
		support.setSupCategory(0);
		support.setSupContent("등록 질문 내용 ");


		// 작품 정보 업데이트
		supportService.updateSupport(support);
		System.out.println("업데이트된  정보: " + support);

		// 업데이트 후의 작품 정보 확인
		Support ups = supportService.getSupport(num); // 작품 번호에 맞게 변경

	}

	//@Test
	public void testDeleteSupport() throws Exception {
		int result = supportService.deleteSupport(num);  // 삭제할 작품의 번호로 변경
		assertEquals(1, result);
		System.out.println("삭제 완료");

		// 삭제 후에는 해당 작품이 존재하지 않아야 함
		int nonExistentWork = supportService.deleteSupport(num);
		assertEquals(0, nonExistentWork);

		System.out.println("기존 작품 정보: " + nonExistentWork);
	}

	//@Test
	public void testListSupportQnA() throws Exception {
		// 검색 조건 설정
		Search search = new Search();
		search.setCurrentPage(1);
		search.setPageSize(3);

		Map<String, Object> map = supportService.listSupport(search);
		System.out.println(map);
		List<Object> list = (List<Object>) map.get("list");
		Integer totalCount = (Integer) map.get("totalCount");

		assertTrue(totalCount >= 1 && list.size() >= 1);

		search.setSearchCondition("1");
		map = supportService.listSupport(search);

		System.out.println(map);
		list = (List<Object>) map.get("list");
		totalCount = (Integer) map.get("totalCount");
		System.out.println("list"+list);
		System.out.println(totalCount);
		assertTrue(totalCount >= 1);
	}

}
