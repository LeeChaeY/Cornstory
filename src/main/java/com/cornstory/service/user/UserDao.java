package com.cornstory.service.user;

import com.cornstory.common.Search;
import com.cornstory.domain.User;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
@Mapper
public interface UserDao {
	// INSERT
	public void addUser(User user) throws Exception ;

	// SELECT ONE
	public User getUser(String userId) throws Exception ;

	// UPDATE
	public void updateUser(User user) throws Exception ;

	public void updateBan(String userId) throws Exception;

	// UPDATE
	public int deleteUser(String userId) throws Exception ;

	// SELECT LIST
	public List<User> listUser(Search search) throws Exception ;

	// 게시판 Page 처리를 위한 전체Row(totalCount)  return
	public int getTotalCount(Search search) throws Exception ;

	// 닉네임 중복 체크
	public User nickNameCheck(String nickName) throws Exception;
}
