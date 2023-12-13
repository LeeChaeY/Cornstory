$(function() {
    $("span").on("click", function() {
        fncGetChatList('1');
    });

    $("input[type='button'][value='취소']").on("click", function() {
        history.go(1);
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
    let sessionUserId = $("input[name='sessionUserId']").val();

    if (spanText === "채팅방 목록") {
        $("input[name='userId']").val("");
        $("input[name='enterUserId']").val("");
        $("input[name='genre']").val("");
        $("input[name='searchKeyword']").val("");
        $("form[name='form']").attr("method", "post").attr("action", "/chat/listChatSpace").submit();
    } else if (spanText === "개설한 채팅방") {
        $("input[name='userId']").val(sessionUserId);
        $("input[name='enterUserId']").val("");
        $("form[name='form']").attr("method", "post").attr("action", "/chat/listChatSpace").submit();
    } else if (spanText === "입장한 채팅방") {
        $("input[name='userId']").val("");
        $("input[name='enterUserId']").val(sessionUserId);
        $("form[name='form']").attr("method", "post").attr("action", "/chat/listChatSpace").submit();
    } else if (spanText === '채팅방 추가하기') {
        $(self.location).attr("href", "/chat/addChatSpace");
    }
}