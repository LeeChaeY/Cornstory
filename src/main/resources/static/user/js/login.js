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
            // 로그인 실패 처리
            if (response === "Login 실패") {
                displayErrorMessageWithCountdown("로그인 실패. 아이디 또는 비밀번호를 확인하세요.", 5);
                return;
            }

            // 로그인 성공 처리
            var banDate = response.banDate ? new Date(response.banDate) : null;
            var today = new Date();
            today.setHours(0, 0, 0, 0);

            if (!banDate || banDate <= today) {
                console.log("로그인 성공");
                document.getElementById('errorMessage').style.display = 'none';
                form.submit(); // AJAX 요청이 완료된 후에 form 제출
            } else {
                console.log("로그인 실패: 사용자가 밴 상태입니다.");
                displayErrorMessageWithCountdown("로그인 실패. 사용자가 밴 상태입니다.", 5);
            }
        },
        error: function (xhr, status, error) {
            console.error("AJAX 오류:", status, error);
            displayErrorMessageWithCountdown("서버 오류", 5);
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