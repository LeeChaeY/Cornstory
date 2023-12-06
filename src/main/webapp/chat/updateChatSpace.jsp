<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>updateChatSpace</title>
    </head>
    <body>

        <h2>채팅방 수정</h2>
        <form action="/chat/updateChatSpace" method="post" enctype="multipart/form-data">
            <input type="hidden" name="userId" value="${chatSpace.userId}">
            <input type="hidden" name="chatSpaceNo" value="${chatSpace.chatSpaceNo}">

            <label>회원 아이디:</label>
            <div>${chatSpace.userId}</div><br>

            <label>제목: </label>
            <input type="text" name="cSpaceName" value="${chatSpace.cSpaceName}" required><br><br>

            <label>장르:</label><br>
            <div>${chatSpace.genre}</div><br>

            <label>썸네일: </label>
            <div><img width="300px" height="300px" src="/file/chat/${chatSpace.cSpaceImage}"></div>
            <input type="file" name="file" value="${chatSpace.cSpaceImage}"><br><br>

            <input type="submit" value="채팅방 수정">
        </form>

    </body>
</html>