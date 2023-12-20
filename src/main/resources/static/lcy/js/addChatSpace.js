$(function () {
    $("input[type='button'][value='취소']").on("click", function () {
        history.go(-1);
    });

    $("input[name='cSpaceName']").on("keypress", function (event) {
        if (event.keyCode === 13) {
            event.preventDefault();
        }
    });

    $("input[type='button'][value='등록']").on("click", function () {
        let p = chatSpaceCheck();
        if (p) addChatSpace();
    });

    $("input[type='button'][value='수정']").on("click", function () {
        let p = chatSpaceCheck();
        if (p) updateChatSpace();
    });

    $("input[name='cSpaceName']").on("input", function () {
        updateCharCount();
        updateCSpceNameLength($(this).val().length); // 길이 업데이트 함수 호출
    });

    $("a:contains('채팅방 추가하기')").on("click", function () {
        $(self.location).attr("href", "/chat/addChatSpace");
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
            const file = event.originalEvent.dataTransfer.files[0];
            // Display the uploaded file
            displayFile(file);
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
});


function chatSpaceCheck() {
    if ($("input[name='cSpaceName']").val() === "") {
        event.preventDefault();
        // alert("채팅방 제목을 입력해주세요.");
        displayErrorMessageWithCountdown('채팅방 제목을 입력해주세요.', 3, document.querySelector('.cSpaceNameCheck'));
        return false;
    }
    if (!$("input[name='genre2']").val() && !$("input[name='genre']:checked").val()) {
        event.preventDefault();
        // alert("장르를 선택해주세요.");
        displayErrorMessageWithCountdown('장르를 선택해주세요.', 3, document.querySelector('.genreCheck'));
        return false;
    }
    if ($("input[name='file']").val() && !$("input[name='file']").val().endsWith(".jpg")) {
        event.preventDefault();
        // alert("jpg 파일만 업로드 가능합니다.");
        displayErrorMessageWithCountdown('jpg 파일만 업로드 가능합니다.', 3, document.querySelector('.fileCheck'));
        return false;
    }
    return true;
}

function addChatSpace() {
    const formData = new FormData(document.forms.namedItem("addForm"));
    fetch('/chat/addChatSpace', {
        method: 'POST',
        headers: {
            // 'Content-Type': 'multipart/form-data',
            'enctype': 'multipart/form-data',
            // 다른 헤더 설정 가능
        },
        body: formData
    })
        .then(response => {
            if (!response.ok) {
                throw new Error('Network response was not ok');
            }
            return response.json();
        })
        .then(JSONData => {
            // console.log('Received data:', data);
            const form = document.createElement('form');
            form.method = 'post';
            form.action = JSONData.url;
            form.enctype = 'application/json';  // Set content type to JSON

            addJsonDataToForm(form, JSONData.chatSpace, 'chatSpace');
            addJsonDataToForm(form, JSONData.list, 'list');
            addJsonDataToForm(form, JSONData.userList, 'userList');
            addJsonDataToForm(form, JSONData.totalCount, 'totalCount');
            addJsonDataToForm(form, JSONData.user, 'user');

            const chatWindow = window.open('', 'chatWindow', 'width=500,height=400,left:100,top:100');

            // Check if the new window/tab is opened successfully
            if (chatWindow) {
                // Set the HTML content of the new window to the form
                chatWindow.document.body.appendChild(form);

                // Submit the form
                form.submit();

                $(self.location).attr("href", "/chat/listChatSpace");
            } else {
                console.error('Failed to open a new window.');
            }
        })
        .catch(error => {
            console.error('Error:', error);
        });
    // $("form[name='addForm']").attr("method", "post").attr("action", "/chat/addChatSpace").submit();
}

function updateChatSpace() {
    const formData = new FormData(document.forms.namedItem("updateForm"));
    fetch('/chat/updateChatSpace', {
        method: 'POST',
        headers: {
            // 'Content-Type': 'multipart/form-data',
            'enctype': 'multipart/form-data',
            // 다른 헤더 설정 가능
        },
        body: formData
    })
        .then(response => {
            if (!response.ok) {
                throw new Error('Network response was not ok');
            }
            return response.json();
        })
        .then(JSONData => {
            // console.log('Received data:', data);
            const form = document.createElement('form');
            form.method = 'post';
            form.action = JSONData.url;
            form.enctype = 'application/json';  // Set content type to JSON

            addJsonDataToForm(form, JSONData.chatSpace, 'chatSpace');
            addJsonDataToForm(form, JSONData.list, 'list');
            addJsonDataToForm(form, JSONData.userList, 'userList');
            addJsonDataToForm(form, JSONData.totalCount, 'totalCount');
            addJsonDataToForm(form, JSONData.user, 'user');

            const chatWindow = window.open('', 'chatWindow', 'width=500,height=400,left:100,top:100');

            // Check if the new window/tab is opened successfully
            if (chatWindow) {
                // Set the HTML content of the new window to the form
                chatWindow.document.body.appendChild(form);

                // Submit the form
                form.submit();

                $(self.location).attr("href", "/chat/listChatSpace");
            } else {
                console.error('Failed to open a new window.');
            }
        })
        .catch(error => {
            console.error('Error:', error);
        });
}

//길이제한
function updateCharCount() {
    let input = $("input[name='cSpaceName']");
    let count = $(".cSpaceNameLength");

    if (input.val().length > input.maxLength) {
        input.val(input.val().substring(0, input.maxLength));
    }

    count.text(input.val().length + '/' + input.maxLength);
}

function updateCSpceNameLength(length) {
    $(".cSpaceNameLength").text(length + "/30");
}

function addJsonDataToForm(form, postData, name) {
    const jsonDataInput = document.createElement('input');
    jsonDataInput.type = 'hidden';
    jsonDataInput.name = name;
    jsonDataInput.value = JSON.stringify(postData);
    form.appendChild(jsonDataInput);
}

function displayErrorMessageWithCountdown(message, seconds, errorMessageContainer) {
    errorMessageContainer.innerText = message + ' ' + seconds + '초 후에 사라집니다.';

    let countdown = seconds;
    let countdownInterval = setInterval(function () {
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


function displayFile(file) {
    const listItem = $("<li>");
    let reader = new FileReader();

    reader.onload = function (e) {
        listItem.html('<img src="' + e.target.result + '" alt="your image"/>');
    };

    reader.readAsDataURL(file);

    $(".file-list").empty().append(listItem);

}