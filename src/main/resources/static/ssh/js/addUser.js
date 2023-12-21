function findAddress() {
    new daum.Postcode({
        oncomplete: function(data) {
            document.getElementById('addr').value = data.address;
        }
    }).open();
}

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

$(document).ready(function () {
    var socialValue = "${social}";
    console.log("socialValue ::::::"+socialValue);
    // 소셜 정보가 있을 경우 1, 없을 경우 0으로 설정
    if (socialValue != null) {
        $("#socialInput").val("1");
    } else {
        $("#socialInput").val("0");
    }

    // 이하 소셜 메시지 변경 부분은 필요에 따라 유지하거나 수정하십시오.
    var socialMessage = $("#socialMessage");
    if (socialValue === "1") {
        socialMessage.text("카카오 로그인을 통한 회원가입 페이지입니다.").css("color", "blue");
    }
});
    $('.drop-area').on('drag dragstart dragend dragover dragenter dragleave drop', function (event) {
    event.preventDefault();
    event.stopPropagation();
});
    $(".drop-area").on("dragover", function (event) {
    $(this).addClass('drag-over');
});
    $(".drop-area").on("dragleave dragend drop", function (event) {
    $(this).removeClass('drag-over');
});
    $(".drop-area").on("drop", function (event) {
    event.preventDefault();
    event.stopPropagation();

    if (event.originalEvent.dataTransfer.files.length === 1) {
    const files = event.originalEvent.dataTransfer.files;

    // Display the uploaded file
    displayFile(files[0]);
    $("input[name='userfile']")[0].files = files;
} else {
    alert('Please drop only one file at a time.');
}

    // Remove highlight from drop area
    $(this).removeClass('drag-over');
});

    $("input[type='file']").on("change", function (event) {
    const file = this.files[0];
    displayFile(file);
});
    function displayFile(file) {
    const listItem = $("<li>");
    let reader = new FileReader();
    reader.onload = function (e) {
    listItem.html('<img src="' + e.target.result + '" alt="your image"/>');
};
    reader.readAsDataURL(file);
    $(".file-list").empty().append(listItem);
}

