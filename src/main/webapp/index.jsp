<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Main화면</title>

</head>

<body>
<h2>Main</h2>
<div style="font-size: 15px;">
   <%= new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date()) %>
</div>

<!--로그인되어 있을때 볼 수 있는 위치 -->
<c:if test="${sessionScope.user != null}">
  <p>안녕하세요, ${sessionScope.user.nickName}님!</p>
  <p>회원님의 등급은,
    <c:choose>
      <c:when test="${sessionScope.user.role eq 1}">관리자</c:when>
      <c:otherwise>회원</c:otherwise>
    </c:choose>
    입니다.!</p><br>

  <form action="/user/logout" method="post">
    <br> <button type="submit">로그아웃</button>
  </form>

  User-회원<br>
  <a href="getUser?userId=${sessionScope.user.userId}">회원정보 조회</a>&nbsp&nbsp&nbsp
  <!-- 관리자인 경우에만 특정 기능 표시 -->
  <c:if test="${sessionScope.user.role eq 1}">
    <a href="/user/listUser">목록 조회</a>
  </c:if><br><br>

  Work-작품<br>
  <!-- 관리자인 경우에만 특정 기능 표시 -->
  <c:if test="${sessionScope.user.role eq 1}">
  </c:if><br><br>

  Story-작품<br>
  <!-- 관리자인 경우에만 특정 기능 표시 -->
  <c:if test="${sessionScope.user.role eq 1}">
  </c:if><br><br>

  Chat-채팅<br>
  <!-- 관리자인 경우에만 특정 기능 표시 -->
  <c:if test="${sessionScope.user.role eq 1}">
  </c:if><br><br>

  Product-상품<br>
  <!-- 관리자인 경우에만 특정 기능 표시 -->
  <c:if test="${sessionScope.user.role eq 1}">
  </c:if><br><br>

  Purchase-판매&구매<br>
  <!-- 관리자인 경우에만 특정 기능 표시 -->
  <c:if test="${sessionScope.user.role eq 1}">
  </c:if><br><br>

  Support-고객센터<br>
  <!-- 관리자인 경우에만 특정 기능 표시 -->
  <c:if test="${sessionScope.user.role eq 1}">
  </c:if><br><br>



</c:if>

<!--로그인 안되어 있을때 볼 수 있는 위치 -->

<c:if test="${sessionScope.user == null}">

  <!-- 로그인 페이지로 이동하는 링크 또는 다른 작업 추가 -->
  <a href="/user/login">로그인</a>

</c:if>

</body>

</html>
