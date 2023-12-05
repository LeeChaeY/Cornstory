<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Insert title here</title>
    </head>
    <body>

        <h2>채팅방 만들기</h2>

            <div>${chatSpace.userId}</div>

            <label>제목:</label>
            <div>${chatSpace.cSpaceName}</div><br>

            <label>장르:</label><br>
            <div>${chatSpace.genre}</div><br>

            <label>썸네일:</label>
            <div><img src="/src/main/resources/images/${chatSpace.cSpaceImage}"></div>

    </body>
</html>