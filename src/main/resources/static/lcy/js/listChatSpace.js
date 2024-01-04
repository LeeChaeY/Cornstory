$(function() {
    let chatWindow;

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

    $(".radioset-thumb").on("click", function() {
        fncGetChatList('1');
    });

    $("a:contains('채팅방 추가하기')").on("click", function() {
        $(self.location).attr("href", "/chat/addChatSpace");
    });

    $("input[type='button'][value='입장하기']").on("click", function() {
        let chatSpaceNo = $(this).parents().parents().children("input").val();
        enterChatSpace(chatSpaceNo);
    });

    $("input[type='button'][value='수정하기']").on("click", function() {
        let chatSpaceNo = $(this).parents().parents().children("input").val();
        updateChatSpace(chatSpaceNo);
    });

    $("input[type='button'][value='삭제하기']").on("click", function() {
        const p = confirm("정말 삭제하시겠습니까?");
        if (p) {
            let chatSpaceNo = $(this).parents().parents().children("input").val();
            deleteChatSpace(chatSpaceNo);
        }
    });

    $("input[type='button'][value='나가기']").on("click", function() {
        const p = confirm("정말 나가시겠습니까?");
        if (p) {
            let chatSpaceNo = $(this).parents().parents().children("input").val();
            deleteChatEnter(chatSpaceNo);
        }
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
    else if (spanText === "전체") {
        // $("input[name='userStatus']").val(0);
        $("input[name='genre']").val("");
        $("input[name='searchKeyword']").val("");
        $("form[name='form']").attr("method", "post").attr("action", "/chat/listChatSpace").submit();
    } else $("input[name='genre']").val("");


    // if (spanText === "개설한 채팅방") {
    //     $("input[name='userStatus']").val(1);   //0: 전체, 1: 개설, 2: 입장
    //     $("form[name='form']").attr("method", "post").attr("action", "/chat/listChatSpace").submit();
    // } else if (spanText === "입장한 채팅방") {
    //     $("input[name='userStatus']").val(2);   //0: 전체, 1: 개설, 2: 입장
    //     $("form[name='form']").attr("method", "post").attr("action", "/chat/listChatSpace").submit();
    // } else if (spanText === '채팅방 추가하기') {
    //     $(self.location).attr("href", "/chat/addChatSpace");
    // }
}

function enterChatSpace(chatSpaceNo) {

    $.ajax({
        url: "/chat/json/enterChatSpace?chatSpaceNo=" + chatSpaceNo + "",
        method: "GET",
        dataType: "json",
        success: function(JSONData, status) {
            let buttonLength = $($("input[value='" + chatSpaceNo + "']").parents("div").children("div").eq(3)).children("input").length;

            if (buttonLength === 1) {
                let userCnt = $("#cSpaceUserCnt_" + chatSpaceNo);
                let cnt = parseInt(userCnt.text()) + 1;
                userCnt.text(cnt);
                const exit = $("<input>");
                exit.attr("type", "button");
                exit.attr("value", "나가기");
                exit.on("click", function() {
                    const p = confirm("정말 나가시겠습니까?");
                    if (p) {
                        deleteChatEnter(chatSpaceNo);
                    }
                });
                $($("input[value='" + chatSpaceNo + "']").parents("div").children("div").eq(3)).append(exit);
            }

            const form = document.createElement('form');
            form.method = 'post';
            form.action = JSONData.url;
            form.enctype = 'application/json';  // Set content type to JSON

            addJsonDataToForm(form, JSONData.chatSpace, 'chatSpace');
            addJsonDataToForm(form, JSONData.userList, 'userList');
            addJsonDataToForm(form, JSONData.totalCount, 'totalCount');
            addJsonDataToForm(form, JSONData.user, 'user');
            addJsonDataToForm(form, JSONData.startDate, 'startDate');

            const width = 1000;
            const height = 600;
            const leftPosition = (window.innerWidth - width) / 2;
            const topPosition = (window.innerHeight - height) / 2;
            chatWindow = window.open('',chatSpaceNo, 'width='+width+',height='+height+',left='+leftPosition+',top='+topPosition);

            // Check if the new window/tab is opened successfully
            if (chatWindow) {
                // Set the HTML content of the new window to the form
                chatWindow.document.body.appendChild(form);

                // Submit the form
                form.submit();
            } else {
                console.error('Failed to open a new window.');
            }
        },
        error: function(status) {

            //Debug...
            alert("error");
        }
    });
}

function addJsonDataToForm(form, postData, name) {
    const jsonDataInput = document.createElement('input');
    jsonDataInput.type = 'hidden';
    jsonDataInput.name = name;
    jsonDataInput.value = JSON.stringify(postData);
    form.appendChild(jsonDataInput);
}

function updateChatSpace(chatSpaceNo) {
    $(self.location).attr("href", "/chat/updateChatSpace?chatSpaceNo=" + chatSpaceNo);
}

function deleteChatSpace(chatSpaceNo) {
    // const socket = io.connect();
    // socket.emit("delete", {chatSpaceNo: chatSpaceNo});

    $.ajax({
        url: "/chat/json/deleteChatSpace/" + chatSpaceNo + "",
        method: "GET",
        success: function(JSONData, status) {
            $("input[value='" + chatSpaceNo + "']").parents().remove();

            // socket.emit("delete", {chatSpaceNo: chatSpaceNo});
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
            $("#cSpaceUserCnt_" + chatSpaceNo).text(parseInt($("#cSpaceUserCnt_" + chatSpaceNo).text())-1);

            $($("input[value='" + chatSpaceNo + "']").parents("div").children("div").eq(3)).children("input").eq(1).remove();

            if (chatWindow && !chatWindow.closed) {
                chatWindow.close();
            } else {
                console.log('Window not found or already closed.');
            }
        },
        error: function(status) {

            //Debug...
            alert("error");
        }
    });
}


// 모달 창을 열기 위한 함수
function openModal(workName, episodeOrder, episodeName) {
    console.log("Function called with:", workName, episodeOrder, episodeName);
    var modal = document.getElementById("myModal");
    modal.style.display = "block";

    var modalContent = document.getElementById("modalContent");
    modalContent.innerHTML = workName+' : '+episodeOrder+'회 '+episodeName+'를 시청하시겠습니까?'
}

// 모달 창을 닫기 위한 함수
function closeModal() {
    var modal = document.getElementById("myModal");
    modal.style.display = "none";
}