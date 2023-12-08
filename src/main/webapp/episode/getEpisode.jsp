<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
    <title>${work.workName} | ${episode.episodeOrder}화</title>

</head>
<body>

<h2>${work.workName} | ${episode.episodeOrder}화 | ${episode.episodeName}</h2>
<div>
    <strong>작품 회차 등록일:</strong> <fmt:formatDate value="${episode.episodeDate}" pattern="yyyy-MM-dd HH:mm:ss" />
</div>

<c:choose>
    <c:when test="${work.category eq '0'}">
        <div>
            <strong>에피소드 텍스트 내용:</strong>
            ${textContent}
        </div>
    </c:when>

    <c:when test="${work.category eq '1'}">
        <div>
            <strong>에피소드 이미지:</strong>
            <img src="${files}" alt="Episode Image" style="max-width: 300px; max-height: 300px; display: block;">
        </div>
    </c:when>

    <c:when test="${work.category eq '2'}">
        <div>
            <strong>에피소드 영상:</strong>
            <video controls width="300" autoplay="autoplay" muted="muted">
                <source id="mov01" src="${files}" type="video/mp4" >
            </video>
        </div>
    </c:when>
</c:choose>

<!-- 댓글 폼 -->
<form action="../episode/addComment" method="post">
    <input type="hidden" name="episodeNo" value="${episode.episodeNo}">
    <textarea name="content" placeholder="댓글을 입력하세요"></textarea>
    <button type="submit">댓글 추가</button>
</form>

<!-- 댓글 목록 -->
<c:if test="${not empty list}">
    <h3>댓글 목록</h3>
    <ul>
        <c:forEach var="comment" items="${list}">
            <li>
                <div>
                    <strong>${comment.userId}</strong>
                    <span>${comment.commentDate}</span>
                </div>
                <p>${comment.content}</p>

                <!-- 수정 폼 -->
                <form action="../episode/updateComment" method="post">
                    <input type="hidden" name="commentNo" value="${comment.commentNo}">
                    <textarea name="content" placeholder="댓글을 수정하세요">${comment.content}</textarea>
                    <button type="submit">수정</button>
                </form>

                <!-- 삭제 폼 -->
                <form action="deleteComment" method="post">
                    <input type="hidden" name="commentNo" value="${comment.commentNo}">
                    <button type="submit">삭제</button>
                </form>
            </li>
        </c:forEach>
    </ul>
</c:if>
<c:if test="${empty list}">
    아직 댓글 내역이 없습니다.
</c:if>
</body>

</html>
