<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
    <title>cornstory</title>
    <link rel="stylesheet" href="../common/css/setting.css">
    <link rel="stylesheet" href="../common/css/plugin.css">
    <link rel="stylesheet" href="../common/css/template.css">
    <link rel="stylesheet" href="../common/css/common.css">
    <link rel="stylesheet" href="../common/css/style.css">
    <link rel="stylesheet" href="../common/css/drag.css">
    <link rel="stylesheet" href="../support/css/setting.css">
    <link rel="stylesheet" href="../support/css/plugin.css">
    <link rel="stylesheet" href="../support/css/template.css">
    <link rel="stylesheet" href="../support/css/common.css">
    <link rel="stylesheet" href="../support/css/style.css">
    <link rel="stylesheet" href="../khs/css/style.css">
    <link rel="stylesheet" href="../khs/css/common.css">


    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
</head>
<!--top start-->
<%@ include file="../layout/top.jsp" %>
<!--top end-->
<body>
<main class="th-layout-main">
    <div class="thpart-HmlqLtFlNZ" data-bid="HmlqLtFlNZ">
        <div class="contents-container">
            <img class="contents-backimg" src="../khs/images/work.jpg" alt="">
            <div class="contents-body container-md">
                <h2 class="contents-title"> Work </h2>
                <h7 class="contents-sub">작품</h7>
            </div>
        </div>
    </div>

    <!-- [S]hooms-N39 -->
    <div class="hooms-N39" data-bid="xYLQKo7uat">
        <div class="contents-inner">
            <div class="contents-container container-md">
                <div class="textset textset-h2">
                    <h2 class="textset-tit"><c:choose>
                        <c:when test="${work.category eq '0'}">웹소설</c:when>
                        <c:when test="${work.category eq '1'}">웹툰</c:when>
                        <c:when test="${work.category eq '2'}">웹드라마</c:when>
                    </c:choose> 회차 수정
                    </h2>
                </div>
                <div class="tabset tabset-brick">
                </div>
                <div class="contents-form">
                    <form action="../episode/updateEpisode" method="post" enctype="multipart/form-data" onsubmit="return validateForm()">
                        <input type="hidden" name="workNo" value="${work.workNo}" />
                        <div class="contents-form-middle">
                            <div class="inputset inputset-lg inputset-label">
                                <label>
                                    <h6 class="inputset-tit"> 작품명</h6>
                                    <span>${work.workName}</span>
                                </label>
                            </div>
                            <div class="inputset inputset-lg inputset-label">
                                <label>
                                    <h6 class="inputset-tit"> 회차명<span>*</span>
                                    </h6>
                                    <input type="text" class="inputset-input form-control" id="episodeName" name="episodeName"  value="${work.workName}" required>
                                </label>
                                <label>
                                    <h6 class="inputset-tit"> 회차 순서<span>*</span>
                                    </h6>
                                    <input type="number" id="episodeOrder" name="episodeOrder" class="inputset-input form-control" aria-label="회차순서" value="${episode.episodeOrder}" readonly>
                                </label>
                            </div>
                            <div class="fileset fileset-lg fileset-label">
                                <label>
                                    <h6 class="fileset-tit"> 회차 대표 썸네일<span>*</span></h6>
                                    <div class="fileset-body">
                                        <div class="fileset-group">
                                            <input type="file" class="fileset-input" name="thumbnailFile" id="thumbnailFile" accept=".jpg" onchange="setThumbnailPreview(event);" accept=".jpg" required>
                                            <div id="thumbnailPreviewContainer">
                                                <img src="${episode.thumbnail}" alt="Thumbnail" style="max-width: 300px; max-height: 300px; display: block;">
                                            </div>
                                            <button class="fileset-cancel"></button>
                                        </div>
                                        <span class="btnset btnset-line btnset-lg fileset-upload">파일 첨부하기</span>
                                    </div>
                                </label>
                            </div>
                            <div class="fileset fileset-lg fileset-label">
                                <label>
                                    <h6 class="fileset-tit"> 회차 등록 파일<span>*</span></h6>
                                    <div class="fileset-body">
                                        <div class="fileset-group">
                                            <c:choose>
                                                <c:when test="${work.category eq '0'}">
                                                    <input type="file" class="fileset-input" name="episodeFile" id="episodeFile" accept=".txt" required onchange="readTextFilePreview(this);" />
                                                    <button class="fileset-cancel"></button>
                                                    <span class="btnset btnset-line btnset-lg fileset-upload">파일 첨부하기</span>
                                                    <div id="textPreviewContainer" style="white-space: pre-wrap; margin: 0 auto; width: 690px; height: 1000px; display: block;">${file}</div>
                                                </c:when>
                                                <c:when test="${work.category eq '1'}">
                                                    <input type="file" class="fileset-input" name="episodeFile" id="episodeFile" accept=".jpg" required onchange="setImagePreview(this);" />
                                                    <button class="fileset-cancel"></button>
                                                    <span class="btnset btnset-line btnset-lg fileset-upload">파일 첨부하기</span>
                                                    <div id="imagePreviewContainer"><img src="${episode.thumbnail}" alt="Thumbnail" style="max-width: 300px; max-height: 300px; display: block;"></div>
                                                </c:when>
                                                <c:when test="${work.category eq '2'}">
                                                    <input type="file" class="fileset-input" name="episodeFile" id="episodeFile" accept=".mp4" required onchange="setVideoPreview(this);" />
                                                    <button class="fileset-cancel"></button>
                                                    <span class="btnset btnset-line btnset-lg fileset-upload">파일 첨부하기</span>
                                                    <video controls width="300">
                                                        <source src="${episode.directory}${episode.fileName}" type="video/mp4">
                                                        Your browser does not support the video tag.
                                                    </video>
                                                </c:when>
                                            </c:choose>
                                        </div>
                                    </div>
                                </label>
                            </div>
                        </div>
                        <div class="contents-form-bottom">
                            <div class="inputset inputset-lg inputset-label">
                                <label>
                                    <h6 class="inputset-tit">운영 원칙 동의</h6>
                                    <div class="inputset-board"> 불법 게시물을 등록할 경우, 게시 중단 및 삭제될 수 있으며 형사 처분 대상이 될 수 있습니다.
                                    </div>
                                    <div id="termsError" style="color: red; display: none;">운영 원칙에 동의해야 합니다.</div>
                                </label>
                            </div>
                            <div class="checkset">
                                <input id="matters" class="checkset-input input-fill" type="checkbox" value="">
                                <label class="checkset-label" for="matters"></label>
                                <span class="checkset-text">위 내용을 읽었으며, 내용에 동의합니다. (필수)</span>
                            </div>
                        </div>
                        <div class="contents-sign">
                            <button type="reset" class="btnset btnset-lg btnset-dark">취소</button>
                            <button type="submit" class="btnset modalset-btn">수정하기</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <!-- [E]hooms-N39 -->
</main>
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
            setErrorMessage('thumbnailPreviewContainer', 'jpg 파일만 업로드 가능합니다.');
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
            setErrorMessage('textPreviewContainer', 'txt 파일만 업로드 가능합니다.');
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
            setErrorMessage('imagePreviewContainer', 'jpg 파일만 업로드 가능합니다.');
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
            setErrorMessage('videoPreviewContainer', 'mp4 파일만 업로드 가능합니다.');
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
    function setErrorMessage(containerId, message) {
        var container = document.getElementById(containerId);
        container.innerHTML = ''; // 이전 내용 초기화
        var errorMsg = document.createElement('div');
        errorMsg.style.color = 'red';
        errorMsg.textContent = message;
        container.appendChild(errorMsg);
    }
</script>
</html>
<script src="../common/js/setting.js"></script>
<script src="../common/js/plugin.js"></script>
<script src="../common/js/template.js"></script>
<script src="../common/js/common.js"></script>
<script src="../common/js/script.js"></script>
<%--<script src="../support/js/support.js"></script>--%>
<%--<script src="/common/js/drag.js"></script>--%>
<%@ include file="../layout/bottom.jsp" %>