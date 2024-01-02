package com.cornstory.service.user;

import com.cornstory.common.Search;
import com.cornstory.domain.User;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface UserDao {
	// INSERT
	public void addUser(User user) throws Exception ;

	// SELECT ONE
	public User getUser(String userId) throws Exception ;

	// UPDATE
	public void updateUser(User user) throws Exception ;

	public void updateBan(User user) throws Exception;

	// UPDATE
	public void deleteUser(String userId) throws Exception ;

	// SELECT LIST
	public List<User> listUser(Search search) throws Exception ;

	// 게시판 Page 처리를 위한 전체Row(totalCount)  return
	public int getTotalCount(Search search) throws Exception ;

	// 닉네임 중복 체크
	public User nickNameCheck(String nickName) throws Exception;


// 구매시에 회원 팝콘수 바뀌는 메소드
	public int updateUserPopcornCnt(Map map) throws Exception;

	public void banUser(User user) throws Exception;
}
