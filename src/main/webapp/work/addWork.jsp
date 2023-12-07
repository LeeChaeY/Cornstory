<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
    <title>작품 추가</title>
    <style>
        label {
            display: block;
            margin-bottom: 8px;
        }

        input,
        textarea {
            margin-bottom: 16px;
        }
    </style>
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
</head>
<body>

<h2>작품 추가</h2>

<form action="../work/addWork" method="post" onsubmit="return validateForm()" enctype="multipart/form-data">

    <label for="userId">작성자:</label>
    <input type="text" id="userId" name="userId" value="${user.userId}" required />

    <label>창작 여부:</label>
    <label>
        <input type="radio" name="status" value="0" checked onclick="toggleSelectBox();"/> 원작
    </label>
    <label>
        <input type="radio" name="status" value="1" onclick="toggleSelectBox();"/> 창작
    </label>
    <select id="copylight" name="copylight">
        <c:forEach var="product" items="${list}">
            <option value="<c:out value='${product.prodName}' />"><c:out value='${product.prodName}' /></option>
        </c:forEach>
    </select>
    <label for="workName">작품명:</label>
    <input type="text" id="workName" name="workName" maxlength="30" required oninput="updateCharCount('workName', 'workNameCount')"/>
    <div id="workNameCount">글자 수: 0/30</div>
    <div id="workNameMessage"></div>
    <label>카테고리:</label>
    <label>
        <input type="radio" name="category" value="0" checked onclick="updatePopcornCount(2)"/> 웹소설
    </label>
    <label>
        <input type="radio" name="category" value="1" onclick="updatePopcornCount(3)"/> 웹툰
    </label>
    <label>
        <input type="radio" name="category" value="2" onclick="updatePopcornCount(5)"/> 웹드라마
    </label>

    <label>장르:</label>
    <label>
        <input type="checkbox" name="genre" value="학원" onclick="handleGenreCheckboxClick(this)"/> 학원
    </label>
    <label>
        <input type="checkbox" name="genre" value="액션" onclick="handleGenreCheckboxClick(this)"/> 액션
    </label>
    <label>
        <input type="checkbox" name="genre" value="SF" onclick="handleGenreCheckboxClick(this)"/> SF
    </label>
    <label>
        <input type="checkbox" name="genre" value="판타지" onclick="handleGenreCheckboxClick(this)"/> 판타지
    </label>
    <label>
        <input type="checkbox" name="genre" value="개그" onclick="handleGenreCheckboxClick(this)"/> 개그
    </label>
    <label>
        <input type="checkbox" name="genre" value="로맨스" onclick="handleGenreCheckboxClick(this)"/> 로맨스
    </label>
    <label>
        <input type="checkbox" name="genre" value="스포츠" onclick="handleGenreCheckboxClick(this)"/> 스포츠
    </label>
    <label>
        <input type="checkbox" name="genre" value="일상" onclick="handleGenreCheckboxClick(this)"/> 일상
    </label>
    <label>
        <input type="checkbox" name="genre" value="추리" onclick="handleGenreCheckboxClick(this)"/> 추리
    </label>
    <label>
        <input type="checkbox" name="genre" value="스릴러" onclick="handleGenreCheckboxClick(this)"/> 스릴러
    </label>
    <label>
        <input type="checkbox" name="genre" value="무협" onclick="handleGenreCheckboxClick(this)"/> 무협
    </label>
    <label>
        <input type="checkbox" name="genre" value="기타" onclick="handleGenreCheckboxClick(this)"/> 기타
    </label>

    <label for="note">작가 노트:</label>
    <textarea id="note" name="note" maxlength="100" oninput="updateCharCount('note', 'noteCount')"></textarea>
    <div id="noteCount">글자 수: 0/100</div>

    <label for="workDesc">작품 소개:</label>
    <textarea id="workDesc" name="workDesc" maxlength="400" oninput="updateCharCount('workDesc', 'charCount')"></textarea>
    <div id="charCount">글자 수: 0/400</div>



    <label for="thumbnailFile">썸네일 (이미지 파일만):</label>
    <div class="form-group">
        <input class="form-control form-control-user" type="file"
               name="thumbnailFile" id="thumbnailFile" onchange="setThumbnail(event);" accept=".jpg">
    </div>
    <div id="image_container"></div>


    <label>유료 / 무료 선택:</label>
    <label>
        <input type="radio" name="fap" value="0" checked onclick="updatePopcornCount(0)" /> 무료
    </label>
    <label>
        <input type="radio" name="fap" value="1" onclick="updatePopcornCount(2)" /> 유료
    </label>
    <p id="popcornCountText"></p>
    <!-- 각 장르에 해당하는 input 추가 -->
    <input type="hidden" name="genre1" />
    <input type="hidden" name="genre2" />
    <input type="hidden" name="genre3" />

    <button type="submit">작업 추가</button>
</form>

</body>
<script>
    window.onload = function() {
        toggleSelectBox();
        updatePopcornCount(0);
        checkWorkName();

        var workNameInput = document.getElementById('workName');
        workNameInput.addEventListener('input', function() {
            checkWorkName(); // 작품명이 변경될 때마다 실행
        });
    };

    function handleGenreCheckboxClick(checkbox) {
        var checkboxes = document.getElementsByName("genre");
        var checkedCount = 0;

        for (var i = 0; i < checkboxes.length; i++) {
            if (checkboxes[i].checked) {
                checkedCount++;
            }
        }

        if (checkedCount > 3) {
            checkbox.checked = false;
            alert("장르는 최대 3개까지 선택 가능합니다.");
        }
    }

    function validateForm() {
        var fileInput = document.getElementById('thumbnailFile');
        var checkboxes = document.getElementsByName("genre");
        var checkedCount = 0;

        var genre1 = "";
        var genre2 = "";
        var genre3 = "";

        for (var i = 0; i < checkboxes.length; i++) {
            if (checkboxes[i].checked) {
                checkedCount++;
                if (checkedCount === 1) {
                    genre1 = checkboxes[i].value;
                } else if (checkedCount === 2) {
                    genre2 = checkboxes[i].value;
                } else if (checkedCount === 3) {
                    genre3 = checkboxes[i].value;
                }
            }
        }

        if (checkedCount <= 1 && checkedCount >= 3) {
            alert("장르는 최소 1개 이상, 최대 3개까지 선택해야 합니다.");
            return false;
        }

        // 파일이 선택되었는지 확인
        if (fileInput.files.length === 0) {
            alert('이미지 파일을 선택해주세요.');
            return false; // submit 막기
        }


        // 선택된 장르 값을 각각의 input에 할당
        document.getElementsByName("genre1")[0].value = genre1;
        document.getElementsByName("genre2")[0].value = genre2;
        document.getElementsByName("genre3")[0].value = genre3;

        return true;
    }

    function setThumbnail(event){
        var fileInput = event.target;
        var fileName = fileInput.value.toLowerCase();

        // 파일이 선택되지 않았을 경우 처리
        if (!fileInput.files || !fileInput.files[0]) {
            var imageContainer = document.querySelector("div#image_container");
            imageContainer.innerHTML = "";
            return;
        }

        if (!fileName.endsWith('.jpg')) {
            alert('jpg 파일만 됩니다');
            fileInput.value = "";
            return;
        }

        var reader = new FileReader();

        reader.onload = function(event){
            // 기존 이미지를 모두 지우기
            var imageContainer = document.querySelector("div#image_container");
            imageContainer.innerHTML = "";

            var img = document.createElement("img");
            img.setAttribute("src", event.target.result);
            img.setAttribute("class", "col-lg-6");

            img.style.maxWidth = "300px";
            img.style.maxHeight = "300px";
            img.style.display = "block";

            imageContainer.appendChild(img);
        };

        reader.readAsDataURL(event.target.files[0]);
    }
    function updateCharCount(inputId, countId) {
        var input = document.getElementById(inputId);
        var count = document.getElementById(countId);

        if (input.value.length > input.maxLength) {
            input.value = input.value.substring(0, input.maxLength);
        }

        count.textContent = '글자 수: ' + input.value.length + '/' + input.maxLength;
    }
    function toggleSelectBox() {
        var status = document.querySelector('input[name="status"]:checked').value;
        var selectBox = document.getElementById('copylight');

        // 창작이 선택되면 셀렉트 박스를 보이게 함
        if (status === '1') {


            // 셀렉트 박스의 옵션 개수가 0이면 창작 선택을 막음
            if (status === '1' && selectBox.options.length === 0) {
                document.querySelector('input[name="status"][value="0"]').checked = true;
                selectBox.style.display = 'none';
                alert('창작을 선택할 수 없습니다. 저작권을 먼저 등록해주세요.');
            }else{
                selectBox.style.display = 'block';
            }
        } else {
            selectBox.style.display = status === '1' ? 'block' : 'none';
        }
    }
    function updatePopcornCount(popcornCount) {
        var fapValue = document.querySelector('input[name="fap"]:checked').value;
        var categoryValue = document.querySelector('input[name="category"]:checked').value;

        if (fapValue === '1') {
            document.getElementById('popcornCountText').textContent = '팝콘: ' + popcornCount + '개';
            popcornCountText.style.display = 'block'; // 무료가 아닌 경우 보이게 함
        }else{
            popcornCountText.style.display = 'none'; // 무료인 경우 감춤
        }
    }

    function checkWorkName() {
        var workName = $('#workName').val();
        var userId = "${userId}";
        $.get( '/work/json/checkWorkName',
            {
                userId: userId,
                workName: workName
            }).done(function (response) {
                var messageDiv = $('#workNameMessage');
                console.log(response);
                if (response == 0) { // 또는 if (parseInt(response) === 0)
                    messageDiv.text('등록된 작품이 없습니다.');
                    messageDiv.css('color', 'green');
                } else {
                    messageDiv.text('등록된 작품이 있습니다. 다른 작품명으로 적어주세요.');
                    messageDiv.css('color', 'red');
                }
            })
            .fail(function (){
                console.error('Ajax 요청 실패');
            });
    }


</script>
</html>
