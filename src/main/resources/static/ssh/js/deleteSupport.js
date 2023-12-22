
$(document).ready(function () {
    // "삭제하기" 버튼 클릭 시 실행
    $("#withdrawLink").click(function () {
        var supNo = "${support.supNo}"; // 각 글의 고유한 번호를 가져오기

        // Ajax를 통한 서버 요청
        $.ajax({
            type: "GET",
            url: "json/deleteSupport",
            data: { supNo: supNo },
            success: function (response) {
                console.log(response); // 응답을 콘솔에 출력
                if (response === "valid") {
                    alert("삭제가 완료되었습니다.");
                    // 삭제 성공 시, 필요에 따라 추가적인 처리를 할 수 있습니다.
                } else {
                    alert("삭제에 실패했습니다.");
                }꿈과 창작을 펼치는플랫폼
                고객 만족도 향상을 위한 솔루션 제공
            },
            error: function (xhr, status, error) {
                console.log(xhr.status); // HTTP 응답 코드를 콘솔에 출력
                alert(" 삭제 중 오류가 발생했습니다.");
            }
        });
    });
});
