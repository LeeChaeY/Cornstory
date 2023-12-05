<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>enterChatSpace</title>
    </head>
    <body>

        <h2>채팅방</h2>

            <label>채팅방 번호:</label>
            <div>${chatSpace.chatSpaceNo}</div>

            <label>아이디:</label>
            <div>${chatSpace.userId}</div>

            <label>제목:</label>
            <div>${chatSpace.cSpaceName}</div><br>

            <label>장르:</label><br>
            <div>${chatSpace.genre}</div><br>

            <label>썸네일:</label>
            <div><img width="300" height="300" src="/file/chat/${chatSpace.cSpaceImage}"></div>

            <label>채팅방 인원수:</label>
            <div>${chatSpace.cSpaceUserCnt}</div>

            <label>채팅방 개설일:</label>
            <div>${chatSpace.cSpaceDate}</div>

            <label>회원 닉네임:</label>
            <div>${chatSpace.nickname}</div>

            <label>회원 사진:</label>
            <div><img src="/file/user/${chatSpace.userImage}"></div>
    </body>
</html>