<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Add Story</title>
</head>
<body>

<h2>Add Story</h2>

<form method="post" action="/story/addStory" enctype="multipart/form-data">
    <input type="hidden" name="userId" value="${user.userId}"/>
    <label for="storyName">Story Name:</label>
    <input name="storyName" id="storyName" value="${story.storyName}" required/><br/>

    <label for="storyContent">Story Content:</label>
    <textarea name="storyContent" id="storyContent" value="${story.storyContent}" required></textarea><br/>

    <label for="thumbnailFile">Image File:</label>
    <div class="form-group">
        <input class="form-control form-control-user" type="file"
               name="thumbnailFile" id="thumbnailFile" onchange="setThumbnail(event);" accept=".jpg">
    </div>
    <div id="image_container">
        <img src="${story.storyImage}"/>
    </div>

    <br/>
    <input type="submit" value="Submit"/>
    <input type="button" value="Cancel" onclick="window.location='/story/list'"/>
</form>

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
