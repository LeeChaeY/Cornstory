<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <script>
        function submitLoginForm() {
            var userIdInput = document.getElementById('userId');
            var passwordInput = document.getElementById('password');
            var userId = userIdInput.value.trim();
            var password = passwordInput.value.trim();

            // 입력값이 비어있는 경우
            if (userId === '' || password === '') {
                displayErrorMessage("아이디와 비밀번호를 입력하세요.");
                return false;
            }

            var data = {
                userId: userId,
                password: password
            };

            var form = document.getElementById('loginForm');

            $.ajax({
                type: "POST",
                contentType: "application/x-www-form-urlencoded; charset=UTF-8",
                url: "/user/json/login",
                data: data,
                success: function (response) {
                    console.log(response); // 콘솔에 응답 확인

                    if (response === "success") {
                        document.getElementById('errorMessage').style.display = 'none'; // 실패 메시지 숨기기
                        form.submit(); // AJAX 요청이 완료된 후에 form 제출
                    } else {
                        displayErrorMessageWithCountdown("로그인 실패. 아이디 또는 비밀번호를 확인하세요.", 5); // 3초 후에 숨김
                    }
                },
                error: function (xhr, status, error) {
                    console.error("AJAX 오류:", status, error);
                    displayErrorMessageWithCountdown("서버 오류", 5); // 3초 후에 숨김
                }
            });

            return false; // AJAX 요청이 완료되기 전에 폼 제출 방지
        }

        function displayErrorMessage(message) {
            var errorMessageContainer = document.getElementById('errorMessage');
            errorMessageContainer.innerText = message;
        }

        function displayErrorMessageWithCountdown(message, seconds) {
            var errorMessageContainer = document.getElementById('errorMessage');
            errorMessageContainer.innerText = message + ' ' + seconds + '초 후에 사라집니다.';

            var countdown = seconds;
            var countdownInterval = setInterval(function () {
                countdown--;
                errorMessageContainer.innerText = message + ' ' + countdown + '초 후에 사라집니다.';

                if (countdown <= 0) {
                    clearInterval(countdownInterval);
                    errorMessageContainer.style.display = 'none'; // 타이머 종료 후에 'none'으로 설정
                    // 타이머 종료 후에 다시 초기화
                    setTimeout(function () {
                        errorMessageContainer.style.display = 'block'; // 또는 'inline' 등으로 적절한 값으로 설정
                        errorMessageContainer.innerText = ''; // 초기화
                    }, 500); // 적절한 시간(ms)을 지정
                }
            }, 1000);
        }

    </script>
</head>

<body>
<%@ include file="../layout/top.jsp" %>

<div class="opilsol-N32" data-bid="KvlQ1N0u18" id="">
    <div class="content-container">
        <div class="content-group">
            <div class="container-md">
                <form id="loginForm" action="/user/login" method="post" onsubmit="return submitLoginForm();">
                    <!-- 폼 내용 -->
                    <div class="textset">
                        <h2 class="textset-tit">
                            <span class="inline">로그인</span>
                        </h2>
                    </div>
                    <p class="contents-message">CornStory에 오신 것을 환영합니다. <br>
                        <span class="inline">보다 나은 서비스 제공을 위해 로그인 해주세요.</span>
                    </p>
                    <div class="contents-form">

                        <div class="inputset">
                            <input type="text" class="inputset-input form-control" placeholder="아이디를 입력해주세요." aria-label="userId" id="userId" name="userId" required>
                        </div>
                        <div class="inputset">
                            <input type="password" class="inputset-input form-control" placeholder="비밀번호를 입력해주세요." aria-label="Password" id="password" name="password" required>
                        </div>
                        <a href="/user/addStart.jsp" >회원가입</a>
                        <div class="bottom-btn">
                            <div id="errorMessage" style="color: #ff0000;"></div>
                            <button type="submit" class="btnset btnset-lg btnset-rect">로그인</button><br>
                            <a href="https://kauth.kakao.com/oauth/authorize?client_id=b0bd84c71b068376094579f78dcd6af0&redirect_uri=http://cornstory.com/user/slogin&response_type=code">
                                <img src="../file/user/kakao_login_medium_narrow.png">
                            </a>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<!-- 실패 메시지를 출력할 영역 -->


<%@ include file="../layout/bottom.jsp" %>
<script src="../ssh/js/setting.js"></script>
<script src="../ssh/js/plugin.js"></script>
<script src="../ssh/js/template.js"></script>
<script src="../ssh/js/common.js"></script>
<script src="../ssh/js/script.js"></script>

</body>

</html>
