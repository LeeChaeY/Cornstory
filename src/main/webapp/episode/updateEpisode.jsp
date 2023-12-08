<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
    <title>작품 회차 추가</title>
</head>
<body>

<h2>작품 회차 추가</h2>

<form action="../episode/updateEpisode" method="post" enctype="multipart/form-data">

    <div class="info-item">카테고리:
        <c:choose>
            <c:when test="${work.category eq '0'}">웹소설</c:when>
            <c:when test="${work.category eq '1'}">웹툰</c:when>
            <c:when test="${work.category eq '2'}">웹드라마</c:when>
            <c:otherwise>기타</c:otherwise>
        </c:choose>
    </div>
    <div class="info-item">작품명: ${work.workName}</div>

    <input type="hidden" id="episodeNo" name="episodeNo" value="${episode.episodeNo}" />

    <input type="hidden" id="workNo" name="workNo" value="${episode.workNo}" />

    <!-- 작품 회차순서 입력 -->
    <label for="episodeOrder">작품 회차:</label>
    <div>
        <input type="number" id="episodeOrder" name="episodeOrder" min="1" required readonly value="${episode.episodeOrder}"/>
    </div>

    <!-- 작품 회차명 입력 -->
    <label for="episodeName">회차명:</label>
    <div>
        <input type="text" id="episodeName" name="episodeName" value="${episode.episodeName}" required />
    </div>

    <!-- 작품 회차 대표이미지 업로드 -->
    <label for="thumbnailFile">작품 회차 이미지 (오직 이미지만):</label>
    <div>
        <input type="file" name="thumbnailFile" id="thumbnailFile" onchange="setThumbnailPreview(event);" accept=".jpg" />
    </div>
    <div id="thumbnailPreviewContainer">
        <img src="${episode.thumbnail}" alt="Thumbnail" style="max-width: 300px; max-height: 300px; display: block;">
    </div>
    <br/>
    <br/>
    <br/>
    <!-- 파일 업로드를 위한 추가적인 필드들 -->
    <label for="episodeFile">회차 등록 파일:</label>
    <div>
        <c:choose>
            <c:when test="${work.category eq '0'}"> <!-- 웹소설인 경우 -->
                <input type="file" name="episodeFile" id="episodeFile" accept=".txt" required onchange="readTextFilePreview(this);"  />
                <span>텍스트 파일(.txt)을 업로드해주세요.</span>
                <div id="textPreviewContainer">${episode.directory}${episode.fileName}</div>
            </c:when>
            <c:when test="${work.category eq '1'}"> <!-- 웹툰인 경우 -->
                <input type="file" name="episodeFile" id="episodeFile" accept=".jpg" required onchange="setImagePreview(this);" value="${episode.directory + episode.fileName}"/>
                <span>이미지 파일(.jpg)을 업로드해주세요.</span>
                <div id="imagePreviewContainer"><img src="<c:out value='${episode.directory}${episode.fileName}' />" alt="webToon" style="max-width: 300px; max-height: 300px; display: block;"></div>
            </c:when>
            <c:when test="${work.category eq '2'}"> <!-- 웹드라마인 경우 -->
                <input type="file" name="episodeFile" id="episodeFile" accept=".mp4" required onchange="setVideoPreview(this);" value="${episode.directory + episode.fileName}"/>
                <span>영상 파일(.mp4)을 업로드해주세요.</span>
                <div id="videoPreviewContainer">
                    <video controls width="300">
                        <source src="${episode.directory}${episode.fileName}" type="video/mp4">
                        Your browser does not support the video tag.
                    </video>
                </div>
            </c:when>
        </c:choose>
    </div>

    <br/>
    <br/>
    <br/>
    <button type="submit">회차 수정</button>
</form>
</body>
<script>
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
