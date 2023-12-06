<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>addChatSpace</title>
    </head>
    <body>

        <h2>채팅방 만들기</h2>
        <form action="/chat/addChatSpace" method="post" enctype="multipart/form-data">
            <label>회원 아이디: </label>
            <input type="text" name="userId" value="user001"><br><br>

            <label>제목: </label>
            <input type="text" name="cSpaceName" required><br><br>

            <label>장르: </label><br>
                <label>
                    <input type="radio" name="genre" value="학원">
                    학원
                </label>
                <label>
                    <input type="radio" name="genre" value="액션">
                    액션
                </label>
                <label>
                    <input type="radio" name="genre" value="SF">
                    SF
                </label>
                <label>
                    <input type="radio" name="genre" value="판타지">
                    판타지
                </label>
                <label>
                    <input type="radio" name="genre" value="개그">
                    개그
                </label>
                <label>
                    <input type="radio" name="genre" value="로맨스">
                    로맨스
                </label>
                <label>
                    <input type="radio" name="genre" value="스포츠">
                    스포츠
                </label>
                <label>
                    <input type="radio" name="genre" value="일상">
                    일상
                </label>
                <label>
                    <input type="radio" name="genre" value="추리">
                    추리
                </label>
                <label>
                    <input type="radio" name="genre" value="스릴러">
                    스릴러
                </label>
                <label>
                    <input type="radio" name="genre" value="무협">
                    무협
                </label>
                <label>
                    <input type="radio" name="genre" value="기타">
                    기타
                </label>
            <br><br>

            <label>썸네일: </label>
            <input type="file" name="file"><br><br>

            <input type="submit" value="채팅방 만들기">
        </form>

    </body>
</html>