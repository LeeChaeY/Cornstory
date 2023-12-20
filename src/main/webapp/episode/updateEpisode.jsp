<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
    <title>cornstory</title>
    <link rel="stylesheet" href="/ssh/css/setting.css">
    <link rel="stylesheet" href="/ssh/css/plugin.css">
    <link rel="stylesheet" href="/ssh/css/template.css">
    <link rel="stylesheet" href="/ssh/css/common.css">
    <link rel="stylesheet" href="/ssh/css/style.css">
    <style>
        /* 기본 스타일 재정의 */
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        .content-container {
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .textset-tit {
            text-align: center;
            color: #333;
            margin-bottom: 20px;
        }

        .inputset-label {
            font-weight: bold;
            display: block;
            margin-bottom: 5px;
        }

        .inputset-input, .inputset-textarea {
            width: 100%;
            padding: 8px;
            margin-bottom: 20px;
            border: 1px solid #ddd;
            border-radius: 4px;
            box-sizing: border-box;
        }

        .inputset-group {
            margin-bottom: 20px;
        }

        .bottom-btn {
            text-align: center;
        }

        .btnset {
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            background-color: #0056b3;
            color: white;
            cursor: pointer;
            margin-right: 10px;
        }



        .checkset-label {
            cursor: pointer;
        }

        .checkset-text {
            margin-left: 20px;
            vertical-align: top;
        }

        #thumbnailPreviewContainer img,
        #imagePreviewContainer img,
        #videoPreviewContainer video {
            max-width: 100%;
            height: auto;
            margin-top: 10px;
        }
    </style>

    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
</head>
<body>

<!--top start-->
<%@ include file="../layout/top.jsp" %>
<!--top end-->

<h2>작품 회차 추가</h2>

<main class="th-layout-main">
    <!-- [S]opilsol-N31 -->
    <div class="opilsol-N31" data-bid="Jo2cLR2NPB1">
        <div class="content-container">
            <div class="textset content-top">
                <div class="container-md">
                    <h2 class="textset-tit">작품 회차 수정</h2>
                </div>
            </div>
            <div class="contents-form">
                <form action="../episode/updateEpisode" method="post" enctype="multipart/form-data">
                    <!-- 카테고리 정보 -->
                    <div class="inputset inputset-lg inputset-group">
                        <label class="inputset-label">카테고리</label>
                        <p class="h5">
                            <c:choose>
                                <c:when test="${work.category eq '0'}">웹소설</c:when>
                                <c:when test="${work.category eq '1'}">웹툰</c:when>
                                <c:when test="${work.category eq '2'}">웹드라마</c:when>
                                <c:otherwise>기타</c:otherwise>
                            </c:choose>
                        </p>
                    </div>

                    <!-- 작품명 정보 -->
                    <div class="inputset inputset-lg inputset-group">
                        <label class="inputset-label" for="workName">작품명</label>
                        <input type="text" id="workName" name="workName" class="inputset-input form-control" value="${work.workName}" readonly>
                    </div>

                    <!-- 회차 순서 -->
                    <div class="inputset inputset-lg inputset-group">
                        <label class="inputset-label" for="episodeOrder">회차 순서</label>
                        <input type="number" id="episodeOrder" name="episodeOrder" class="inputset-input form-control" value="${episode.episodeOrder}" readonly>
                    </div>

                    <!-- 회차명 입력 -->
                    <div class="inputset inputset-lg inputset-group">
                        <label class="inputset-label" for="episodeName">회차명</label>
                        <input type="text" id="episodeName" name="episodeName" class="inputset-input form-control" value="${episode.episodeName}" required>
                    </div>

                    <!-- 회차 대표 썸네일 업로드 -->
                    <div class="inputset inputset-lg inputset-group">
                        <label class="inputset-label" for="thumbnailFile">회차 대표 썸네일</label>
                        <input type="file" name="thumbnailFile" id="thumbnailFile" accept="image/*">
                        <div id="thumbnailPreviewContainer">
                            <img src="${episode.thumbnail}" alt="Thumbnail" style="max-width: 300px; max-height: 300px; display: block;">
                        </div>
                    </div>

                    <!-- 파일 업로드 필드 -->
                    <div class="inputset inputset-lg inputset-group">
                        <label class="inputset-label" for="episodeFile">회차 등록 파일</label>
                        <c:choose>
                            <c:when test="${work.category eq '0'}">
                                <input type="file" name="episodeFile" id="episodeFile" accept=".txt" onchange="readTextFilePreview(this);">
                                <div id="textPreviewContainer">${episode.directory}${episode.fileName}</div>
                            </c:when>
                            <c:when test="${work.category eq '1'}">
                                <input type="file" name="episodeFile" id="episodeFile" accept=".jpg" onchange="setImagePreview(this);">
                                <div id="imagePreviewContainer"><img src="<c:out value='${episode.directory}${episode.fileName}' />" alt="webToon" style="max-width: 300px; max-height: 300px; display: block;"></div>
                            </c:when>
                            <c:when test="${work.category eq '2'}">
                                <input type="file" name="episodeFile" id="episodeFile" accept=".mp4" onchange="setVideoPreview(this);">
                                <div id="videoPreviewContainer">
                                    <video controls width="300">
                                        <source src="${episode.directory}${episode.fileName}" type="video/mp4">
                                        Your browser does not support the video tag.
                                    </video>
                                </div>
                            </c:when>
                        </c:choose>
                    </div>

                    <!-- 운영 원칙 동의 체크박스 -->
                    <div class="inputset inputset-lg inputset-group">
                        <label class="inputset-label">운영 원칙 동의</label>
                        <div class="checkset checkset-sm">
                            <input id="matters" class="checkset-input input-round" type="checkbox" name="termsAgreement" onsubmit="return validateForm()">
                            <label class="checkset-label" for="matters"></label>
                            <span class="checkset-text" style="font-size: 12px; line-height: 1.5; overflow: auto;">
                                불법 게시물을 등록할 경우, 게시 중단 및 삭제될 수 있으며 형사 처분 대상이 될 수 있습니다.
                            </span>
                        </div>
                    </div>
                    <div id="termsError" style="color: red; display: none;">운영 원칙에 동의해야 합니다.</div>

                    <!-- 제출 버튼 -->
                    <div class="bottom-btn">
                        <button type="submit" class="btnset btnset-lg btnset-dark">회차 수정</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <!-- [E]opilsol-N31 -->
</main>


<%@ include file="../layout/bottom.jsp" %>

</body>
<script>

    function validateForm() {
        // 운영 원칙 동의 체크박스 검사
        var termsAgreement = document.getElementById('matters');
        var termsError = document.getElementById('termsError');
        if (!termsAgreement.checked) {
            termsError.style.display = 'block';
            return false;
        }else{
            termsError.style.display = 'none';
        }

        return true; // 모든 검증 통과 시
    }

    // 이미지 미리보기 함수
    function setThumbnailPreview(event) {
        var fileInput = event.target;
        var fileName = fileInput.value.toLowerCase();

        if (!fileInput.files || !fileInput.files[0]) {
            return;
        }

        if (!fileName.endsWith('.jpg')) {
            alert('jpg 파일만 됩니다');
            fileInput.value = "";
            return;
        }

        var reader = new FileReader();

        reader.onload = function (event) {
            var thumbnailPreviewContainer = document.getElementById('thumbnailPreviewContainer');
            thumbnailPreviewContainer.innerHTML = "";

            var img = document.createElement("img");
            img.setAttribute("src", event.target.result);
            img.setAttribute("class", "col-lg-6");

            img.style.maxWidth = "300px";
            img.style.maxHeight = "300px";
            img.style.display = "block";

            thumbnailPreviewContainer.appendChild(img);
        };

        reader.readAsDataURL(event.target.files[0]);
    }

    // 이미지 파일 업로드 input에 이벤트 리스너 추가
    document.getElementById("thumbnailFile").addEventListener("change", setThumbnailPreview);

    // 텍스트 파일 미리보기 함수
    function readTextFilePreview(fileInput) {
        var file = fileInput.files[0];
        var fileName = fileInput.value.toLowerCase();

        if (!file || !fileName.endsWith('.txt')) {
            alert('txt 파일만 업로드 가능합니다.');
            fileInput.value = "";
            return;
        }

        var reader = new FileReader();

        reader.onload = function (e) {
            var textPreviewContainer = document.getElementById('textPreviewContainer');
            textPreviewContainer.textContent = e.target.result;
        };

        reader.readAsText(file);
    }

    // 이미지 파일 미리보기 함수
    function setImagePreview(fileInput) {
        var fileName = fileInput.value.toLowerCase();

        if (!fileInput.files || !fileInput.files[0]) {
            return;
        }

        if (!fileName.endsWith('.jpg')) {
            alert('jpg 파일만 업로드 가능합니다.');
            fileInput.value = "";
            return;
        }

        var reader = new FileReader();

        reader.onload = function (event) {
            var imagePreviewContainer = document.getElementById('imagePreviewContainer');
            imagePreviewContainer.innerHTML = "";

            var img = document.createElement("img");
            img.setAttribute("src", event.target.result);
            img.setAttribute("class", "col-lg-6");

            img.style.maxWidth = "300px";
            img.style.maxHeight = "300px";
            img.style.display = "block";

            imagePreviewContainer.appendChild(img);
        };

        reader.readAsDataURL(fileInput.files[0]);
    }

    // 비디오 파일 미리보기 함수
    function setVideoPreview(fileInput) {
        var fileName = fileInput.value.toLowerCase();

        if (!fileInput.files || !fileInput.files[0]) {
            return;
        }

        if (!fileName.endsWith('.mp4')) {
            alert('mp4 파일만 업로드 가능합니다.');
            fileInput.value = "";
            return;
        }

        var reader = new FileReader();

        reader.onload = function (event) {
            var videoPreviewContainer = document.getElementById('videoPreviewContainer');
            videoPreviewContainer.innerHTML = "";

            var video = document.createElement("video");
            video.setAttribute("controls", "");
            video.style.maxWidth = "300px";

            var source = document.createElement("source");
            source.setAttribute("src", event.target.result);
            source.setAttribute("type", "video/mp4");

            video.appendChild(source);
            videoPreviewContainer.appendChild(video);
        };

        reader.readAsDataURL(fileInput.files[0]);
    }

    // 파일 업로드 input에 이벤트 리스너 추가
    document.getElementById("episodeFile").addEventListener("change", function () {
        var category = "${work.category}"; // JSP에서 카테고리 값을 가져옵니다.

        switch (category) {
            case '0': // 웹소설인 경우
                readTextFilePreview(this); // 텍스트 파일 업로드인 경우
                break;
            case '1': // 웹툰인 경우
                setImagePreview(this); // 이미지 파일 업로드인 경우
                break;
            case '2': // 웹드라마인 경우
                setVideoPreview(this); // 동영상 파일 업로드인 경우
                break;
            default:
                break;
        }
    });
</script>
</html>
