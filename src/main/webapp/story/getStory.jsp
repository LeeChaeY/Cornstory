<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>List of Stories</title>
    <style>
        .story-container {
            border: 1px solid #ccc;
            margin-bottom: 20px;
            padding: 10px;
        }

        .comment-form,
        .comment-list {
            margin-top: 10px;
            display: none;
        }

        .comment-item {
            border: 1px solid #eee;
            margin-top: 10px;
            padding: 10px;
        }
    </style>
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
</head>
<body>

<h2>스토리 목록</h2>
<a href="/story/add">스토리 추가</a>

<c:if test="${not empty story}">
    <c:forEach var="story" items="${story}">
        <div class="story-container">
            <strong>User ID:</strong> ${story.userId}<br>
            <strong>Story Name:</strong> ${story.storyName}<br>
            <strong>Story Image:</strong> ${story.storyImage}<br>
            <strong>Story Content:</strong> ${story.storyContent}<br>
            <strong>Story Date:</strong> ${story.storyDate}<br>

            <a href="/story/updateStory?storyNo=${story.storyNo}">수정</a>
            |
            <form action="/story/deleteStory" method="post" id="deleteForm_${story.storyNo}">
                <input type="hidden" name="storyNo" value="${story.storyNo}">
                <a href="#" onclick="confirmAndSubmit(${story.storyNo})">삭제</a>
            </form>
            |
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

<br/>

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

</body>
</html>
