<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <title>회원 목록 조회</title>
</head>

<body>
<div class="header">
    <h2>회원 목록 조회</h2>
    <div id="totalUsers">전체 회원 수: ${totalCount} 명</div>
</div>

<div class="search-container">
    <tr>
        <td>
            <select name="searchCondition" class="ct_input_g">
                <option value="0" ${!empty search.searchCondition && search.searchCondition == 0 ? "selected" : ""}>닉네임</option>
                <option value="1" ${!empty search.searchCondition && search.searchCondition == 1 ? "selected" : ""}>회원명</option>
            </select>
            <input type="text" id="searchInput"
                   value="${! empty search.searchKeyword ? search.searchKeyword : ""}"
                   placeholder="검색어를 입력하세요">
        </td>
            <button id="searchBtn">검색</button>
    </tr>
</div>
































<div style="width: 98%; margin-left: 10px;">
    <table>
        <thead>
        <tr>
            <th>No</th>
            <th>아이디</th>
            <th>닉네임</th>
            <th>성명</th>
            <th>휴대전화</th>
            <th>이메일</th>
            <th>회원 가입일</th>
            <th>정지 종료 일자</th>
        </tr>
        </thead>
        <tbody>
        <c:set var="i" value="0"/>
        <c:forEach var="user" items="${list}">
            <c:set var="i" value="${i + 1}"/>
            <tr class="ct_list_pop">
                <td>${i}</td>
                <td>${user.userId}</td>
                <td>${user.nickName}</td>
                <td>${user.userName}</td>
                <td>${user.phone}</td>
                <td>${user.email}</td>
                <td>${user.rDate}</td>
                <td>${user.banDate}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
<a href="../index.jsp">main 바로가기</a>&nbsp;<br>
</body>

</html>
