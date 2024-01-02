$(document).ready(function () {
    // "삭제하기" 버튼 클릭 시 실행
    $("#updateBan").click(function () {
        var supId = $("#supId").val();
        var supBan = parseInt($("#supBan").val(), 10);
        var currentDate = new Date();
        currentDate.setDate(currentDate.getDate()+supBan);
        var dateString = currentDate.toISOString().split('T')[0];
        console.log(dateString);
        // console.log("supNo="+supNo);
        // Ajax를 통한 서버 요청
        $.ajax({
            type: "GET",
            url: "/support/json/banSupport",
            data: { supId: supId,
                    supBan : dateString
            },
            success: function (response) {
                console.log(response); // 응답을 콘솔에 출력
                if (response === "valid") {
                    alert("조치가 완료되었습니다.");

                } else {
                    alert("조치에 실패했습니다.");
                }
            },
            error: function (xhr, status, error) {
                console.log(xhr.status); // HTTP 응답 코드를 콘솔에 출력
                alert("삭제 중 오류가 발생했습니다.");
            }
        });
    });
});