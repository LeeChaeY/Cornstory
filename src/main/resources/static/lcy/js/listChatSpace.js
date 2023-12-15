$(function() {
    if($("input[name='userStatus']").val() === "0") {
        $("input[id='checkset-e-4-1']").attr("checked", "");
    } else if($("input[name='userStatus']").val() === "1") {
        $("input[id='checkset-e-4-2']").attr("checked", "");
    } else if($("input[name='userStatus']").val() === "2") {
        $("input[id='checkset-e-4-3']").attr("checked", "");
    }

    let genre = $("input[name='genre']").val();
    if (genre === "") {
        $("input[id='radioset-c-1-1']").attr("checked", "");
    } else if (genre === "학원") {
        $("input[id='radioset-c-1-2']").attr("checked", "");
    } else if (genre === "액션") {
        $("input[id='radioset-c-1-3']").attr("checked", "");
    } else if (genre === "SF") {
        $("input[id='radioset-c-1-4']").attr("checked", "");
    } else if (genre === "판타지") {
        $("input[id='radioset-c-1-5']").attr("checked", "");
    } else if (genre === "개그") {
        $("input[id='radioset-c-1-6']").attr("checked", "");
    } else if (genre === "로맨스") {
        $("input[id='radioset-c-1-7']").attr("checked", "");
    } else if (genre === "스포츠") {
        $("input[id='radioset-c-1-8']").attr("checked", "");
    } else if (genre === "일상") {
        $("input[id='radioset-c-1-9']").attr("checked", "");
    } else if (genre === "추리") {
        $("input[id='radioset-c-1-10']").attr("checked", "");
    } else if (genre === "스릴러") {
        $("input[id='radioset-c-1-11']").attr("checked", "");
    } else if (genre === "무협") {
        $("input[id='radioset-c-1-12']").attr("checked", "");
    } else if (genre === "기타") {
        $("input[id='radioset-c-1-13']").attr("checked", "");
    }

    $(".listStoreSearchButton").on("click", function() {
        $("form[name='form']").attr("method", "post").attr("action", "/chat/listChatSpace").submit();
    });

    $("span").on("click", function() {
        fncGetChatList('1');
    });

    $(".radioset-thumb").on("click", function() {
        fncGetChatList('1');
    });

    $("input[type='button'][value='입장하기']").on("click", function() {
        let chatSpaceNo = $(this).parents("tr").children("td").eq(0).children("input").val();
        enterChatSpace(chatSpaceNo);
    });

    $("input[type='button'][value='수정하기']").on("click", function() {
        let chatSpaceNo = $(this).parents("tr").children("td").eq(0).children("input").val();
        updateChatSpace(chatSpaceNo);
    });

    $("input[type='button'][value='삭제하기']").on("click", function() {
        let chatSpaceNo = $(this).parents("tr").children("td").eq(0).children("input").val();
        deleteChatSpace(chatSpaceNo);
    });

    $("input[type='button'][value='나가기']").on("click", function() {
        let chatSpaceNo = $(this).parents("tr").children("td").eq(0).children("input").val();
        deleteChatEnter(chatSpaceNo);
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

function enterChatSpace(chatSpaceNo) {
    // $(self.location).attr("href", "/chat/enterChatSpace?chatSpaceNo="+chatSpaceNo);
    popWin = window.open("/chat/enterChatSpace?chatSpaceNo=" + chatSpaceNo, "popWin", "scrollbars=yes");
}

function updateChatSpace(chatSpaceNo) {
    $(self.location).attr("href", "/chat/updateChatSpace?chatSpaceNo=" + chatSpaceNo);
}

function deleteChatSpace(chatSpaceNo) {
    $.ajax({
        url: "/chat/json/deleteChatSpace/" + chatSpaceNo + "",
        method: "GET",
        success: function(JSONData, status) {
            $("input[value='" + chatSpaceNo + "']").parents("tr").children("td").remove();
        },
        error: function(status) {

            //Debug...
            alert("error");
        }
    });
}

function deleteChatEnter(chatSpaceNo) {
    $.ajax({
        url: "/chat/json/deleteChatEnter?chatSpaceNo=" + chatSpaceNo,
        method: "GET",
        dataType: "text",
        data: {},
        success: function(returnMessage, status) {
            // alert(returnMessage);
            let cnt = $("input[value='" + chatSpaceNo + "']").parents("tr").children("td").eq(5).text() - 1;
            $("input[value='" + chatSpaceNo + "']").parents("tr").children("td").eq(5).text(cnt);
            $("input[value='" + chatSpaceNo + "']").parents("tr").children("td").eq(14).children("input").eq(1).remove();
        },
        error: function(status) {

            //Debug...
            alert("error");
        }
    });
}