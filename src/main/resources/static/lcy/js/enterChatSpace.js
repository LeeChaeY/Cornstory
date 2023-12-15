$(function() {
    $("input[type='submit'][value='전송']").on("click", function() {
        addChat();
    });
    $("textarea[name='chatContent']").on("keyPress", function() {
        if (e.keyCode && e.keyCode === 13) addChat();
    });
    $("input[type='button'][value='인원보기']").on("click", function() {
        $("#slideMenu").addClass('on'); //슬라이드 메뉴 감춤

    });
    $("#closeSlideMenu").on("click", function() {
        $("#slideMenu").removeClass('on'); //슬라이드 메뉴 감춤
    });

});


function addChat() {
    let chatSpaceNo = $("input[name='chatSpaceNo']").val();
    let chatContent = $("textarea[name='chatContent']").val();

    $.ajax({
        url: "/chat/json/addChat",
        method: "POST",
        dataType: "json",
        data: JSON.stringify({
            "chatSpaceNo": chatSpaceNo,
            "chatContent": chatContent
        }),
        contentType: "application/json; charset=utf-8",
        headers: {
            "Accept": "application/json",
            "Content-Type": "application/json"
        },
        success: function(JSONData, status) {

            let chat = "<div align='right'> <p class='ct_list_pop' align='left' " +
                "style='min-height: 100px; width: 40%; background-color: lightgray; padding : 5px; position: relative;'>" +
                "<span style='display: block; padding-bottom: 10px'>" +
                "<img src='/file/user/" + JSONData.userImage + "'> " + JSONData.nickname + "</span>" +
                JSONData.chatContent +
                "<span style='display: block; padding: 5px; position: absolute; bottom: 0; right: 0;'>" +
                JSONData.chatDate + "</span></p></div>";

            $(".chatList").append(chat);
            $("textarea[name='chatContent']").val("");
        },
        error: function(status) {

            //Debug...
            alert("error");
        }
    });
}