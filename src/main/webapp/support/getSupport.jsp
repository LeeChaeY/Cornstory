<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>지원 상세 정보</title>
</head>
<body>
<h2>지원 상세 정보</h2>

<c:if test="${empty support}">
    <p>해당 지원 정보를 찾을 수 없습니다.</p>
</c:if>

<c:if test="${not empty support}">
    <p>지원 번호: ${support.supNo}</p>
    <p>등록자 닉네임: ${support.user.nickName}</p>
    <p>내용: ${support.supContent}</p>
    <p>카테고리: ${support.supCategory}</p>
    <p>등록일자: ${support.regDate}</p>
    <!-- 다른 지원 정보 필드들을 추가 -->
    <!-- 지원 정보 출력 -->
</c:if>
</body>
</html>
