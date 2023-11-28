package com.cornstory;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.cornstory.common.Search;
import com.cornstory.domain.User;
import com.cornstory.service.user.UserService;

@SpringBootTest
public class UserTest {

    @Autowired
    private UserService userService;

    @Test
    public void testAddUser() throws Exception {
        // 사용자 추가 테스트
    	System.out.println("잘 들어왔나??\n");
        User user = new User();
        user.setUserId("testuser");
        user.setRole(0);
        user.setUserName("테스트 사용자");
        user.setNickName("TestUser");
        user.setPassword("testpassword");
        user.setBirthday(java.sql.Date.valueOf("1990-01-01"));
        user.setAddr("서울");
        user.setAddress("강남구");
        user.setPhone("01012345678");
        user.setEmail("testuser@example.com");
        user.setUserImage("default.jpg");
        
        System.out.println("잘들어 왔구만"+user+"\n");
        userService.addUser(user);

        // 사용자 추가 후 조회하여 확인
        User addedUser = userService.getUser("testuser");
        assertNotNull(addedUser);
        assertEquals("testuser", addedUser.getUserId());
        assertEquals("테스트 사용자", addedUser.getUserName());
        // 추가적인 필드에 대한 확인 로직을 추가할 수 있습니다.
    }

    //@Test
    public void testUpdateUser() throws Exception {
        // 사용자 업데이트 테스트
        User user = userService.getUser("testuser");
        assertNotNull(user);

        // 업데이트 전의 사용자 정보 확인
        String originalName = user.getUserName();
        user.setUserName("수정된 사용자 이름");
        userService.updateUser(user);

        // 업데이트 후의 사용자 정보 확인
        User updatedUser = userService.getUser("testuser");
        assertNotNull(updatedUser);
        assertEquals("수정된 사용자 이름", updatedUser.getUserName());
        // 추가적인 필드에 대한 확인 로직을 추가할 수 있습니다.

        // 업데이트 이전의 상태로 되돌리기
        user.setUserName(originalName);
        userService.updateUser(user);
    }

    //@Test
    public void testDeleteUser() throws Exception {
        // 사용자 삭제 테스트
        User user = userService.getUser("testuser");
        assertNotNull(user);

        // 사용자 삭제 후 조회 시 null이 반환되어야 함
        User deletedUser = userService.deleteUser("testuser");
        assertNotNull(deletedUser);

        User nonExistentUser = userService.getUser("testuser");
        assertEquals(null, nonExistentUser);
    }

    //@Test
    public void testListUser() throws Exception {
        // 사용자 목록 조회 테스트
        Search search = new Search();
        search.setCurrentPage(1);
        search.setPageSize(10);

        // 사용자 목록 조회
        userService.listUser(search);
        // 실제로는 목록이 반환되는지 확인하는 로직을 추가할 수 있습니다.
    }

    //@Test
    public void testIdCheck() throws Exception {
        // 회원 ID 중복 확인 테스트
        boolean isIdDuplicated = userService.idCheck("testuser");
        assertEquals(false, isIdDuplicated);

        boolean isIdNotDuplicated = userService.idCheck("nonexistentuser");
        assertEquals(true, isIdNotDuplicated);
    }

    //@Test
    public void testNickNameCheck() throws Exception {
        // 회원 닉네임 중복 확인 테스트
        boolean isNickNameDuplicated = userService.nickNameCheck("TestUser");
        assertEquals(true, isNickNameDuplicated);

        boolean isNickNameNotDuplicated = userService.nickNameCheck("nonexistentnickname");
        assertEquals(false, isNickNameNotDuplicated);
    }
}
