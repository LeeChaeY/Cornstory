$(document).ready(function () {
    // "탈퇴하기" 링크 클릭 시 실행
    $("#withdrawLink").click(function () {
        var userId = "${sessionScope.user.userId}"; // 세션에서 현재 사용자의 아이디 가져오기

        // Ajax를 통한 서버 요청
        $.ajax({
            type: "GET",
            url: "json/deleteUser",
            data: { userId: userId },
            success: function (response) {
                console.log(response); // 응답을 콘솔에 출력
                if (response === "valid") {
                    alert("회원 탈퇴가 완료되었습니다.");
                    window.location.href = "../index.jsp";
                } else {
                    alert("회원 탈퇴에 실패했습니다.");
                }
            },

            error: function (xhr, status, error) {
                console.log(xhr.status); // HTTP 응답 코드를 콘솔에 출력
                alert("기존 등록 또는 작성으로 인한 회원탈퇴 실패");
            }

        });
    });
});