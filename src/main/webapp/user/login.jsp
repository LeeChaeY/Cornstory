<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <title>login | main_복제본</title>
    <link rel="stylesheet" href="../user/css/setting.css">
    <link rel="stylesheet" href="../user/css/plugin.css">
    <link rel="stylesheet" href="../user/css/template.css">
    <link rel="stylesheet" href="../user/css/common.css">
    <link rel="stylesheet" href="../user/css/style.css">
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
</head>

<body>
<%@ include file="../layout/top.jsp" %>
<!-- [S]thpart-HmlqLtFlNZ -->
<div class="thpart-HmlqLtFlNZ" data-bid="HmlqLtFlNZ" id="">
    <div class="contents-container">
        <img class="contents-backimg" src="https://images.unsplash.com/photo-1532276269954-64188308dcb3?crop=entropy&amp;cs=tinysrgb&amp;fit=max&amp;fm=jpg&amp;ixid=M3w0OTE2MDd8MHwxfHNlYXJjaHw0fHwlRUIlQTElOUMlRUElQjclQjglRUMlOUQlQjh8a298MHx8fGJsYWNrfDE3MDM1NjQ1NDB8MA&amp;ixlib=rb-4.0.3&amp;q=80&amp;w=1080" alt="">
        <div class="contents-body container-md">
            <h2 class="contents-title" contenteditable="true"> UserPage</h2>
            <h7 class="contents-sub" th-hoverbox="true">회원</h7>
        </div>
    </div>
</div>
<!-- [E]thpart-HmlqLtFlNZ -->
<!-- [S]hooms-N52 -->
<div class="hooms-N52" data-bid="VaLqgGb25J">
    <div class="contents-inner">
        <div class="contents-container">

                <div class="textset textset-h2">
                    <h2 class="textset-tit">LogIn</h2>
                    <p class="textset-desc">CornStory 에 방문해 주셔서 감사합니다.</p>
                </div>
            <form id="loginForm" action="/user/login" method="post" onsubmit="return submitLoginForm();">
                <div class="contents-form">
                    <div class="inputset inputset-lg inputset-label">
                        <label>
                            <h6 class="inputset-tit">ID</h6>
                            <input type="text" class="inputset-input form-control" placeholder="아이디를 입력해주세요." aria-label="userId" id="userId" name="userId" required>
                        </label>
                    </div>
                    <div class="inputset inputset-lg inputset-label">
                        <label>
                            <h6 class="inputset-tit">Password</h6>
                            <input type="password" class="inputset-input form-control" placeholder="비밀번호를 입력해주세요." aria-label="Password" id="password" name="password" required>
                        </label>
                    </div>
                    <button type="submit" class="btnset btnset-lg">로그인</button>
                    <div id="errorMessage" style="color: #ff0000;"></div>
                </div>
            </form>
                <ul class="contents-list">
                    <li class="contents-item">
                        <a href="/user/addUser" class="contents-link">회원가입</a>
                    </li>
                </ul>
                <div class="contents-start">
              <span class="contents-or">
                <span class="contents-ortext">또는</span>
              </span>
                    <a class="btnset btnset-lg contents-start-kakao"  href="https://kauth.kakao.com/oauth/authorize?client_id=b0bd84c71b068376094579f78dcd6af0&redirect_uri=http://cornstory.com/user/slogin&response_type=code">카카오로 시작하기</a>
                </div>

        </div>
    </div>
</div>

<%@ include file="../layout/bottom.jsp" %>
<script src="../user/js/setting.js"></script>
<script src="../user/js/plugin.js"></script>
<script src="../user/js/template.js"></script>
<script src="../user/js/common.js"></script>
<script src="../user/js/script.js"></script>
<script src="../user/js/login.js"></script>
</body>

</html>
