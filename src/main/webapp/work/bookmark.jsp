<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
    <title>북마크 목록</title>
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
</head>
<body>

<h2>북마크 목록</h2>
<c:if test="${not empty list}">
<table border="1">
    <thead>
    <tr>
        <th>작품 번호</th>
        <th>작성자</th>
        <th>카테고리</th>
        <th>장르</th>
        <th>FAP</th>
        <th>작품 이름</th>
        <th>메모</th>
        <th>썸네일</th>
        <th>조회 수</th>
        <th>작업 일자</th>
        <th>창작여부</th>
        <th>작업 설명</th>
        <th>찜하기 삭제</th>
    </tr>
    </thead>
    <tbody id="workListBody">
    <c:forEach var="list" items="${list}">
        <tr>
            <td>${list.workNo}</td>
            <td>${list.userId}</td>
            <td>
                <c:choose>
                    <c:when test="${list.category eq '0'}">웹소설</c:when>
                    <c:when test="${list.category eq '1'}">웹툰</c:when>
                    <c:when test="${list.category eq '2'}">웹드라마</c:when>
                    <c:otherwise>기타</c:otherwise>
                </c:choose>
            </td>
            <td>
                    ${list.genre1}
                <c:if test="${not empty list.genre2}">, ${list.genre2}</c:if>
                <c:if test="${not empty list.genre3}">, ${list.genre3}</c:if>
            </td>
            <td>${list.fap == 0 ? '무료' : '유료'}</td>
            <td>${list.workName}</td>
            <td>${list.note}</td>
            <td>${list.thumbnail}</td>
            <td><fmt:formatNumber value="${list.viewCnt}" pattern="#,##0" /></td>
            <td>${list.workDate}</td>
            <td>${list.status == 0 ? '원작' : '창작'}</td>
            <td>${list.workDesc}</td>
            <td><a href="../work/deleteBookmark?workNo=${list.workNo}">찜취소</a></td>
        </tr>
    </c:forEach>
    </tbody>
</table>

<%--<p>전체 개수: ${myCount}</p>--%>
</c:if>
<c:if test="${empty list}">
목록이 없습니다.
</c:if>

</body>

</html>
