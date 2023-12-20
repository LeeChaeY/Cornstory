<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="imagetoolbar" content="no">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="format-detection" content="telephone=no">
    <meta name="title" content="웹사이트">
    <meta name="description" content="웹사이트입니다.">
    <meta name="keywords" content="키워드,키워드,키워드">
    <meta property="og:title" content="웹사이트">
    <meta property="og:description" content="웹사이트입니다">
    <meta property="og:image" content="https://웹사이트/images/opengraph.png">
    <meta property="og:url" content="https://웹사이트">
    <title>회원 가입</title>
    <link rel="stylesheet" href="../ssh/css/setting.css">
    <link rel="stylesheet" href="../ssh/css/plugin.css">
    <link rel="stylesheet" href="../ssh/css/template.css">
    <link rel="stylesheet" href="../ssh/css/common.css">
    <link rel="stylesheet" href="../ssh/css/style.css">

    <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <script>
        // 다음 주소
        function findAddress() {
            new daum.Postcode({
                oncomplete: function(data) {
                    document.getElementById('addr').value = data.address;
                }
            }).open();
        }
    </script>
    <script>
        //아이디 중복 체크 및 체크 길이
        $(document).ready(function () {
            //아이디 체크
            $("#userId").on("input", function () {
                var userId = $(this).val();
                checkUserId(userId);
                updateUserIdLength(userId.length); // 길이 업데이트 함수 호출
            });
            // 비밀번호 조건 충족 및 길이
            $("#password").on("input", function () {
                var password = $(this).val();
                checkPasswordPattern(password);
            });
            // 닉네임 체크
            $("#nickName").on("input", function () {
                var nickName = $(this).val();
                checkNickName(nickName);
                updateNickNameLength(nickName.length);
            });
            //전화번호 체크
            $("#phone").on("input", function () {
                var phoneNumber = $(this).val();
                checkPhoneNumberFormat(phoneNumber);
            });
            $("form").submit(function (event) {
                // 아이디, 닉네임, 패스워드 유효성 검사
                var isNickNameValid = checkNickName($("#nickName").val());
                var isPasswordValid = checkPassword($("#password").val());
                var isPhoneNumberValid = checkPhoneNumber($("#phone").val());
                var isEmailValid = checkEmail($("#email").val());
                if($("#userIdMessage").text() === "이미 있는 아이디입니다."){
                    event.preventDefault(); // 유효하지 않으면 제출 방지
                    alert("입력한 아이디가 유효하지 않습니다. 다시 확인해주세요.");
                }
                if($("#nickNameMessage").text() === "이미 있는 닉네임입니다."){
                    event.preventDefault(); // 유효하지 않으면 제출 방지
                    alert("입력한 닉네임이 유효하지 않습니다. 다시 확인해주세요.");
                }
                if($("#passwordMessage").text() === "조건에 맞게 입력해주세요.") {
                    event.preventDefault(); // 유효하지 않으면 제출 방지
                    alert("입력한 비밀번호가 유효하지 않습니다. 다시 확인해주세요.");
                }
                if($("#phoneMessage").text() === "올바른 형식의 전화번호를 입력하세요. (ex: 010-1234-5678)"){
                    event.preventDefault(); // 유효하지 않으면 제출 방지
                    alert("입력한 휴대폰 번호가 유효하지 않습니다. 다시 확인해주세요.");
                }
                qwe
            });
            function checkPassword(password) {
                return password.length >= 8;
            }
            function checkPhoneNumber(phoneNumber) {
                var phonePattern = /^010-\d{4}-\d{4}$/; // '010-XXXX-XXXX' 형식
                return phonePattern.test(phoneNumber);
            }
            function checkEmail(email) {
                var emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/; // 간단한 이메일 형식 체크
                return emailPattern.test(email);
            }
        });
        //길이제한
        function updateCharCount(inputId, countId) {
            var input = document.getElementById(inputId);
            var count = document.getElementById(countId);
            if (input.value.length > input.maxLength) {
                input.value = input.value.substring(0, input.maxLength);
            }
            count.textContent = input.value.length + '/' + input.maxLength;
        }
        //아이디 중복체크
        function checkUserId(userId) {
            var userIdMessage = $("#userIdMessage");

            if (!userId) {
                userIdMessage.text("");
                return Promise.resolve(false);
            }

            var pattern = /^[a-zA-Z0-9]{4,8}$/;

            if (!pattern.test(userId)) {
                userIdMessage.text("아이디는 4자 이상 8자 이하의 영문과 숫자만 입력 가능합니다.").css("color", "red");
                return Promise.resolve(false);
            }

            return new Promise(function(resolve, reject) {
                $.ajax({
                    type: "GET",
                    url: "/user/json/checkUserId",
                    data: { "userId": userId },
                    success: function (response) {
                        if (response === "true") {
                            userIdMessage.text("사용 가능한 아이디입니다.").css("color", "green");
                            resolve(true);
                        } else {
                            userIdMessage.text("이미 있는 아이디입니다.").css("color", "red");
                            resolve(false);
                        }
                    },
                    error: function (error) {
                        console.error("아이디 확인 중 오류 발생:", error);
                        reject(error);
                    }
                });
            });
        }

        //아이디 길이체크
        function updateUserIdLength(length) {
            // 아이디 길이를 표시하는 영역에 길이를 업데이트합니다.
            $("#userIdLength").text(length + "/8");
        }

        //패스워드 길이 및 패턴 체크
        function checkPasswordPattern(password) {
            var passwordMessage = $("#passwordMessage");
            var passwordLength = $("#passwordLength");
            if (!password) {
                passwordMessage.text("");
                passwordLength.text("0/16");
            } else {
                var pattern = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[!@#$%^&*()])[A-Za-z\d!@#$%^&*()]{8,16}$/;
                if (!pattern.test(password)) {
                    passwordMessage.text("조건에 맞게 입력해주세요.").css("color", "red");
                    return false;
                } else {
                    passwordMessage.text("사용가능한 비밀번호입니다.").css("color", "green");
                }
                // 비밀번호 길이 업데이트
                passwordLength.text(password.length + "/16");
            }
        }

        function checkNickName(nickName) {
            var nickNameMessage = $("#nickNameMessage");
            if (!nickName) {
                nickNameMessage.text("");
            } else {
                // 정규표현식을 사용하여 유효성을 검사합니다.
                var pattern = /^[a-zA-Z0-9가-힣]{2,8}$/;
                if (!pattern.test(nickName)) {
                    nickNameMessage.text("한글, 영문, 숫자만 입력 가능하며 2~8글자여야 합니다.").css("color", "red");
                    return false;
                } else {
                    // Ajax를 이용하여 서버로 닉네임 중복 검사 요청을 보냅니다.
                    $.ajax({
                        type: "GET",
                        url: "/user/json/checkNickName",
                        data: { "nickName": nickName },
                        success: function (response) {
                            if (response === "true") {
                                nickNameMessage.text("사용 가능한 닉네임입니다.").css("color", "green");
                            } else {
                                nickNameMessage.text("이미 있는 닉네임입니다.").css("color", "red");
                                return false;
                            }
                        },
                        error: function (error) {
                            console.error("닉네임 확인 중 오류 발생:", error);
                        }
                    });
                }
            }
        }
        //닉네임 길이체크
        function updateNickNameLength(length) {
            $("#nickNameLength").text(length + "/8");
        }
        //전화번호 패턴 체크
        function checkPhoneNumberFormat(phoneNumber) {
            var phoneMessage = $("#phoneMessage");
            var phonePattern = /^\d{3}-\d{4}-\d{4}$/;
            if (!phonePattern.test(phoneNumber)) {
                phoneMessage.text("올바른 형식의 전화번호를 입력하세요. (ex: 010-1234-5678)").css("color", "red");
            } else {
                phoneMessage.text("");
            }
        }
    </script>
    <style>
        .check-text {
            padding: 140px;
            font-size: 12px;
        }
        .check-stext {
            padding: 10px;
            font-size: 12px;
        }
        .check-image {
            font-size: 12px;
        }
    </style>
</head>
<body>
<%@ include file="../layout/top.jsp" %>
<form action="../user/addUser" method="post" enctype="multipart/form-data" >'
    <main class="th-layout-main ">
        <!-- [S]opilsol-N29 -->
        <div class="opilsol-N29" data-bid="XmlPWctWqn" >
            <div class="modal">
            </div>
        </div>
        <!-- [E]opilsol-N29 -->
    </main>
    <div class="opilsol-N31" data-bid="vELq1mwLiX">
        <div class="content-container">
            <div class="textset content-top">
                <div class="container-md">
                    <h2 class="textset-tit">회원가입</h2>
                    <ul class="step-list">
                        <li>약관동의</li>
                        <li class="active">정보입력</li>
                        <li>가입완료</li>
                    </ul>
                </div>
            </div>
            <div class="contents-form">
                <div class="container-md">
                    <div class="contents-form-top">
                        <h3 class="inputset-tit" >정보입력</h3>
                    </div>


                    <div class="check-stext" id="socialMessage"></div>


                    <div class="inputset inputset-lg inputset-group">
                        <label class="inputset-label" for="userId">아이디 </label>
                        <input type="text" class="inputset-input form-control"  id="userId" name="userId"
                               pattern="[a-zA-Z0-9]+" maxlength="8" title="영문 또는 숫자만 입력 가능"
                               oninput="updateCharCount('userId', 'userIdLength')" minlength="4" value="${kakaoUserInfo.id}" required>
                        <span class="checkset-text" id="userIdLength">0/8</span>
                    </div>
                    <span class="check-text">한글 영문 숫자를 등록 가능하여 최소 4자 최대 8자 등록 가능합니다.</span>
                    <span class="check-text" id="userIdMessage"></span>

                    <div class="inputset inputset-lg inputset-group">
                        <label class="inputset-label" for="password">비밀번호</label>
                        <input type="password" class="inputset-input form-control" id="password" name="password"
                               pattern="^(?=.*[A-Za-z])(?=.*\d)(?=.*[!@#$%^&*()])[A-Za-z\d!@#$%^&*()]{8,16}$"
                               title="# 영문, 숫자, 특수문자를 혼합하여 8자 이상 16자 이하로 입력하세요" maxlength="16"
                               oninput="updateCharCount('password', 'passwordLength')" minlength="8" required >
                        <span id="passwordLength">0/16</span>
                    </div>
                    <span class="check-text"> 영문 숫자 특수문자를 조합하여 최소 8자 최대 16자 등록 가능합니다.</span>
                    <span class="check-text" id="passwordMessage"></span>

                    <div class="inputset inputset-lg inputset-group" for="nickName">
                        <label class="inputset-label">닉네임</label>
                        <input type="text" class="inputset-input form-control" id="nickName" name="nickName"
                               required maxlength="8" oninput="updateCharCount('nickName', 'nickNameLength')" minlength="2"/>
                        <span id="nickNameLength">0/8</span>
                    </div>
                    <span class="check-text">영문과 숫자 한글을 조합하여 최소 2자 최대 8자 등록 가능합니다.</span>
                    <span class="check-text" id="nickNameMessage"></span>

                    <div class="inputset inputset-lg inputset-group" for="userName">
                        <label class="inputset-label">이름</label>
                        <input type="text" class="inputset-input form-control" id="userName" name="userName" value="${kakaoUserInfo.nickname}" required>
                    </div>

                    <div class="inputset inputset-lg inputset-group" for="birthday">
                        <label class="inputset-label">생년월일</label>
                        <input type="date" class="inputset-input form-control" id="birthday" name="birthday" max="9999-12-31" required>
                    </div>

                    <div class="inputset inputset-lg inputset-group" for="addr">
                        <label class="inputset-label">주소</label>
                        <input type="text" class="inputset-input form-control" id="addr" name="addr" required>
                        <button class="check-image" type="button" onclick="findAddress()">주소 찾기</button>
                    </div>

                    <div class="inputset inputset-lg inputset-group" for="address">
                        <label class="inputset-label">상세주소</label>
                        <input type="text" class="inputset-input form-control" id="address" name="address" required>
                    </div>
                    <div class="inputset inputset-lg inputset-group" for="userImage">
                        <label class="inputset-label">회원 이미지</label>
                        <input class="check-image" type="file" id="userfile" name="userfile" accept=".jpg"/>
                    </div>
                    <span class="check-text"> 파일 용량 1MB 이하 JPG만 업로드 가능합니다.</span>

                    <div class="inputset inputset-lg inputset-group" for="phone">
                        <label class="inputset-label">휴대폰번호</label>
                        <input type="text" class="inputset-input form-control" id="phone" name="phone" required>
                    </div>
                    <span class="check-text" id="phoneMessage"></span>

                    <div class="inputset inputset-lg inputset-group" for="email">
                        <label class="inputset-label">이메일</label>
                        <input type="text" class="inputset-input form-control"  id="email" name="email" value="${kakaoUserInfo.email}"required>
                    </div>
                </div>
                <div class="bottom-btn">
                    <button class="btnset btnset-lg btnset-dark btnset-rect">취소</button>
                    <button class="btnset btnset-lg btnset-rect" type="submit">회원가입</button>
                </div>
            </div>
        </div>
    </div>
    <!-- [E]opilsol-N31 -->
    <!-- [S]opilsol-N29 -->
    <div class="opilsol-N29" data-bid="InLpwD1WuH" style="margin-top: 34px; margin-right: 5px;" id="">
        <div class="modal">
        </div>
    </div>
    <%@ include file="../layout/bottom.jsp" %>
    <script>
        $(document).ready(function () {
            // 소셜 로그인 메시지를 동적으로 변경
            var socialMessage = $("#socialMessage");
            var socialValue = "${social}";
            if (socialValue === "1") {
                socialMessage.text("카카오 로그인을 통한 회원가입 페이지입니다.").css("color", "blue");
            }
        });
    </script>
    <script src="../ssh/js/setting.js"></script>
    <script src="../ssh/js/plugin.js"></script>
    <script src="../ssh/js/template.js"></script>
    <script src="../ssh/js/common.js"></script>
    <script src="../ssh/js/script.js"></script>
</form>
</body>
</html>
 