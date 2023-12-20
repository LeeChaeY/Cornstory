<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Insert title here</title>
</head>
<body>
<h1>Kakao Login Test</h1>
<c:choose>
  <c:when test="${userId == null}">

  </c:when>
  <c:otherwise>
    <form name="logout" action="http://localhost:8080/logout">
      <input type="submit" value="로그아웃">
    </form>
  </c:otherwise>
</c:choose>
</body>
</html>
