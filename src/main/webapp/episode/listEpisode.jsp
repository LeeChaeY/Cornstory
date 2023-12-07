<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
    <title>작품 회차목록</title>
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
</head>
<body>

<h2>작품 회차 목록</h2>
<div class="work-info">
    <div class="info-item">작품 번호: ${work.workNo}</div>
    <div class="info-item">작성자: ${work.userId}</div>
    <div class="info-item">카테고리:
        <c:choose>
            <c:when test="${work.category eq '0'}">웹소설</c:when>
            <c:when test="${work.category eq '1'}">웹툰</c:when>
            <c:when test="${work.category eq '2'}">웹드라마</c:when>
            <c:otherwise>기타</c:otherwise>
        </c:choose>
    </div>
    <div class="info-item">장르: ${work.genre1}
        <c:if test="${not empty work.genre2}">, ${work.genre2}</c:if>
        <c:if test="${not empty work.genre3}">, ${work.genre3}</c:if>
    </div>
    <div class="info-item">FAP: ${work.fap == 0 ? '무료' : '유료'}</div>
    <div class="info-item">작업 이름: ${work.workName}</div>
    <div class="info-item">메모: ${work.note}</div>
    <div class="info-item">썸네일: ${work.thumbnail}</div>
    <div class="info-item">조회 수: <fmt:formatNumber value="${work.viewCnt}" pattern="#,##0" /></div>
    <div class="info-item">작업 일자: ${work.workDate}</div>
    <div class="info-item">창작여부: ${work.status == 0 ? '원작' : '창작'}</div>
    <div class="info-item">작업 설명: ${work.workDesc}</div>
    <div class="info-item"><a href="">작품 회차추가</a></div>
</div>

<table border="1">
    <thead>
    <tr>
        <th>에피소드 No</th>
        <th>에피소드명</th>
        <th>에피소드 순서</th>
        <th>에피소드 대표이미지</th>
        <th>에피소드 등록일</th>
        <th>에피소드 파일명</th>
        <th>에피소드 디렉토리</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="episode" items="${list}">
        <tr>
            <td>${episode.episodeNo}</td>
            <td>${episode.episodeName}</td>
            <td>${episode.episodeOrder}</td>
            <td>${episode.thumbnail}</td>
            <td><fmt:formatDate value="${episode.episodeDate}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
            <td>${episode.fileName}</td>
            <td>${episode.directory}</td>
        </tr>
    </c:forEach>
    </tbody>
</table>

<p>전체 개수: ${totalCount}</p>

</body>

</html>
