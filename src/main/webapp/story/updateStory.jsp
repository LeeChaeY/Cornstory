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
<main class="th-layout-main ">
    <!-- [S]hooms-N39 -->
    <div class="hooms-N39" data-bid="csLqpM814f" id="">
        <div class="contents-inner">
            <div class="contents-container container-md">
                <div class="textset textset-h2">
                    <h2 class="textset-tit">스토리 수정</h2>
                </div>
                <form action="../story/updateStory" method="post" enctype="multipart/form-data">
                    <input type="hidden" name="userId" value="${user.userId}"/>
                    <input type="hidden" name="storyNo" id="storyNo" value="${story.storyNo}"/>
                    <div class="contents-form">
                        <div class="contents-form-middle">
                            <div class="inputset inputset-lg inputset-label">
                                <label>
                                    <h6 class="inputset-tit">스토리 이름</h6>
                                    <input type="text" class="inputset-input form-control" placeholder="스토리 이름을 입력해주세요." id="storyName" name="storyName" value="${story.storyName}" required>
                                </label>
                            </div>
                            <div class="inputset inputset-lg inputset-label">
                                <label>
                                    <h6 class="inputset-tit">스토리 내용</h6>
                                    <textarea class="inputset-textarea" placeholder="스토리 내용을 입력해주세요." id="storyContent" name="storyContent" required>${story.storyContent}</textarea>
                                    <div class="inputset-langth">
                                        <span class="inputset-count">0</span>
                                        <span class="inputset-total">/300</span>
                                    </div>
                                </label>
                            </div>
                            <div class="fileset fileset-lg fileset-label">
                                <label>
                                    <h6 class="fileset-tit"> 첨부파일
                                    </h6>
                                    <div class="fileset-body">
                                        <div class="fileset-group">
                                            <input type="file" class="fileset-input" name="thumbnailFile" id="thumbnailFile" onchange="setThumbnail(event);" accept=".jpg">
                                            <button class="fileset-cancel"></button>
                                        </div>
                                        <div id="image_container">
                                            <c:if test="${not empty story.storyImage}">
                                                <img src="${story.storyImage}" style="max-width: 300px; max-height: 300px; display: block;"/>
                                            </c:if>
                                        </div>
                                        <span class="btnset btnset-line btnset-lg fileset-upload">파일 첨부하기</span>
                                    </div>
                                </label>
                            </div>
                        </div>
                        <div class="contents-sign">
                            <button class="btnset modalset-btn" >수정</button>
                            <button class="btnset modalset-btn" onclick="window.location='/story/listStory'">취소</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <!-- [E]hooms-N39 -->
</main>

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
<script src="../common/js/setting.js"></script>
<script src="../common/js/plugin.js"></script>
<script src="../common/js/template.js"></script>
<script src="../common/js/common.js"></script>
<script src="../common/js/script.js"></script>
<%--<script src="../support/js/support.js"></script>--%>
<%--<script src="/common/js/drag.js"></script>--%>
<%@ include file="../layout/bottom.jsp" %>