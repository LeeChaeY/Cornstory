<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
    <title>작업 목록</title>
</head>
<body>

<h2>작업 목록</h2>

<form action="${pageContext.request.contextPath}/work/listWork" method="get">
    <label for="searchKeyword">검색 키워드:</label>
    <input type="text" id="searchKeyword" name="searchKeyword" value="${search.searchKeyword}" />

    <!-- 검색과 관련된 다른 입력 필드를 Search 클래스 속성을 기반으로 추가하세요 -->

    <button type="submit">검색</button>
</form>

<table border="1">
    <thead>
    <tr>
        <th>작업 번호</th>
        <th>작성자</th>
        <th>카테고리</th>
        <th>장르</th>
        <th>FAP</th>
        <th>작업 이름</th>
        <th>메모</th>
        <th>썸네일</th>
        <th>조회 수</th>
        <th>작업 일자</th>
        <th>상태</th>
        <th>작업 설명</th>
        <th>완료 여부</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="work" items="${list}">
        <tr>
            <td>${work.workNo}</td>
            <td>${work.userId}</td>
            <td>${work.category}</td>
            <td>${work.genre1}, ${work.genre2}, ${work.genre3}</td>
            <td>${work.fap}</td>
            <td>${work.workName}</td>
            <td>${work.note}</td>
            <td>${work.thumbnail}</td>
            <td><fmt:formatNumber value="${work.viewCnt}" pattern="#,##0" /></td>
            <td>${work.workDate}</td>
            <td>${work.status}</td>
            <td>${work.workDesc}</td>
            <td>${work.complete}</td>
        </tr>
    </c:forEach>
    </tbody>
</table>

<p>전체 개수: ${totalCount}</p>

</body>
</html>
