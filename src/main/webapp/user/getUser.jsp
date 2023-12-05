<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>User 정보</title>
</head>
<body>

<c:if test="${user ne null}">
    <h2>User 정보</h2>
    <img src="<c:out value='${user.userImage}'/>" alt="User Image"><br>
    <strong>닉네임:</strong> <c:out value="${user.nickName}"/><br>
    <strong>아이디:</strong> <c:out value="${user.userId}"/><br>
    <strong>이름:</strong> <c:out value="${user.userName}"/><br>
    <strong>생년월일:</strong> <c:out value="${user.birthday}"/><br>
    <strong>이메일:</strong> <c:out value="${user.email}"/><br>
    <strong>주소:</strong> <c:out value="${user.addr}"/><br>
    <strong>상세주소:</strong> <c:out value="${user.address}"/><br>
    <strong>전화번호:</strong> <c:out value="${user.phone}"/><br>
    <strong>소셜 연동:</strong> <c:out value="${user.socialLink}"/><br>
</c:if>

</body>
</html>
