<!-- addUser.jsp -->

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원가입</title>
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

<h2>회원가입</h2>

<form action="/user/addUser" method="post" enctype="multipart/form-data">
    <label for="userId">ID:</label>
    <input type="text" id="userId" name="userId" required><br>

    <label for="userName">성명:</label>
    <input type="text" id="userName" name="userName" required><br>

    <label for="nickName">닉네임:</label>
    <input type="text" id="nickName" name="nickName" required><br>

    <label for="password">PW :</label>
    <input type="password" id="password" name="password" required><br>

    <label for="birthday">생년월일:</label>
    <input type="date" id="birthday" name="birthday" required><br>

    <label for="addr">주소:</label>
    <input type="text" id="addr" name="addr" required>
    <button type="button" onclick="findAddress()">주소 찾기</button><br>

    <label for="detailAddr">상세주소:</label>
    <input type="text" id="detailAddr" name="detailAddr"><br>

    <label for="phone">연락처:</label>
    <input type="text" id="phone" name="phone" required><br>

    <label for="email">Email:</label>
    <input type="email" id="email" name="email" required><br>

    <label for="userImage">회원 사진:</label>
    <input type="file" id="userImage" name="userImage"><br>

    <button type="submit">Register</button>
</form>

</body>
</html>
