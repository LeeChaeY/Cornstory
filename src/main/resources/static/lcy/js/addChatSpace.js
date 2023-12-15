$(function() {
    $("span").on("click", function() {
        fncGetChatList('1');
    });

    $("input[type='button'][value='취소']").on("click", function() {
        history.go(-1);
    });

    $("input[type='button'][value='등록']").on("click", function() {
        if ($("input[name='cSpaceName']").val() === "") {
            alert("채팅방 제목을 입력해주세요.");
            return;
        }
        if (!$("input[name='genre']:checked").val()) {
            alert("장르를 선택해주세요.");
            return;
        }
        $("form[name='addForm']").attr("method", "post").attr("action", "/chat/addChatSpace").submit();
    });

    $("input[type='button'][value='수정']").on("click", function() {
        if ($("input[name='cSpaceName']").val() === "") {
            alert("채팅방 제목을 입력해주세요.");
            return;
        }
        $("form[name='updateForm']").attr("method", "post").attr("action", "/chat/updateChatSpace").submit();
    });
});


function fncGetChatList(currentPage) {
    let spanText = event.target.innerText;
    let genreList = ["학원", "액션", "SF", "판타지", "개그", "로맨스", "스포츠",
        "일상", "추리", "스릴러", "무협", "기타"];

    $("input[name='currentPage']").val(currentPage);

    if (genreList.indexOf(spanText) !== -1) {
        $("input[name='genre']").val(spanText);
        $("form[name='form']").attr("method", "post").attr("action", "/chat/listChatSpace").submit();
    }
    else if (spanText === "전체" || spanText === "채팅방 목록") {
        // $("input[name='userStatus']").val(0);
        $("input[name='genre']").val("");
        $("input[name='searchKeyword']").val("");
        $("form[name='form']").attr("method", "post").attr("action", "/chat/listChatSpace").submit();
    } else $("input[name='genre']").val("");


    if (spanText === "개설한 채팅방") {
        $("input[name='userStatus']").val(1);   //0: 전체, 1: 개설, 2: 입장
        $("form[name='form']").attr("method", "post").attr("action", "/chat/listChatSpace").submit();
    } else if (spanText === "입장한 채팅방") {
        $("input[name='userStatus']").val(2);   //0: 전체, 1: 개설, 2: 입장
        $("form[name='form']").attr("method", "post").attr("action", "/chat/listChatSpace").submit();
    } else if (spanText === '채팅방 추가하기') {
        $(self.location).attr("href", "/chat/addChatSpace");
    }
}

