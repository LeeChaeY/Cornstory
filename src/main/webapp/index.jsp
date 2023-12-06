<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>대시보드</title>
</head>

<body>
<h2>대시보드</h2>

<c:if test="${sessionScope.user != null}">
  <p>안녕하세요, ${sessionScope.user.userId}님!</p>
  <!-- 기타 사용자 정보에 대한 출력 또는 작업 추가 -->
  <form action="/user/logout" method="post">
    <button type="submit">로그아웃</button>
  </form>
</c:if>

<c:if test="${sessionScope.user == null}">
  <p>세션이 만료되었거나 로그인되어 있지 않습니다.</p>
  <!-- 로그인 페이지로 이동하는 링크 또는 다른 작업 추가 -->
  <a href="/user/login">로그인</a>
</c:if>
</body>

</html>
