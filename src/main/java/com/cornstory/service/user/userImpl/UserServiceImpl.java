package com.cornstory.service.user.userImpl;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.cornstory.common.Search;
import com.cornstory.domain.User;
import com.cornstory.service.user.UserDao;
import com.cornstory.service.user.UserService;

//==> 회원관리 서비스 구현
@Service
public class UserServiceImpl implements UserService {
    
	@Autowired
	@Qualifier("userDao")
	private UserDao userDao;
 
    public void setUserDao(UserDao userDao) {
        this.userDao = userDao;
    }

	
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
	public User deleteUser(String userId) throws Exception {
		// TODO Auto-generated method stub
		return userDao.deleteUser(userId);
	}

	@Override
	public Map<String, Object> listUser(Search search) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean idCheck(String userId) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean nickNameCheck(String nickname) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}

}
