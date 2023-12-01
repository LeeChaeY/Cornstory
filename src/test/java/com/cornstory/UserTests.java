package com.cornstory;

import com.cornstory.service.user.UserDao;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.cornstory.common.Search;
import com.cornstory.domain.User;
import com.cornstory.service.user.UserService;

import java.sql.Date;
import java.util.List;
import java.util.Map;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class UserTests {

	@Autowired
	private UserService userService;
	//private UserDao userDao;
	//@Test
	public void testAddUser() throws Exception {
		// 사용자 추가 테스트
		System.out.println("잘 들어왔나??\n");
		User user = new User();
		user.setUserId("wow");
		user.setRole(0);
		user.setUserName("테스트 사용자");
		user.setNickName("TddUser");
		user.setPassword("testpassword");
		user.setBirthday(java.sql.Date.valueOf("1999-01-01"));
		user.setAddr("서울");
		user.setAddress("강남구");
		user.setPhone("01012345678");
		user.setEmail("testuser@example.com");
		user.setUserImage("default.jpg");

		System.out.println("잘들어 왔구만"+user+"\n");
		userService.addUser(user);
	}

	//@Test
	public void testGetUser() throws Exception {
		// 사용자 조회 테스트
		User user = userService.getUser("how");
		assertNotNull(user);
		assertEquals("테스트 사용자", user.getUserName());
		System.out.println(user);
	}
	//@Test
	public void testUpdateUser() throws Exception {
		// 사용자 업데이트 테스트
		User user = userService.getUser("how");
		assertNotNull(user);
		System.out.println("get"+user);

		String originalName = user.getUserName();
		user.setUserName("테스트 사용자");

		// 사용자 비밀번호 설정
		user.setPassword("newpassword");

		// 사용자 전화번호 설정
		user.setPhone("01098765432");

		userService.updateUser(user);
		System.out.println("update"+user);

		// 업데이트 후의 사용자 정보 확인
		User updatedUser = userService.getUser("how");
		assertNotNull(updatedUser);
		assertEquals("테스트 사용자", updatedUser.getUserName());

		/*// 업데이트 이전의 상태로 되돌리기
		user.setUserName(originalName);
		user.setPhone("01012345678");
		userService.updateUser(user);*/
	}

	@Test
	public void testUpdateBam() throws Exception {
		// 사용자 업데이트 테스트
		User user = userService.getUser("how");
		assertNotNull(user);
		System.out.println("get"+user);

		String originalName = user.getUserName();
		user.setUserName("테스트 사용자");
		user.setBanDate(new java.sql.Date(Date.valueOf("2023-12-01").getTime()));


		userService.updateBan(String.valueOf(user));
		System.out.println("update"+user);

		// 업데이트 후의 사용자 정보 확인
		User updatedUser = userService.getUser("how");
		assertNotNull(updatedUser);
		assertEquals("테스트 사용자", updatedUser.getUserName());


	}

	//@Test
	public void testDeleteUser() throws Exception {
		int result = userService.deleteUser("wow");  // 삭제된 회원 수를 반환
		assertEquals(1, result);  // 예상하는 값으로 변경

		// 삭제 후에는 해당 회원이 존재하지 않아야 함
		User nonExistent = userService.getUser("wow");  // 삭제한 회원아이디로 변경
		assertNull(nonExistent);
		System.out.println("기존 회원 정보: " + nonExistent);
	}



	//@Test
	public void testListUserALL() throws Exception {
		Search search = new Search();
		search.setCurrentPage(1);
		search.setPageSize(3);
		Map<String, Object> map = userService.listUser(search);
		System.out.println(map);

		List<Object> list = (List<Object>) map.get("list");
		Integer totalCount = (Integer) map.get("totalCount");
		System.out.println(totalCount);
		// 전체 사용자 수가 1 이상이면서 결과 리스트 크기가 1과 같거나 크다면 성공
		assertTrue(totalCount >= 1 && list.size() >= 3);
	}

	//@Test
	public void testListUserNickName() throws Exception {
		// 검색 조건을 주지 않은 경우
		Search search = new Search();
		search.setCurrentPage(1);
		search.setPageSize(3);
		Map<String, Object> map = userService.listUser(search);
		//System.out.println(map);

		List<Object> list = (List<Object>) map.get("list");
		Integer totalCount = (Integer) map.get("totalCount");
		System.out.println(list);
		// 전체 사용자 수가 1 이상이면서 결과 리스트 크기가 1과 같거나 크다면 성공
		assertTrue(totalCount >= 1 && list.size() >= 1);

		// 특정 상황에서 1개 이상의 사용자를 닉네임으로 검색할 수 있도록 검색 조건을 추가한 경우
		search.setSearchCondition("0");  // 0은 닉네임 검색을 의미
		search.setSearchKeyword("TestUser");  // 검색할 닉네임 설정
		map = userService.listUser(search);

		list = (List<Object>) map.get("list");
		totalCount = (Integer) map.get("totalCount");
		System.out.println("\n\n"+map);
		System.out.println(totalCount);
		// 전체 사용자 수가 1 이상이면서 결과 리스트 크기가 1과 같거나 크다면 성공
		assertTrue(totalCount >= 1 && list.size() >= 1);
	}

	//@Test
	public void testListUserName() throws Exception {
		// 검색 조건을 주지 않은 경우
		Search search = new Search();
		search.setCurrentPage(1);
		search.setPageSize(3);
		Map<String, Object> map = userService.listUser(search);
		//System.out.println(map);

		List<Object> list = (List<Object>) map.get("list");
		Integer totalCount = (Integer) map.get("totalCount");

		// 전체 사용자 수가 1 이상이면서 결과 리스트 크기가 1과 같거나 크다면 성공
		assertTrue(totalCount >= 1 && list.size() >= 1);

		// 특정 상황에서 1개 이상의 사용자를 닉네임으로 검색할 수 있도록 검색 조건을 추가한 경우
		search.setSearchCondition("1");  // 0은 이름 검색을 의미
		search.setSearchKeyword("임당");  // 검색할 이름 설정
		map = userService.listUser(search);

		list = (List<Object>) map.get("list");
		totalCount = (Integer) map.get("totalCount");
		System.out.println("list"+list);
		System.out.println(totalCount);
		// 전체 사용자 수가 1 이상이면서 결과 리스트 크기가 1과 같거나 크다면 성공
		assertTrue(totalCount >= 1 && list.size() >= 1);
	}

	//@Test
	public void testIdCheck() throws Exception {
		// 회원 ID 중복 확인 테스트
		String userId = "admin";
		// 기존 닉네임이므로 중복이므로 false
		System.out.println("Existing userId Check: " + userService.idCheck(userId));

	}

	//@Test
	public void testNickNameCheck() throws Exception {
		// 회원 닉네임 중복 확인 테스트
		String nick = "임당";
		// 기존 닉네임이므로 중복이므로 false
		System.out.println("Existing Nickname Check: " + userService.nickNameCheck(nick));

		// 새로운 닉네임이므로 중복이 아니어야 하므로 true
		//System.out.println("New Nickname Check: " + userService.nickNameCheck(nick + System.currentTimeMillis()));
	}

}
