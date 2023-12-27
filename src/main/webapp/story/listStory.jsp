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
        body {
            font-family: Arial, Helvetica, sans-serif;
            background-color: #f5f5f5;
            margin: 0;
            padding: 0;
        }

        h2 {
            text-align: center;
            margin-top: 20px;
            font-size: 24px;
        }

        a {
            text-decoration: none;
            color: #007bff;
        }

        a:hover {
            text-decoration: underline;
        }

        .container-md {
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
        }

        .story-container {
            background: #ffffff;
            border: 1px solid #e1e1e1;
            border-radius: 8px;
            margin-bottom: 20px;
            padding: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }

        .story-container img {
            width: 100%;
            height: auto;
            border-radius: 8px;
            margin-top: 20px;
        }

        .story-container h3 {
            font-size: 24px;
            margin-top: 15px;
        }

        .story-container p {
            font-size: 16px;
            margin-top: 10px;
        }

        .story-container strong {
            font-weight: bold;
            color: #007bff;
        }

        .comments-section {
            background: #f0f0f0;
            padding: 10px;
            border-radius: 8px;
            display: none;
        }

        .comment-item {
            background: white;
            padding: 10px;
            margin: 5px 0;
            border-radius: 4px;
        }

        .comment-item strong {
            font-weight: bold;
        }

        .comment-item span {
            color: #888;
            font-size: 14px;
            margin-left: 10px;
        }

        .comment-item p {
            margin-top: 5px;
        }

        .comment-form textarea {
            width: 100%;
            padding: 10px;
            margin-top: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
        }

        .comment-form button {
            background-color: #007bff;
            color: white;
            border: none;
            padding: 10px 20px;
            margin-top: 10px;
            border-radius: 4px;
            cursor: pointer;
        }

        .modal {
            display: none;
            position: fixed;
            z-index: 1;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.7);
        }

        .modal-content {
            background-color: white;
            margin: 10% auto;
            padding: 20px;
            border-radius: 4px;
            width: 80%;
        }

        .close {
            color: #888;
            float: right;
            font-size: 28px;
            font-weight: bold;
            cursor: pointer;
        }
    </style>
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
</head>
<body>

<!--top start-->
<%@ include file="../layout/top.jsp" %>
<!--top end-->



<h2>스토리 목록</h2>
<main class="th-layout-main">
    <div class="opilsol-N30" data-bid="raLq4sT3lu">
        <div class="content-container">
            <div class="contents-form container-md">
<c:if test="${not empty story}">
    <c:forEach var="story" items="${story}">
        <div class="story-container">
            <strong>User ID:</strong> ${story.userId}<br>
            <strong>Story Name:</strong> ${story.storyName}<br>
            <strong>Story Image:</strong> ${story.storyImage}<br>
            <strong>Story Content:</strong> ${story.storyContent}<br>
            <strong>Story Date:</strong> ${story.storyDate}<br>
            <c:if test="${story.userId} eq ${user.userId}">
            <a href="/story/updateStory?storyNo=${story.storyNo}">수정</a>
            |
            <form action="/story/deleteStory" method="post" id="deleteForm_${story.storyNo}">
                <input type="hidden" name="storyNo" value="${story.storyNo}">
                <a href="#" onclick="confirmAndSubmit(${story.storyNo})">삭제</a>
            </form>
            |
            </c:if>
            <!-- 댓글 보기/숨기기 버튼 -->
            <a href="#" onclick="toggleComments(${story.storyNo})">댓글 보기/숨기기</a>


            <!-- 댓글 폼 -->
            <div class="comment-form" id="commentForm_${story.storyNo}">
                <input type="hidden" id="storyNo_${story.storyNo}" value="${story.storyNo}">
                <textarea id="commentContent_${story.storyNo}" placeholder="댓글을 입력하세요"></textarea>
                <button type="button" onclick="addComment(${story.storyNo})">댓글 추가</button>
            </div>

            <!-- 댓글 목록 -->
            <div class="comment-list" id="commentList_${story.storyNo}"></div>
        </div>
    </c:forEach>
</c:if>
</div>
</div>
</div>
</main>
<br/>
<!-- 하단 푸터 -->
<%@ include file="../layout/bottom.jsp" %>

</body>

<script>
    function confirmAndSubmit(storyNo) {
        var r = confirm("정말로 삭제하시겠습니까?");
        if (r === true) {
            document.getElementById("deleteForm_" + storyNo).submit();
        }
    }

    // 댓글 폼 및 목록 토글
    function toggleComments(storyNo) {
        var commentForm = document.getElementById("commentForm_" + storyNo);
        var commentList = document.getElementById("commentList_" + storyNo);

        if (commentForm.style.display === "none") {
            // 댓글 폼 및 목록을 보이게 하고 댓글 목록을 가져와서 표시
            commentForm.style.display = "block";
            commentList.style.display = "block";
            loadComments(storyNo);
        } else {
            // 댓글 폼 및 목록을 숨김
            commentForm.style.display = "none";
            commentList.style.display = "none";
        }
    }

    // 댓글 추가
    function addComment(storyNo) {
        var content = document.getElementById("commentContent_" + storyNo).value;
        var userId = "${user.userId}";

        $.ajax({
            type: "POST",
            url: "/story/json/addComment",
            contentType: "application/json",
            data: JSON.stringify({
                storyNo: storyNo,
                sContent: content,
                userId: userId
            }),
            success: function () {
                // 댓글 추가 후, 댓글 목록 갱신
                loadComments(storyNo);
            },
            error: function () {
                alert("댓글 추가 실패");
            }
        });
    }

    // 댓글 목록을 서버에서 가져와서 화면에 표시하는 함수
    function loadComments(storyNo) {
        $.ajax({
            type: "GET",
            url: "/story/json/listComments?storyNo=" + storyNo,
            success: function (comments) {
                displayCommentList(comments, storyNo);
            },
            error: function () {
                alert("댓글 목록 불러오기 실패");
            }
        });
    }

    // 댓글 목록을 화면에 표시하는 함수
    function displayCommentList(comments, storyNo) {
        var commentListElement = document.getElementById("commentList_" + storyNo);

        // 기존에 표시된 댓글들을 모두 제거 (초기화)
        if (commentListElement) {
            commentListElement.innerHTML = "";
        }

        // comments 배열을 순회하면서 각 댓글을 화면에 추가
        for (var i = 0; i < comments.length; i++) {
            var comment = comments[i];
            var listItem = document.createElement("div");

            var htmlContent =
                '<div class="comment-item">' +
                '<strong>' + comment.userId + '</strong>' +
                '<span>' + comment.sCommentDate + '</span>' +
                '</div>' +
                '<p>' + comment.sContent + '</p>' +
                '<button onclick="openModal(\'commentModal_' + comment.sCommentNo + '\', \'' + comment.sContent + '\')">수정</button>' +
                '<button onclick="deleteComment(' + comment.sCommentNo + ',' + storyNo + ')">삭제</button>' +

                <!-- 수정 및 삭제 모달 -->
                '<div class="modal" id="commentModal_' + comment.sCommentNo + '" style="display: none;">' +
                '<div class="modal-content">' +
                '<span class="close" onclick="closeModal(\'commentModal_' + comment.sCommentNo + '\')">&times;</span>' +
                '<textarea id="editedContent_' + comment.sCommentNo + '" placeholder="댓글을 수정하세요">' + comment.sContent + '</textarea>' +
                '<button onclick="updateComment(' + comment.sCommentNo + ',' + storyNo + ')">수정</button>' +
                '</div>' +
                '</div>';

            listItem.innerHTML = htmlContent;
            commentListElement.appendChild(listItem);
        }

        if (comments.length === 0) {
            var emptyMessage = document.createElement("p");
            emptyMessage.textContent = "아직 댓글 내역이 없습니다.";
            commentListElement.appendChild(emptyMessage);
        }
    }

    // 댓글 삭제
    function deleteComment(commentNo, storyNo) {
        // AJAX를 사용하여 서버에 댓글 삭제 요청을 보냄 (RESTful API 활용)
        $.ajax({
            type: "POST",
            url: "/story/json/deleteComment",
            contentType: "application/json",
            data: JSON.stringify({
                sCommentNo: commentNo
            }),
            success: function () {
                // 댓글 삭제 후, 댓글 목록 갱신
                loadComments(storyNo);
            },
            error: function () {
                alert("댓글 삭제 실패");
            }
        });
    }
    // 댓글 수정 모달 열기
    function openModal(modalId, content) {
        document.getElementById(modalId).style.display = "block";
        document.getElementById("editedContent_" + modalId).value = content;
    }

    // 댓글 수정 모달 닫기
    function closeModal(modalId) {
        document.getElementById(modalId).style.display = "none";
    }

    // 댓글 수정
    function updateComment(commentNo, storyNo) {
        var editedContent = document.getElementById("editedContent_" + commentNo).value;

        $.ajax({
            type: "POST",
            url: "/story/json/updateComment",
            contentType: "application/json",
            data: JSON.stringify({
                sCommentNo: commentNo,
                sContent: editedContent
            }),
            success: function () {
                // 댓글 수정 후, 댓글 목록 갱신
                loadComments(storyNo);
            },
            error: function () {
                alert("댓글 수정 실패");
            }
        });
    }
</script>
</html>
