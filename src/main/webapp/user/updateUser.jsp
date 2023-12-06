<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원 정보 수정</title>
    <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script>
        function findAddress() {
            new daum.Postcode({
                oncomplete: function(data) {
                    document.getElementById('addr').value = data.address;
                }
            }).open();
        }
    </script>
</head>
<body>

<h2>${user.nickName} </h2>
<h4>${user.userName} 회원정보 수정</h4>

<form action="/user/updateUser?${user.userId}" method="post">
    <label for="password">비밀번호:</label>
    <input type="password" id="password" name="password" value="${user.password}" required><br>

    <label for="nickName">닉네임:</label>
    <input type="text" id="nickName" name="nickName" value="${user.nickName}" required><br>

    <label for="email">이메일:</label>
    <input type="email" id="email" name="email" value="${user.email}" required><br>

    <label for="addr">주소:</label>
    <input type="text" id="addr" name="addr" value="${user.addr}" required>
    <button type="button" onclick="findAddress()">주소 찾기</button><br>

    <label for="address">상세주소:</label>
    <input type="text" id="address" name="address" value="${user.address}" required><br>

    <label for="phone">전화번호:</label>
    <input type="tel" id="phone" name="phone" value="${user.phone}" required><br>

    <label for="userImage">이미지 URL:</label>
    <input type="text" id="userImage" name="userImage" value="${user.userImage}"><br>

    <label for="social">소셜:</label>
    <input type="text" id="social" name="social" value="${user.social}">
    <button type="button" onclick="findAddress()">연동하기</button><br>

    <button type="submit">수정</button>
</form>
</body>
</html>
