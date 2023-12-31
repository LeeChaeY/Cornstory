
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
	public void updateBan(User user) throws Exception {
		userDao.updateBan(user);
	}

	@Override
	public void deleteUser(String userId) throws Exception {
		// TODO Auto-generated method stub

		userDao.deleteUser(userId);
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


	public int updateUserPopcornCnt(Map map) throws Exception {
		return userDao.updateUserPopcornCnt(map);
	}

	@Override
	public User processKakaoLogin(Map<String, String> kakaoInfo) throws Exception {
		// 카카오로부터 받은 정보로 유저를 찾거나 생성
		User user = userDao.getUser(kakaoInfo.get("userId"));

		// 가입 여부에 따라 처리
		if (user == null) {
			// 가입된 정보가 없으면 회원가입 처리
			user = new User();
			user.setUserId(kakaoInfo.get("userId"));
			user.setNickName(kakaoInfo.get("nickName"));
			user.setEmail(kakaoInfo.get("email"));
			// ... 다른 정보들을 업데이트
			userDao.addUser(user);
		} else {
			// 기존 정보 업데이트 등의 로직이 필요하다면 추가
		}

		return user;
	}

	@Override
	public void banUser(User user) throws Exception {
		userDao.banUser(user);
	}
}
