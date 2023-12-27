<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="imagetoolbar" content="no">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="format-detection" content="telephone=no">
    <title>cornstory</title>
    <link rel="stylesheet" href="/khs/css/setting.css">
    <link rel="stylesheet" href="/khs/css/plugin.css">
    <link rel="stylesheet" href="/khs/css/template.css">
    <link rel="stylesheet" href="/khs/css/common.css">
    <link rel="stylesheet" href="/khs/css/style.css">
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
</head>
<body>

<!--top start-->
<%--<%@ include file="../layout/header.jsp" %>--%>
<jsp:include page="../layout/header.jsp" flush="true"/>
<!--top end-->

<main class="th-layout-main ">
    <div class="hooms-N39" data-bid="MzlQkMIezC" >
        <div class="contents-inner">
            <form action="../work/addWork" method="post" onsubmit="return validateForm()" enctype="multipart/form-data">
                <div class="contents-container container-md">
                    <div class="textset textset-h2">
                        <h2 class="textset-tit">작품 추가</h2>
                    </div>

                    <!-- 창작여부 선택 -->
                    <div class="inputset inputset-lg inputset-group">
                        <label class="labelset">
                            <h6 class="labelset-tit">창작<span>*</span>
                            </h6>
                            <strong class="labelset-vital">
                                <span>*</span>필수입력 </strong>
                        </label>
                        <div class="radioset-wrap">
                            <div class="radioset">
                                <input id="status0" name="status" class="visually-hidden" type="radio" value="0" checked>
                                <label class="radioset-thumb thumb-round" for="status0">원작</label>
                            </div>
                            <div class="radioset">
                                <input id="status1" name="status" class="visually-hidden" type="radio" value="1">
                                <label class="radioset-thumb thumb-round" for="status1">창작</label>
                            </div>
                        </div>
                        <div id="creationMessage" style="color: red;"></div>
                    </div>

                    <!-- 저작권 구매한 작품 선택 -->
                    <div class="selectset selectset-lg" id="copylight" name="copylight">
                        <button class="selectset-toggle btn" type="button" id="copylightButton" aria-haspopup="true" aria-expanded="false">
                            저작권 구매한 작품 선택
                        </button>
                        <ul class="selectset-list" aria-labelledby="copylightButton">
                            <!-- 서버에서 불러온 저작권 구매한 작품 목록을 반복적으로 표시 -->
                            <c:forEach var="product" items="${list}">
                                <li class="selectset-item">
                                    <button class="selectset-link btn" type="button" data-value="<c:out value='${product.prodName}'/>">
                                        <span><c:out value='${product.prodName}'/></span>
                                    </button>
                                </li>
                            </c:forEach>
                        </ul>
                    </div>

                    <div class="inputset inputset-lg inputset-group">
                        <label class="labelset">
                            <h6 class="labelset-tit">카테고리<span>*</span>
                            </h6>
                        </label>
                        <div class="radioset-wrap">
                            <!-- 웹소설 카테고리 -->
                            <div class="radioset">
                                <input id="categoryNovel" name="category" class="visually-hidden" type="radio" value="0">
                                <label class="radioset-thumb thumb-round" for="categoryNovel">웹소설</label>
                            </div>
                            <!-- 웹툰 카테고리 -->
                            <div class="radioset">
                                <input id="categoryWebtoon" name="category" class="visually-hidden" type="radio" value="1">
                                <label class="radioset-thumb thumb-round" for="categoryWebtoon">웹툰</label>
                            </div>
                            <!-- 웹드라마 카테고리 -->
                            <div class="radioset">
                                <input id="categoryDrama" name="category" class="visually-hidden" type="radio" value="2">
                                <label class="radioset-thumb thumb-round" for="categoryDrama">웹드라마</label>
                            </div>
                        </div>
                    </div>

                    <!-- 작품명 입력 필드 -->
                    <div class="inputset inputset-lg inputset-group">
                        <label class="labelset" for="workName">
                            <h6 class="labelset-tit">작품명<span>*</span>
                            </h6>
                        </label>
                        <input type="text" class="inputset-input form-control" id="workName" name="workName" maxlength="30" required>
                        <div id="workNameCount">글자 수: 0/30</div>
                    </div>
                    <div id="workNameMessage" style="color: red;"></div>

                    <!-- 장르 선택 체크박스 -->
                    <div class="inputset inputset-lg inputset-group">
                        <label class="labelset">
                            <h6 class="labelset-tit">장르<span>*</span>
                            </h6>
                        </label>
                        <div class="checkset-wrap">
                            <!-- 학원 장르 -->
                            <div class="checkset">
                                <input id="genreAcademy" class="checkset-input input-fill" type="checkbox" name="genre" value="학원" onclick="handleGenreCheckboxClick(this)">
                                <label class="checkset-label" for="genreAcademy"></label>
                                <span class="checkset-text">학원</span>
                            </div>
                            <!-- 액션 장르 -->
                            <div class="checkset">
                                <input id="genreAction" class="checkset-input input-fill" type="checkbox" name="genre" value="액션" onclick="handleGenreCheckboxClick(this)">
                                <label class="checkset-label" for="genreAction"></label>
                                <span class="checkset-text">액션</span>
                            </div>
                            <!-- SF 장르 -->
                            <div class="checkset">
                                <input id="genreSF" class="checkset-input input-fill" type="checkbox" name="genre" value="SF" onclick="handleGenreCheckboxClick(this)">
                                <label class="checkset-label" for="genreSF"></label>
                                <span class="checkset-text">SF</span>
                            </div>
                            <!-- 판타지 장르 -->
                            <div class="checkset">
                                <input id="genreFantasy" class="checkset-input input-fill" type="checkbox" name="genre" value="판타지" onclick="handleGenreCheckboxClick(this)">
                                <label class="checkset-label" for="genreFantasy"></label>
                                <span class="checkset-text">판타지</span>
                            </div>
                            <!-- 개그 장르 -->
                            <div class="checkset">
                                <input id="genreComedy" class="checkset-input input-fill" type="checkbox" name="genre" value="개그" onclick="handleGenreCheckboxClick(this)">
                                <label class="checkset-label" for="genreComedy"></label>
                                <span class="checkset-text">개그</span>
                            </div>
                            <!-- 로맨스 장르 -->
                            <div class="checkset">
                                <input id="genreRomance" class="checkset-input input-fill" type="checkbox" name="genre" value="로맨스" onclick="handleGenreCheckboxClick(this)">
                                <label class="checkset-label" for="genreRomance"></label>
                                <span class="checkset-text">로맨스</span>
                            </div>
                            <!-- 스포츠 장르 -->
                            <div class="checkset">
                                <input id="genreSports" class="checkset-input input-fill" type="checkbox" name="genre" value="스포츠" onclick="handleGenreCheckboxClick(this)">
                                <label class="checkset-label" for="genreSports"></label>
                                <span class="checkset-text">스포츠</span>
                            </div>
                            <!-- 일상 장르 -->
                            <div class="checkset">
                                <input id="genreSliceOfLife" class="checkset-input input-fill" type="checkbox" name="genre" value="일상" onclick="handleGenreCheckboxClick(this)">
                                <label class="checkset-label" for="genreSliceOfLife"></label>
                                <span class="checkset-text">일상</span>
                            </div>
                            <!-- 추리 장르 -->
                            <div class="checkset">
                                <input id="genreMystery" class="checkset-input input-fill" type="checkbox" name="genre" value="추리" onclick="handleGenreCheckboxClick(this)">
                                <label class="checkset-label" for="genreMystery"></label>
                                <span class="checkset-text">추리</span>
                            </div>
                            <!-- 스릴러 장르 -->
                            <div class="checkset">
                                <input id="genreThriller" class="checkset-input input-fill" type="checkbox" name="genre" value="스릴러" onclick="handleGenreCheckboxClick(this)">
                                <label class="checkset-label" for="genreThriller"></label>
                                <span class="checkset-text">스릴러</span>
                            </div>
                            <!-- 무협 장르 -->
                            <div class="checkset">
                                <input id="genreMartialArts" class="checkset-input input-fill" type="checkbox" name="genre" value="무협" onclick="handleGenreCheckboxClick(this)">
                                <label class="checkset-label" for="genreMartialArts"></label>
                                <span class="checkset-text">무협</span>
                            </div>
                            <!-- 기타 장르 -->
                            <div class="checkset">
                                <input id="genreOthers" class="checkset-input input-fill" type="checkbox" name="genre" value="기타" onclick="handleGenreCheckboxClick(this)">
                                <label class="checkset-label" for="genreOthers"></label>
                                <span class="checkset-text">기타</span>
                            </div>
                        </div>
                        <div id="genreMessage" style="color: red;"></div>
                    </div>

                    <div class="inputset inputset-lg inputset-label">
                        <!-- 작가노트 입력 필드 -->
                        <label>
                            <h6 class="inputset-tit">작가노트</h6>
                            <textarea class="inputset-textarea" id="note" name="note" placeholder="작가의 상태나 작품에 대한 내용을 입력해주세요." maxlength="100" required=""></textarea>
                            <div id="noteCount">글자 수: 0/100</div>
                        </label>

                        <!-- 작품소개 입력 필드 -->
                        <label>
                            <h6 class="inputset-tit">작품소개<span>*</span></h6>
                            <textarea class="inputset-textarea" id="workDesc" name="workDesc" placeholder="작품을 소개해주세요." maxlength="400" required=""></textarea>
                            <div id="charCount">글자 수: 0/400</div>
                        </label>
                    </div>



                    <!-- 썸네일 업로드 영역 -->
                    <div class="inputset inputset-lg inputset-group" for="thumbnailFile">
                        <label class="labelset" for="workName">
                            <h6 class="labelset-tit">썸네일<span>*</span>
                            </h6>
                        </label>
                        <div id="dropArea" class="drop-area">
                            <div id="image_container"><img src="..\khs\images\popcorn.jpg" alt="" width="150" height="200" placeholder="이미지가 여기에 나타납니다."></div>
                            <span class="drop-text"></span>
                            <input type="file" class="check-image" id="thumbnailFile" name="thumbnailFile" accept="image/jpeg" onchange="setThumbnail(event)" required/>
                            <ul id="fileList" class="file-list"></ul>
                        </div>
                    </div>
                    <div id="thumbnailMessage" style="color: green">JPG 이미지를 추가해주세요</div>

                    <!-- 유료/무료 선택 -->
                    <div class="inputset inputset-lg inputset-group">
                        <label class="labelset">
                            <h6 class="labelset-tit">유료/무료 선택<span>*</span>
                            </h6>
                        </label>
                        <div class="radioset-wrap">
                            <div class="radioset">
                                <input id="fap0" class="radioset-input input-line" name="fap" type="radio" value="0" checked="">
                                <label class="radioset-thumb thumb-round" for="fap0">무료</label>
                            </div>
                            <div class="radioset">
                                <input id="fap1" class="radioset-input input-line" name="fap" type="radio" value="1">
                                <label class="radioset-thumb thumb-round" for="fap1">유료</label>
                            </div>
                        </div>
                    </div>

                    <!-- 운영사항 동의 체크박스 -->
                    <div class="inputset inputset-lg inputset-label">
                        <label>
                            <h6 class="inputset-tit">운영사항 동의
                                <strong class="labelset-vital">
                                    <span>*</span>
                                </strong></h6>
                            <div class="inputset-board">
                                저작권 등 다른 사람의 권리를 침해하거나 명예를 훼손하는 게시물은 이용약관 및 관련 법률에 의해 제재를 받으실 수 있습니다. 성인물, 폭력물 등의 게시물은 통보 없이 삭제될 수 있습니다.
                            </div>
                        </label>
                    </div>

                    <div class="inputset inputset-lg inputset-label">
                        <div class="checkset">
                            <input id="operationAgreement" class="checkset-input input-fill" type="checkbox" required>
                            <label class="checkset-label" for="operationAgreement"></label>
                        </div>
                        <span class="checkset-text">위 내용을 읽었으며, 내용에 동의합니다.</span>
                    </div>
                    <div id="operationMessage" style="color: red;"></div>

                    <input type="hidden" name="genre1" value="">
                    <input type="hidden" name="genre2" value="">
                    <input type="hidden" name="genre3" value="">

                    <!-- 제출 버튼 -->
                    <div class="bottom-btn">
                        <button class="btnset btnset-lg btnset-dark btnset-rect" type="reset">취소</button>
                        <button class="btnset btnset-lg btnset-dark btnset-rect" type="submit">등록</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</main>


<!-- [S]thwhole-wfLpW5Z3pJ -->
<%--<%@ include file="../layout/footer.jsp" %>--%>
<jsp:include page="../layout/footer.jsp" flush="true"/>
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
        // 유료/무료 선택 변경 이벤트 리스너 추가
        document.querySelectorAll('input[name="fap"]').forEach(function(radio) {
            radio.addEventListener('change', function() {
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

        var genreMessageElement = document.getElementById('genreMessage');
        if (checkedCount > 3) {
            checkbox.checked = false;
            genreMessageElement.textContent = "장르는 최대 3개까지 선택 가능합니다.";
        } else if(checkedCount<1){
            genreMessageElement.textContent = "장르는 최소 1개는 선택하셔야 합니다.";
        }else {
            genreMessageElement.textContent = ""; // 메시지 지우기
        }
    }

    function validateForm() {
        var fileInput = document.getElementById('thumbnailFile');
        var file = fileInput.files[0];
        var thumbnailMessage = document.getElementById('thumbnailMessage');
        var checkboxes = document.getElementsByName("genre");
        var genreMessageElement = document.getElementById('genreMessage');
        var operationMessage = document.getElementById('operationMessage');
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
            genreMessageElement.textContent = "장르는 최소 1개 이상, 최대 3개까지 선택해야 합니다.";
            return false;
        }


        // 파일이 선택되었는지 확인
        if (fileInput.files.length === 0) {
            thumbnailMessage.textContent = '이미지 파일을 선택해주세요.';
            return false; // submit 막기
        }else{
            thumbnailMessage.textContent = '';
        }

        // 이미지 파일 형식 검증
        if (!file.type.match('image/jpeg')) {
            thumbnailMessage.textContent = 'JPG 이미지만 업로드 가능합니다.';
            return false; // form 제출을 막습니다.
        }


        // 선택된 장르 값을 각각의 input에 할당
        document.getElementsByName("genre1")[0].value = genre1;
        document.getElementsByName("genre2")[0].value = genre2;
        document.getElementsByName("genre3")[0].value = genre3;

        var operationCheckbox = document.getElementById('matters');
        if (!operationCheckbox.checked) {
            operationMessage.textContent = "운영사항에 동의해야 합니다.";
            return false; // 제출 막기
        } else {
            operationMessage.textContent = ''; // 메시지 지우기
        }

        return true;
    }

    function setThumbnail(event) {
        var fileInput = event.target;
        var file = fileInput.files[0]; // 선택된 파일
        var thumbnailMessage = document.getElementById('thumbnailMessage');
        var imageContainer = document.getElementById('image_container');

        if (!fileInput.files || !fileInput.files[0]) {
            thumbnailMessage.textContent = 'JPG 이미지를 추가해주세요.';
            return;
        }

        // 파일 유형 및 크기 검증
        if (!file.type.match('image/jpeg')) {
            thumbnailMessage.textContent = 'JPG 이미지만 업로드 가능합니다.';
            fileInput.value = ""; // 파일 입력 초기화
            imageContainer.innerHTML = ""; // 이미지 컨테이너 초기화
            return;
        }

        if (file.size > 5242880) { // 5MB 제한
            thumbnailMessage.textContent = '파일 크기는 5MB를 넘을 수 없습니다.';
            fileInput.value = "";
            imageContainer.innerHTML = "";
            return;
        }

        thumbnailMessage.textContent = ''; // 메시지 초기화
        displayFile(file); // 이미지 미리보기
    }

    // 이미지 미리보기 함수
    function displayFile(file) {
        var reader = new FileReader();
        var thumbnailMessage = document.getElementById('thumbnailMessage');
        reader.onload = function(event) {
            var img = new Image();
            img.src = event.target.result;
            img.style.width = "150px";
            img.style.height = "200px";

            var imageContainer = document.getElementById('image_container');
            imageContainer.innerHTML = ""; // 기존 이미지 제거
            imageContainer.appendChild(img); // 새 이미지 추가
        };
        reader.readAsDataURL(file);
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
        var selectBox = document.getElementById('copylight');
        var buttons = selectBox.getElementsByTagName('button');

        if (status === '1') {
            if (buttons.length <= 1) { // '템플릿을 선택하세요' 버튼을 포함하여 계산
                document.querySelector('input[name="status"][value="0"]').checked = true;
                selectBox.style.display = 'none';
                creationMessage.textContent = '창작을 선택할 수 없습니다. 저작권을 먼저 등록해주세요.';
            } else {
                selectBox.style.display = 'block';
                creationMessage.textContent = '';
                creationMessage.textContent = '';
            }
        } else {
            selectBox.style.display = 'none';
        }
    }

    document.querySelectorAll('input[name="status"]').forEach(function(radio) {
        radio.addEventListener('change', toggleSelectBox);
    });


    function checkWorkName() {
        var workName = $('#workName').val();
        var userId = "${user.userId}";
        if (!workName) {
            // 작품명이 비어있는 경우에 대한 처리
            $('#workNameMessage').text('작품명을 입력해주세요.').css('color', 'red');
            return false; // 여기에 return false를 추가
        }
        $.get( '/work/json/checkWorkName',
            {
                userId: userId,
                workName: workName
            }).done(function (response) {
            var messageDiv = $('#workNameMessage');
            if (response.workName === workName) {
                messageDiv.text('등록된 작품이 있습니다. 다른 작품명으로 적어주세요.');
                messageDiv.css('color', 'red');
            } else {
                messageDiv.text('등록된 작품이 없습니다.');
                messageDiv.css('color', 'green');
                return false;
            }
        })
            .fail(function (){
                console.error('Ajax 요청 실패');
            });
    }

    // 드래그 앤 드롭 이벤트 핸들러
    $('.drop-area').on('drag dragstart dragend dragover dragenter dragleave drop', function(event) {
        event.preventDefault();
        event.stopPropagation();
    }).on('dragover', function(event) {
        $(this).addClass('drag-over');
    }).on('dragleave dragend drop', function(event) {
        $(this).removeClass('drag-over');
    }).on('drop', function(event) {
        var file = event.originalEvent.dataTransfer.files[0];
        $("#thumbnailFile").prop("files", event.originalEvent.dataTransfer.files); // 입력 필드에 파일 설정
        setThumbnail({ target: { files: [file] } }); // 이미지 처리
    });
</script>

</html>
