<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>지원 추가</title>
</head>
<body>
<c:choose>
    <c:when test="${param.category eq '0'}">
        <input type="text" id="supCategory" name="supCategory" value="0" style="display: none;">
        <h2>공지사항 등록</h2>
    </c:when>
    <c:when test="${param.category eq '1'}">
        <input type="text" id="supCategory" name="supCategory" value="1" style="display: none;">
        <h2>Q&A 등록</h2>
    </c:when>
    <c:when test="${param.category eq '2'}">
        <input type="text" id="supCategory" name="supCategory" value="2" style="display: none;">
        <h2>신고 등록</h2>
    </c:when>
</c:choose>


<form action="${pageContext.request.contextPath}/support/addSupport" method="post" enctype="multipart/form-data">
    <!-- 사용자 ID는 세션에서 가져오기 때문에 입력란이 필요하지 않습니다. -->
    <input type="hidden" name="userId" value="${sessionScope.user.userId}">
    등록자 닉네임: ${sessionScope.user.nickName}
    <label for="supCategory"></label><br>
    <c:choose>

        <c:when test="${param.category eq '0' and sessionScope.user.role eq 1}">
            <input type="text" id="supCategory" name="supCategory" value="0" style="display: none;">
            <p>공지사항 등록</p>
            <label for="supContent">내용 등록:</label><br>
            <textarea id="supContent" name="supContent" rows="4" required></textarea><br>

        </c:when>

        <c:when test="${param.category eq '1' and sessionScope.user.role eq 0}">
            <input type="text" id="supCategory" name="supCategory" value="1" style="display: none;">
            <p>Q&A[질문] 등록 </p>
            <label for="supContent">질문 등록:</label><br>
            <textarea id="supContent" name="supContent" rows="4" required></textarea><br>
        </c:when>

        <c:when test="${param.category eq '1' and sessionScope.user.role eq 1}">
            <input type="text" id="supCategory" name="supCategory" value="1" style="display: none;">
            <label for="supPluscon">질문 내용:</label><br>
            ${param.supContent}<br>
            <p>Q&A[답변] 등록 </p>
            <label for="supPluscon">답변 내용:</label><br>
            <textarea id="supPluscon" name="supPluscon" rows="4"></textarea><br>
        </c:when>

        <c:when test="${param.category eq '2' and sessionScope.user.role eq 0}">
            <input type="text" id="supCategory" name="supCategory" value="2" style="display: none;">
            <p>신고 등록 (회원 전용)</p>

            <label for="supContent">신고할 회원닉네임</label><br>
            <textarea id="supContent" name="supContent" rows="1" required></textarea><br>

            <label for="supContent">신고 내용:</label><br>
            <textarea id="supContent" name="supContent" rows="4" required></textarea><br>
            <label for="supPluscon">신고URL:</label><br>
            <textarea id="supPluscon" name="supPluscon" rows="1"></textarea><br>
            <label for="supImage">이미지 업로드:</label><br>
            <input type="file" id="supImage" name="supImage"><br><br>
        </c:when>

    </c:choose>

    <!-- 서버로 전송하는 버튼 -->
    <button type="submit">등록하기</button>
</form>
</body>
</html>
