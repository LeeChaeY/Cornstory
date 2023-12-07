<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원가입</title>

    <script>
        function validateForm() {
            // 여러 필드에 대한 유효성 검사 호출
            var isNameValid = validateName();
            var isBirthdayValid = validateBirthday();
            var isPhoneValid = validatePhone();
            var isAddressValid = validateAddress();
            var isEmailValid = validateEmail();
            var isUserIdValid = validateUserId();
            var isPasswordValid = validatePassword();
            var isNickNameValid = validateNickName();

            // 모든 필드가 유효하면 폼 제출
            if (isNameValid && isBirthdayValid && isPhoneValid && isAddressValid && isEmailValid && isUserIdValid && isPasswordValid && isNickNameValid) {
                return true;
            } else {
                // 하나라도 유효하지 않은 필드가 있으면 제출 취소
                // 가입 실패 알림 추가
                alert("회원가입에 실패했습니다. 입력 정보를 다시 확인해주세요.");
                return false;
            }
        }

        // 생년월일 유효성 검사 예시
        function validateBirthday() {
            var birthday = $("#birthday").val();
            // 생년월일 유효성 검사 로직을 추가 (필요에 따라 수정)
            if (birthday) {
                return true;
            } else {
                alert("생년월일을 입력하세요.");
                return false;
            }
        }

        // 전화번호 유효성 검사 예시
        function validatePhone() {
            var phone = $("#phone").val();
            // 전화번호 유효성 검사 로직을 추가 (필요에 따라 수정)
            if (phone) {
                return true;
            } else {
                alert("전화번호를 입력하세요.");
                return false;
            }
        }

        // 주소 유효성 검사 예시
        function validateAddress() {
            var address = $("#addr").val();
            // 주소 유효성 검사 로직을 추가 (필요에 따라 수정)
            if (address) {
                return true;
            } else {
                alert("주소를 입력하세요.");
                return false;
            }
        }

        // 이메일 유효성 검사 예시
        function validateEmail() {
            var email = $("#email").val();
            // 이메일 유효성 검사 로직을 추가 (필요에 따라 수정)
            if (email) {
                return true;
            } else {
                alert("이메일을 입력하세요.");
                return false;
            }
        }

        // 생략된 코드 ...
    </script>
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

        //아이디 중복 체크 및 체크 길이
        $(document).ready(function () {
            $("#userId").on("input", function () {
                var userId = $(this).val();
                checkUserId(userId);
                updateUserIdLength(userId.length); // 길이 업데이트 함수 호출
            });
        });

        function checkUserId(userId) {
            // 입력값이 없는 경우 메시지를 초기화합니다.
            var userIdMessage = $("#userIdMessage");
            if (!userId) {
                userIdMessage.text("");
            } else {
                // Ajax를 이용하여 서버로 아이디 유효성 검사 요청을 보냅니다.
                $.ajax({
                    type: "GET",
                    url: "/user/json/checkUserId",
                    data: { "userId": userId },
                    success: function (response) {
                        // 결과에 따라 스타일과 메시지를 변경합니다.
                        if (response === "true") {
                            userIdMessage.text("사용 가능한 아이디입니다.").css("color", "green");
                        } else {
                            userIdMessage.text("이미 있는 아이디입니다.").css("color", "red");
                        }
                    },
                    error: function (error) {
                        console.error("아이디 확인 중 오류 발생:", error);
                    }
                });
            }

        }
        function updateUserIdLength(length) {
            // 아이디 길이를 표시하는 영역에 길이를 업데이트합니다.
            $("#userIdLength").text(length + "/8");
        }

        // 비밀번호 조건 충족 및 길이
        $(document).ready(function () {
            $("#password").on("input", function () {
                var password = $(this).val();
                checkPasswordPattern(password);
            });
        });

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
                } else {
                    passwordMessage.text("사용가능한 비밀번호입니다.").css("color", "green");
                }

                // 비밀번호 길이 업데이트
                passwordLength.text(password.length + "/16");
            }
        }

        //닉네임 중복체크 및 길이
        $(document).ready(function () {
            // ... (기존 코드 생략)

            $("#nickName").on("input", function () {
                var nickName = $(this).val();
                checkNickName(nickName);
                updateNickNameLength(nickName.length);
            });
        });

        function checkNickName(nickName) {
            var nickNameMessage = $("#nickNameMessage");
            if (!nickName) {
                nickNameMessage.text("");
            } else {
                // 정규표현식을 사용하여 유효성을 검사합니다.
                var pattern = /^[a-zA-Z0-9가-힣]{2,8}$/;
                if (!pattern.test(nickName)) {
                    nickNameMessage.text("한글, 영문, 숫자만 입력 가능하며 2~8글자여야 합니다.").css("color", "red");
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
                            }
                        },
                        error: function (error) {
                            console.error("닉네임 확인 중 오류 발생:", error);
                        }
                    });
                }
            }
        }

        function updateNickNameLength(length) {
            $("#nickNameLength").text(length + "/8");
        }


        //전화번호 조건 충족 확인
        $(document).ready(function () {
            $("#phone").on("input", function () {
                var phoneNumber = $(this).val();
                checkPhoneNumberFormat(phoneNumber);
            });
        });

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
</head>
<body>

<h2>회원가입</h2>

<form action="/user/addUser" method="post" enctype="multipart/form-data" onsubmit="return validateForm();">

    <label for="userName">성명:</label><br>
    <input type="text" id="userName" name="userName" required><br><br>

    <label for="birthday">생년월일:</label><br>
    <input type="date" id="birthday" name="birthday" required><br><br>

    <label for="phone">전화번호:</label><br>
    <input type="text" id="phone" name="phone" required><br>
    <span id="phoneMessage"></span><br><br>

    <label for="addr">주소:</label><br>
    <input type="text" id="addr" name="addr" required>
    <button type="button" onclick="findAddress()">주소 찾기</button><br><br>

    <label for="address">상세주소:</label><br>
    <input type="text" id="address" name="address" required><br><br>

    <label for="email">Email:</label><br>
    <input type="email" id="email" name="email" required><br><br>

    <label for="userId">아이디:</label><br>
    <input type="text" id="userId" name="userId" maxlength="8" pattern="[a-zA-Z0-9]+" title="영문 또는 숫자만 입력 가능" required>
    <span id="userIdMessage"></span><br>
    <span id="userIdLength">0/8</span><br>
    최소 4글자 최대 8글자 작성가능합니다.<br>
    # 영문과 숫자만 작성 가능합니다.<br><br>

    <label for="password">패스워드 :</label><br>
    <input type="password" id="password" name="password"
           pattern="^(?=.*[A-Za-z])(?=.*\d)(?=.*[!@#$%^&*()])[A-Za-z\d!@#$%^&*()]{8,16}$"
           title="# 영문, 숫자, 특수문자를 혼합하여 8자 이상 16자 이하로 입력하세요" required>
    <span id="passwordMessage"></span><br>
    <span id="passwordLength">0/16</span><br>
    최소 8글자 최대 16글자 작성가능합니다.<br>
    영문, 숫자, 특수문자를 혼합하여 작성 해야 합니다.<br><br>

    <label for="nickName">닉네임:</label><br>
    <input type="text" id="nickName" name="nickName" required>
    <span id="nickNameMessage"></span><br>
    <span id="nickNameLength">0/8</span><br>
    최소 2글자 최대 8글자 작성가능합니다.<br>
    # 영문과 숫자 한글을 조합하여 작성 가능합니다.<br><br>


    <label for="userImage">회원 사진:</label><br>
    <input type="file" id="userImage" name="userImage"><br>
    파일 용량 1MB 이하<br>
    JPG만 업로드 가능<br>
    회원 프로필에 들어갈 사진 입니다.<br>

    <button type="submit">가입하기</button>
</form>

</body>
</html>
