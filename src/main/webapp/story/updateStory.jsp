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
        .th-layout-main {
            display: flex;
            justify-content: center; /* 가로 방향으로 가운데 정렬 */
            align-items: center; /* 세로 방향으로 가운데 정렬 */
            min-height: 100vh; /* 화면의 전체 높이를 채움 */
        }

        .content-container {
            width: 100%; /* 혹은 원하는 최대 너비 설정 */
            max-width: 600px; /* 컨테이너의 최대 너비 제한 */
            padding: 20px; /* 내부 여백 */
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1); /* 그림자 효과 */
            background: white; /* 배경색 */
            border-radius: 8px; /* 모서리 둥글게 */
        }
    </style>
    <%--    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>--%>
</head>
<body>

<!--top start-->
<%@ include file="../layout/top.jsp" %>
<!--top end-->

<main class="th-layout-main">
    <div class="opilsol-N24" data-bid="raLq4sT3lu">
        <div class="content-container">
            <div class="contents-form container-md">
                <h2 class="textset-tit">스토리 수정</h2>
                <form action="/story/updateStory" method="post" enctype="multipart/form-data">
                    <input type="hidden" name="userId" value="${user.userId}"/>

                    <div class="form-group">
                        <label for="storyName">스토리 이름:</label>
                        <input type="text" class="form-control" id="storyName" name="storyName" value="${story.storyName}" required/>
                    </div>

                    <div class="form-group">
                        <label for="storyContent">스토리 내용:</label>
                        <textarea class="form-control" id="storyContent" name="storyContent" rows="4" required>${story.storyContent}</textarea>
                    </div>

                    <div class="form-group">
                        <label for="thumbnailFile">이미지 파일:</label>
                        <input type="file" class="form-control-file" name="thumbnailFile" id="thumbnailFile" onchange="setThumbnail(event);" accept=".jpg">
                        <div id="image_container">
                            <c:if test="${not empty story.storyImage}">
                                <img src="${story.storyImage}" style="max-width: 300px; max-height: 300px; display: block;"/>
                            </c:if>
                        </div>
                    </div>

                    <button type="submit" class="btn btn-primary">수정하기</button>
                    <button type="button" class="btn btn-secondary" onclick="window.location='/story/listStory'">취소</button>
                </form>
            </div>
        </div>
    </div>
</main>

<!-- 하단 푸터 -->
<%@ include file="../layout/bottom.jsp" %>

</body>
<script>
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
</script>
</html>
