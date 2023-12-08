<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>대시보드</title>

    <script type="text/javascript">

        $(function () {
            //==> 추가된부분 : "addUser"  Event 연결
            $("a[href='#' ]:contains('채팅')").on("click", function () {
                if ("${!empty sessionScope.user}") {
                    $(self.location).attr("href", "/chat/listChatSpace");
                }
            });

        });

    </script>
</head>

<body>
<h2>Main</h2>
<div style="font-size: 15px;">
    <%= new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date()) %>
</div>

<!--로그인 안되어 있을때 볼 수 있는 위치 -->
<c:if test="${sessionScope.user == null}">
    <!-- 로그인 페이지로 이동하는 링크 또는 다른 작업 추가 -->
    <a href="/user/login">로그인</a>
</c:if>

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

    <div>
        <p>User-회원</p>
        <a href="/user/getUser?userId=${sessionScope.user.userId}">회원정보 조회</a>&nbsp&nbsp&nbsp
        <!-- 관리자인 경우에만 특정 기능 표시 -->
        <c:if test="${sessionScope.user.role eq 1}">
            <a href="/user/listUser">목록 조회</a>
        </c:if><br><br>

        Work-작품<br>
        <!-- 관리자인 경우에만 특정 기능 표시 -->
        <c:if test="${sessionScope.user.role eq 1}">
            <a href="/work/listwork">작품 조회 목록</a>
            <a href="/work/bookmark">찜하기 조회</a>
            <a href="/work/addwork">작품 추가 조회</a>
            <a href="/work/updatework">작품 수정 조회</a>
            <a href="/work/getwork">작품 회차 목록</a>
            <a href="/work/addEpisode">작품 회차 추가</a>
            <a href="/work/listEpisode">작품 회차 추가</a>
        </c:if><br><br>

        Story-작품<br>
        <!-- 관리자인 경우에만 특정 기능 표시 -->
        <c:if test="${sessionScope.user.role eq 1}">
        </c:if><br><br>

        Chat-채팅<br>
        <!-- 관리자인 경우에만 특정 기능 표시 -->
        <c:if test="${sessionScope.user.role eq 1}">
        </c:if><br><br>

        <p>Product-상품</p>
        <a href="/product/listProduct">스토어</a>
        <br><br>

        <p>Purchase-판매&구매</p>
        미등록
        <br><br>

        <p>Support-고객센터</p>
        <!-- 관리자 또는 회원에 따라 링크가 다르게 표시 -->
        <c:choose>
            <c:when test="${sessionScope.user.role eq 1}">
                <a href="/support/addSupport?category=0">공지사항 등록</a>&nbsp
                <a href="/support/addSupport?category=1">Q&A[답변] 등록</a>
            </c:when>
            <c:otherwise>
                <a href="/support/addSupport?category=1">질문 등록</a>&nbsp
                <a href="/support/addSupport?category=2">신고 등록</a>
            </c:otherwise>
        </c:choose>
    </div>
</c:if>




<br><br>

</body>

</html>
