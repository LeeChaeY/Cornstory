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
        <form action="/chat/addChatSpace" method="post" enctype="multipart/form-data">
            <input type="hidden" name="userId" value="test1">

            <label>제목:</label>
            <input type="text" name="cSpaceName" required><br>

            <label>장르:</label><br>
            <select name="genre">
                <option value="학원">학원</option>
                <option value="액션">액션</option>
                <option value="SF">SF</option>
                <option value="판타지">판타지</option>
                <option value="개그">개그</option>
                <option value="로맨스">로맨스</option>
                <option value="스포츠">스포츠</option>
                <option value="일상">일상</option>
                <option value="추리">추리</option>
                <option value="스릴러">스릴러</option>
                <option value="무협">무협</option>
                <option value="기타">기타</option>
            </select><br>

            <label>썸네일:</label>
            <input type="file" name="file" id="cSpaceImage"><br>

            <input type="submit" value="채팅방 만들기">
        </form>

    </body>
</html>