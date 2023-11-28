package com.cornstory.service.user;

import java.util.List;

import com.cornstory.common.Search;
import com.cornstory.domain.User;

//==> 회원관리에서 CRUD 추상화/캡슐화한 DAO Interface Definition
public interface UserDao {
	
	// INSERT
	public void addUser(User user) throws Exception ;

	// SELECT ONE
	public User getUser(String userId) throws Exception ;

	// UPDATE
	public void updateUser(User user) throws Exception ;
	
	// UPDATE
	public User deleteUser(String userId) throws Exception ;

	// SELECT LIST
	public List<User> listUser(Search search) throws Exception ;	
	
	// 게시판 Page 처리를 위한 전체Row(totalCount)  return
	public int getTotalCount(Search search) throws Exception ;
	
}
