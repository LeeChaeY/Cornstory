<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
    <title>작품 목록</title>
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
</head>
<body>

<h2>작품 목록</h2>
<table border="1">
    <thead>
    <tr>
        <th>작품 번호</th>
        <th>작성자</th>
        <th>카테고리</th>
        <th>장르</th>
        <th>FAP</th>
        <th>작업 이름</th>
        <th>메모</th>
        <th>썸네일</th>
        <th>조회 수</th>
        <th>작업 일자</th>
        <th>창작여부</th>
        <th>작업 설명</th>
        <th>작업 수정</th>
        <th>작업 삭제</th>
    </tr>
    </thead>
    <tbody id="workListBody">
    <c:forEach var="work" items="${list}">
        <tr>
            <td>${work.workNo}</td>
            <td>${work.userId}</td>
            <td>
                <c:choose>
                    <c:when test="${work.category eq '0'}">웹소설</c:when>
                    <c:when test="${work.category eq '1'}">웹툰</c:when>
                    <c:when test="${work.category eq '2'}">웹드라마</c:when>
                    <c:otherwise>기타</c:otherwise>
                </c:choose>
            </td>
            <td>
                    ${work.genre1}
                <c:if test="${not empty work.genre2}">, ${work.genre2}</c:if>
                <c:if test="${not empty work.genre3}">, ${work.genre3}</c:if>
            </td>
            <td>${work.fap == 0 ? '무료' : '유료'}</td>
            <td>${work.workName}</td>
            <td>${work.note}</td>
            <td>${work.thumbnail}</td>
            <td><fmt:formatNumber value="${work.viewCnt}" pattern="#,##0" /></td>
            <td>${work.workDate}</td>
            <td>${work.status == 0 ? '원작' : '창작'}</td>
            <td>${work.workDesc}</td>
            <td>
                <a href="../work/updateWork?workNo=${work.workNo}">수정</a>
            </td>
            <td>
                <a href="../work/deleteWork?workNo=${work.workNo}">삭제</a>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>

<p>전체 개수: ${myCount}</p>

</body>

</html>
