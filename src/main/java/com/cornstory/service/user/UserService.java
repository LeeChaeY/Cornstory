package com.cornstory.service.user;

import java.util.Map;

import com.cornstory.common.Search;
import com.cornstory.domain.User;

//==> 회원관리에서 서비스할 내용 추상화/캡슐화한 Service  Interface Definition
public interface UserService {

    // 회원가입
    public void addUser(User user) throws Exception;

    // 내정보확인 / 로그인
    public User getUser(String userId) throws Exception;

    // 내정보확인 탈퇴
    public void deleteUser(String userId) throws Exception;

    // 회원정보리스트
    public Map<String , Object> listUser(Search search) throws Exception;

    // 회원정보수정
    public void updateUser(User user) throws Exception;

    public void updateBan(User user) throws Exception;

    // 회원 ID 중복 확인
    public boolean idCheck(String userId) throws Exception;

    // 회원 NickName 중복 확인
    public boolean nickNameCheck(String nickname) throws Exception;

    public int updateUserPopcornCnt(Map map) throws Exception;

    String processKakaoLogin(Map<String, String> kakaoInfo) throws Exception;

}