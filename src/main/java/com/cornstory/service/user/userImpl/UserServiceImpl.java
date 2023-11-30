
package com.cornstory.service.user.userImpl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cornstory.common.Search;
import com.cornstory.domain.User;
import com.cornstory.service.user.UserDao;
import com.cornstory.service.user.UserService;

//==> 회원관리 서비스 구현
@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDao userDao;

	//Constructor
	public UserServiceImpl() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public void addUser(User user) throws Exception {
		// TODO Auto-generated method stub
		userDao.addUser(user);
	}

	@Override
	public User getUser(String userId) throws Exception {
		// TODO Auto-generated method stub
		return userDao.getUser(userId);
	}

	@Override
	public void updateUser(User user) throws Exception {
		// TODO Auto-generated method stub
		userDao.updateUser(user);
	}

	@Override
	public int deleteUser(String userId) throws Exception {
		// TODO Auto-generated method stub
		return userDao.deleteUser(userId);
	}

	@Override
	public Map<String, Object> listUser(Search search) throws Exception {
		// TODO Auto-generated method stub
		List<User> list = userDao.listUser(search);
		int totalCount = userDao.getTotalCount(search);

		Map<String, Object> map = new HashMap<>();
		map.put("list", list);
		map.put("totalCount", totalCount); // 이 부분에서 변경

		return map;
	}


	@Override
	public boolean idCheck(String userId) throws Exception {
		// TODO Auto-generated method stub
		boolean result = true;
		User user = userDao.getUser(userId);
		if (user != null) {
			result = false; // 사용자가 존재하면 중복이므로 false 반환
		}
		return result; // 사용자가 존재하지 않으면 true 반환
	}

	@Override
	public boolean nickNameCheck(String nickName) throws Exception {
		boolean result = true; // 기본적으로 중복이 없다고 가정
		User user = userDao.nickNameCheck(nickName); // 닉네임으로 사용자 조회
		// 사용자가 존재하면 중복이므로 false 반환
		if (user != null) {
			result = false;
		}
		return result; // 사용자가 존재하지 않으면 true 반환
	}
}
