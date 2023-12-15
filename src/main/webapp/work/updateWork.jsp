<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html>
<head>
    <title>cornstory</title>
    <link rel="stylesheet" href="/ssh/css/setting.css">
    <link rel="stylesheet" href="/ssh/css/plugin.css">
    <link rel="stylesheet" href="/ssh/css/template.css">
    <link rel="stylesheet" href="/ssh/css/common.css">
    <link rel="stylesheet" href="/ssh/css/style.css">
    <meta charset="utf-8">
    <style>
        label {
            display: block;
            margin-bottom: 8px;
        }

        input,
        textarea {
            margin-bottom: 16px;
        }
        .checkset-wrap {
            display: flex;
            flex-wrap: wrap;
        }

        .checkset {
            flex-basis: calc(33.333% - 10px);
            margin: 5px;
            box-sizing: border-box;
        }

        .checkset-label {
            display: block; /* 또는 inline-block */
        }

        .checkset-text {
            display: block; /* 또는 inline-block */
        }

        @media screen and (max-width: 768px) {
            .checkset {
                flex-basis: calc(50% - 10px); /* 화면이 좁아질 때 2개씩 나타내기 */
            }
        }

        @media screen and (max-width: 480px) {
            .checkset {
                flex-basis: 100%; /* 아주 좁은 화면에서는 한 줄에 하나씩 나타내기 */
            }
        }
        #image_container {
            max-width: 150px; /* 최대 가로 크기 설정 */
            max-height: 200px; /* 최대 세로 크기 설정 */
            overflow: hidden; /* 크기를 넘어가는 부분을 숨김 */
        }
    </style>
    <%--    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>--%>
</head>
<body>

<!--top start-->
<%@ include file="../layout/top.jsp" %>
<!--top end-->


<main class="th-layout-main ">
    <div class="opilsol-N31" data-bid="gslq1V9ptK">


        <div class="content-container">
            <form action="../work/updateWork" method="post" onsubmit="return validateForm()" enctype="multipart/form-data">
                <div class="textset content-top">
                    <div class="container-md">
                        <h2 class="textset-tit">작품 수정</h2>
                    </div>
                </div>
                <div class="contents-form" >
                    <div class="container-md">
                        <!-- 창작여부 -->
                        <div class="inputset inputset-lg inputset-group">
                            <label class="inputset-label" style="font-size: var(--fs-h4);" >창작여부</label>
                            <div class="radioset-wrap">
                                <div class="radioset">
                                    <input id="status0" name="status" class="visually-hidden" type="radio" value="0" ${work.status == 0 ? 'checked' : ''} onclick="toggleSelectBox();">
                                    <label class="radioset-thumb thumb-round" for="status0">원작</label>
                                </div>
                                <div class="radioset">
                                    <input id="status1" name="status" class="visually-hidden" type="radio" value="1" ${work.status == 1 ? 'checked' : ''} onclick="toggleSelectBox();">
                                    <label class="radioset-thumb thumb-round" for="status1">창작</label>
                                </div>
                            </div>
                        </div>
                        <div class="selectset selectset-lg" id="copylight" name="copylight">
                            <button class="selectset-toggle btn" type="button">
                                <span>저작권 구매한 작품</span>
                            </button>
                            <ul class="selectset-list">
                                <li class="selectset-item">
                                    <c:forEach var="product" items="${list}">
                                        <button class="selectset-link btn" type="button" data-value="<c:out value='${product.prodName}'/>">
                                            <span><c:out value='${product.prodName}'/></span>
                                        </button>
                                    </c:forEach>
                                </li>
                            </ul>
                        </div>


                        <!-- 작품명 -->
                        <div class="inputset inputset-lg inputset-group">
                            <label class="inputset-label" style="font-size: var(--fs-h4);" for="workName" >작품명</label>
                            <input type="text" class="inputset-input form-control" id="workName" name="workName" maxlength="30" value="${work.workName}">
                            <div id="workNameCount">글자 수: 0/30</div>
                        </div>

                        <!-- 카테고리 -->
                        <div class="inputset inputset-lg inputset-group">
                            <label class="inputset-label" style="font-size: var(--fs-h4);">카테고리</label>
                            <div class="radioset-wrap">
                                <div class="radioset">
                                    <input id="category0" name="category" class="visually-hidden" type="radio" value="0" onclick="updatePopcornCount(2)">
                                    <label class="radioset-thumb thumb-round" for="category0" >웹소설</label>
                                </div>
                                <div class="radioset">
                                    <input id="category1" name="category" class="visually-hidden" type="radio" value="1" onclick="updatePopcornCount(3)">
                                    <label class="radioset-thumb thumb-round" for="category1" >웹툰</label>
                                </div>
                                <div class="radioset">
                                    <input id="category2" name="category" class="visually-hidden" type="radio" value="2" onclick="updatePopcornCount(3)">
                                    <label class="radioset-thumb thumb-round" for="category2">웹드라마</label>
                                </div>
                            </div>
                        </div>

                        <!-- 장르 선택 -->
                        <div class="inputset inputset-lg inputset-group" style="line-height: 10;">
                            <label class="inputset-label"style="font-size: var(--fs-h4);">장르</label>
                            <div class="checkset-wrap">
                                <!-- 학원 장르 체크박스 -->
                                <div class="checkset">
                                    <input id="genreAcademy" class="checkset-input input-fill" type="checkbox" name="genre" value="학원" ${not empty work.genre1 && work.genre1 == '학원' || not empty work.genre2 && work.genre2 == '학원' || not empty work.genre3 && work.genre3 == '학원' ? 'checked' : ''}onclick="handleGenreCheckboxClick(this)">
                                    <label class="checkset-label" for="genreAcademy"></label>
                                    <span class="checkset-text">학원</span>
                                </div>
                                <!-- 액션 장르 체크박스 -->
                                <div class="checkset">
                                    <input id="genreAction" class="checkset-input input-fill" type="checkbox" name="genre" value="액션" ${not empty work.genre1 && work.genre1 == '액션' || not empty work.genre2 && work.genre2 == '액션' || not empty work.genre3 && work.genre3 == '액션' ? 'checked' : ''}onclick="handleGenreCheckboxClick(this)">
                                    <label class="checkset-label" for="genreAction"></label>
                                    <span class="checkset-text">액션</span>
                                </div>
                                <!-- SF 장르 체크박스 -->
                                <div class="checkset">
                                    <input id="genreSF" class="checkset-input input-fill" type="checkbox" name="genre" value="SF" ${not empty work.genre1 && work.genre1 == 'SF' || not empty work.genre2 && work.genre2 == 'SF' || not empty work.genre3 && work.genre3 == 'SF' ? 'checked' : ''}onclick="handleGenreCheckboxClick(this)">
                                    <label class="checkset-label" for="genreSF"></label>
                                    <span class="checkset-text">SF</span>
                                </div>
                                <!-- 판타지 장르 체크박스 -->
                                <div class="checkset">
                                    <input id="genreFantasy" class="checkset-input input-fill" type="checkbox" name="genre" value="판타지" ${not empty work.genre1 && work.genre1 == '판타지' || not empty work.genre2 && work.genre2 == '판타지' || not empty work.genre3 && work.genre3 == '판타지' ? 'checked' : ''}onclick="handleGenreCheckboxClick(this)">
                                    <label class="checkset-label" for="genreFantasy"></label>
                                    <span class="checkset-text">판타지</span>
                                </div>
                                <!-- 개그 장르 체크박스 -->
                                <div class="checkset">
                                    <input id="genreComedy" class="checkset-input input-fill" type="checkbox" name="genre" value="개그" ${not empty work.genre1 && work.genre1 == '개그' || not empty work.genre2 && work.genre2 == '개그' || not empty work.genre3 && work.genre3 == '개그' ? 'checked' : ''} onclick="handleGenreCheckboxClick(this)">
                                    <label class="checkset-label" for="genreComedy"></label>
                                    <span class="checkset-text">개그</span>
                                </div>
                                <!-- 로맨스 장르 체크박스 -->
                                <div class="checkset">
                                    <input id="genreRomance" class="checkset-input input-fill" type="checkbox" name="genre" value="로맨스" ${not empty work.genre1 && work.genre1 == '로맨스' || not empty work.genre2 && work.genre2 == '로맨스' || not empty work.genre3 && work.genre3 == '로맨스' ? 'checked' : ''} onclick="handleGenreCheckboxClick(this)">
                                    <label class="checkset-label" for="genreRomance"></label>
                                    <span class="checkset-text">로맨스</span>
                                </div>
                                <!-- 스포츠 장르 체크박스 -->
                                <div class="checkset">
                                    <input id="genreSports" class="checkset-input input-fill" type="checkbox" name="genre" value="스포츠" ${not empty work.genre1 && work.genre1 == '스포츠' || not empty work.genre2 && work.genre2 == '스포츠' || not empty work.genre3 && work.genre3 == '스포츠' ? 'checked' : ''} onclick="handleGenreCheckboxClick(this)">
                                    <label class="checkset-label" for="genreSports"></label>
                                    <span class="checkset-text">스포츠</span>
                                </div>
                                <!-- 일상 장르 체크박스 -->
                                <div class="checkset">
                                    <input id="genreSliceOfLife" class="checkset-input input-fill" type="checkbox" name="genre" value="일상" ${not empty work.genre1 && work.genre1 == '일상' || not empty work.genre2 && work.genre2 == '일상' || not empty work.genre3 && work.genre3 == '일상' ? 'checked' : ''}onclick="handleGenreCheckboxClick(this)">
                                    <label class="checkset-label" for="genreSliceOfLife"></label>
                                    <span class="checkset-text">일상</span>
                                </div>
                                <!-- 추리 장르 체크박스 -->
                                <div class="checkset">
                                    <input id="genreMystery" class="checkset-input input-fill" type="checkbox" name="genre" value="추리" ${not empty work.genre1 && work.genre1 == '추리' || not empty work.genre2 && work.genre2 == '추리' || not empty work.genre3 && work.genre3 == '추리' ? 'checked' : ''}onclick="handleGenreCheckboxClick(this)">
                                    <label class="checkset-label" for="genreMystery"></label>
                                    <span class="checkset-text">추리</span>
                                </div>
                                <!-- 스릴러 장르 체크박스 -->
                                <div class="checkset">
                                    <input id="genreThriller" class="checkset-input input-fill" type="checkbox" name="genre" value="스릴러" ${not empty work.genre1 && work.genre1 == '스릴러' || not empty work.genre2 && work.genre2 == '스릴러' || not empty work.genre3 && work.genre3 == '스릴러' ? 'checked' : ''}onclick="handleGenreCheckboxClick(this)">
                                    <label class="checkset-label" for="genreThriller"></label>
                                    <span class="checkset-text">스릴러</span>
                                </div>
                                <!-- 무협 장르 체크박스 -->
                                <div class="checkset">
                                    <input id="genreMartialArts" class="checkset-input input-fill" type="checkbox" name="genre" value="무협" ${not empty work.genre1 && work.genre1 == '무협' || not empty work.genre2 && work.genre2 == '무협' || not empty work.genre3 && work.genre3 == '무협' ? 'checked' : ''}onclick="handleGenreCheckboxClick(this)">
                                    <label class="checkset-label" for="genreMartialArts"></label>
                                    <span class="checkset-text">무협</span>
                                </div>
                                <!-- 기타 장르 체크박스 -->
                                <div class="checkset">
                                    <input id="genreOthers" class="checkset-input input-fill" type="checkbox" name="genre" value="기타" ${not empty work.genre1 && work.genre1 == '기타' || not empty work.genre2 && work.genre2 == '기타' || not empty work.genre3 && work.genre3 == '기타' ? 'checked' : ''}onclick="handleGenreCheckboxClick(this)">
                                    <label class="checkset-label" for="genreOthers"></label>
                                    <span class="checkset-text">기타</span>
                                </div>
                            </div>

                        </div>

                        <!-- 작가 노트 -->
                        <div class="inputset inputset-lg inputset-group">
                            <label class="inputset-label" style="font-size: var(--fs-h4);" for="note">작가 노트</label>
                            <textarea class="inputset-textarea inputset-input form-control textarea" id="note" name="note" maxlength="100"oninput=" updateCharCount('note', 'noteCount')">${work.note}</textarea>
                            <div id="noteCount">${fn:length(work.note)}/100</div>
                        </div>

                        <!-- 작품 소개 -->
                        <div class="inputset inputset-lg inputset-group">
                            <label class="inputset-label" style="font-size: var(--fs-h4);" for="workDesc">작품 소개</label>
                            <textarea class="inputset-textarea inputset-input form-control textarea" id="workDesc" name="workDesc" maxlength="400" oninput="updateCharCount('workDesc', 'charCount')">${work.workDesc}</textarea>
                            <div id="charCount">글자 수: ${fn:length(work.workDesc)}/400</div>
                        </div>

                        <!-- 썸네일 업로드 -->
                        <div class="inputset inputset-lg inputset-group" for="thumbnailFile">
                            <label class="inputset-label" style="font-size: var(--fs-h4);">썸네일</label>
                            <div id="image_container"><img src="<c:out value='${work.thumbnail}' />" alt="Thumbnail" style="max-width: 150px; max-height: 200px; display: block;"></div>
                            <input type="file" id="thumbnailFile" name="thumbnailFile" accept="image/*" onchange="setThumbnail(event)">
                        </div>

                        <!-- 유료/무료 선택 -->
                        <div class="inputset inputset-lg inputset-group">
                            <label class="inputset-label" style="font-size: var(--fs-h4);">유료/무료 선택</label>
                            <div class="radioset-wrap">
                                <div class="radioset">
                                    <input id="fap0" class="radioset-input input-line" name="fap" type="radio" value="0" ${work.fap == 0 ? 'checked' : ''} onclick="updatePopcornCount(0)">
                                    <label class="radioset-thumb thumb-round" for="fap0">무료</label>
                                </div>
                                <div class="radioset">
                                    <input id="fap1" class="radioset-input input-line" name="fap" type="radio" value="1" ${work.fap == 1 ? 'checked' : ''}onclick="updatePopcornCount(2)" >
                                    <label class="radioset-thumb thumb-round" for="fap1">유료</label>
                                    <p id="popcornCountText"></p>

                                </div>
                            </div>
                        </div>
                        <div class="inputset inputset-lg inputset-group" for="Mobile">
                            <label class="inputset-label" style="font-size: var(--fs-h4);">완결여부</label>
                            <div class="checkset-wrap">
                                <div class="checkset">
                                    <input id="checkset-a-1-1" class="checkset-input input-fill" type="checkbox" value="">
                                    <label class="checkset-label" for="checkset-a-1-1"></label>
                                    <span class="checkset-text"></span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <input type="hidden" name="genre1" value="">
                    <input type="hidden" name="genre2" value="">
                    <input type="hidden" name="genre3" value="">
                    <!-- 제출 버튼 -->
                    <div class="bottom-btn">
                        <button class="btnset btnset-lg btnset-dark btnset-rect" type="reset">취소</button>
                        <button class="btnset btnset-lg btnset-dark btnset-rect" type="submit">수정</button>
                    </div>
                </div>

            </form>
        </div>
    </div>
</main>




<!-- [S]thwhole-wfLpW5Z3pJ -->
<%@ include file="../layout/bottom.jsp" %>
<!-- [E]thwhole-wfLpW5Z3pJ -->
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

        // 카테고리 변경 이벤트 리스너 추가
        var categoryInputs = document.querySelectorAll('input[name="category"]');
        categoryInputs.forEach(function(input) {
            input.addEventListener('change', function() {
                updatePopcornCountBasedOnCategory();
            });
        });
    };

    function updatePopcornCount(popcornCount) {
        var fapValue = document.querySelector('input[name="fap"]:checked').value;
        var popcornCountTextElement = document.getElementById('popcornCountText');

        if (fapValue === '1') {
            popcornCountTextElement.textContent = '팝콘: ' + popcornCount + '개';
            popcornCountTextElement.style.display = 'block';
        } else {
            popcornCountTextElement.style.display = 'none';
        }
    }

    // 카테고리에 따라 팝콘 개수 업데이트하는 함수
    function updatePopcornCountBasedOnCategory() {
        var categoryValue = document.querySelector('input[name="category"]:checked').value;
        var fapValue = document.querySelector('input[name="fap"]:checked').value;
        var popcornCount = 0;

        if (fapValue === '1') {
            if (categoryValue === '0') { // 웹소설
                popcornCount = 2;
            } else if (categoryValue === '1') { // 웹툰
                popcornCount = 3;
            } else if (categoryValue === '2') { // 웹드라마
                popcornCount = 5;
            }
        }

        updatePopcornCount(popcornCount);
    }

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

        if (checkedCount < 1 || checkedCount > 3) {
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

        reader.onload = function(event) {
            // 기존 이미지를 모두 지우기
            var imageContainer = document.querySelector("div#image_container");
            imageContainer.innerHTML = "";

            var img = document.createElement("img");
            img.setAttribute("src", event.target.result);
            img.setAttribute("class", "col-lg-6");

            // 이미지 크기를 150px x 200px로 설정
            img.style.width = "150px";
            img.style.height = "200px";
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

    document.addEventListener('DOMContentLoaded', (event) => {
        var noteInput = document.getElementById('note');
        var workDescInput = document.getElementById('workDesc');
        var workNameInput = document.getElementById('workName');

        if (noteInput) {
            noteInput.addEventListener('input', function() {
                updateCharCount('note', 'noteCount', 100);
            });
        }

        if (workDescInput) {
            workDescInput.addEventListener('input', function() {
                updateCharCount('workDesc', 'charCount', 400);
            });
        }

        if (workNameInput) {
            workNameInput.addEventListener('input', function() {
                updateCharCount('workName', 'workNameCount', 30);
            });
        }
    });

    function toggleSelectBox() {
        var status = document.querySelector('input[name="status"]:checked').value;
        var selectBox = document.getElementById('copyright');
        console.log();
        // 창작이 선택되면 셀렉트 박스를 보이게 함
        if (status === '1') {
            // 셀렉트 박스의 옵션 개수가 0이면 창작 선택을 막음
            if (selectBox.options.length === 0) {
                document.querySelector('input[name="status"][value="0"]').checked = true;
                selectBox.style.display = 'none';
                alert('창작을 선택할 수 없습니다. 저작권을 먼저 등록해주세요.');
            } else {
                selectBox.style.display = 'block';
            }
        } else {
            selectBox.style.display = 'none';
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
            if (response === 0) { // 또는 if (parseInt(response) === 0)
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
