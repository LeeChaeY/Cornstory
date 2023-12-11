<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
    <title>${work.workName} | ${episode.episodeOrder}화</title>
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
</head>
<body>

<h2>${work.workName} | ${episode.episodeOrder}화 | ${episode.episodeName}</h2>
<div>
    <strong>작품 회차 등록일:</strong> <fmt:formatDate value="${episode.episodeDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
</div>

<c:choose>
    <c:when test="${work.category eq '0'}">
        <div>
            <strong>에피소드 텍스트 내용:</strong>
                ${textContent}
        </div>
    </c:when>

    <c:when test="${work.category eq '1'}">
        <div>
            <strong>에피소드 이미지:</strong>
            <img src="${files}" alt="Episode Image" style="max-width: 300px; max-height: 300px; display: block;">
        </div>
    </c:when>

    <c:when test="${work.category eq '2'}">
        <div>
            <strong>에피소드 영상:</strong>
            <video controls width="300" autoplay="autoplay" muted="muted">
                <source id="mov01" src="${files}" type="video/mp4">
            </video>
        </div>
    </c:when>
</c:choose>

<!-- 댓글 폼 -->
<div id="commentForm">
    <input type="hidden" id="episodeNo" value="${episode.episodeNo}">
    <textarea id="commentContent" placeholder="댓글을 입력하세요"></textarea>
    <button type="button" onclick="addComment()">댓글 추가</button>
</div>
<h3>댓글 목록</h3>
<div id="commentList">
    <c:if test="${not empty list}">
        <c:forEach var="comment" items="${list}">
            <div>
                <strong>${comment.userId}</strong>
                <span>${comment.commentDate}</span>
            </div>
            <p>${comment.content}</p>

            <!-- 수정 및 삭제 버튼 -->
            <button onclick="openModal('${comment.commentNo}', '${comment.content}')">수정</button>
            <button onclick="deleteComment('${comment.commentNo}')">삭제</button>

            <!-- 수정 및 삭제 모달 -->
            <div class="modal" id="commentModal_${comment.commentNo}" style="display: none;">
                <div class="modal-content">
                    <span class="close" onclick="closeModal('commentModal_${comment.commentNo}')">&times;</span>
                    <textarea id="editedContent_${comment.commentNo}" placeholder="댓글을 수정하세요"></textarea>
                    <button onclick="updateComment('${comment.commentNo}')">수정</button>
                </div>
            </div>
        </c:forEach>
    </c:if>
</div>

</body>
<script>
    // 댓글 추가
    function addComment() {
        var episodeNo = document.getElementById("episodeNo").value;
        var content = document.getElementById("commentContent").value;
        var userId = "${user.userId}";
        var workNo = "${work.workNo}";
        console.log(episodeNo+":"+content+":"+userId+":"+workNo);
        $.ajax({
            type: "POST",
            url: "/episode/json/addComment",
            contentType: "application/json",
            data: JSON.stringify({
                episodeNo: episodeNo,
                content: content,
                userId: userId,
                workNo: workNo
            }),
            success: function (comments) {
                loadComments();
            },
            error: function () {
                alert("댓글 추가 실패");
            }
        });
    }

    // 댓글 목록을 서버에서 가져와서 화면에 표시하는 함수
    function loadComments() {
        $.ajax({
            type: "GET",
            url: "/episode/json/listComment",
            success: function (comments) {
                displayCommentList(comments);
            },
            error: function () {
                alert("댓글 목록 불러오기 실패");
            }
        });
    }

    // 페이지 로드 시 댓글 목록을 가져와서 표시
    $(document).ready(function () {
        loadComments();
    });

    // 댓글 목록을 화면에 표시하는 함수
    function displayCommentList(comments) {
        var isEmpty = comments.length === 0;
        var commentListElement = document.getElementById("commentList");

        // 기존에 표시된 댓글들을 모두 제거 (초기화)
        if (commentListElement) {
            commentListElement.innerHTML = "";
        }

        // comments 배열을 순회하면서 각 댓글을 화면에 추가
        for (var i = 0; i < comments.length; i++) {
            var comment = comments[i];
            var listItem = document.createElement("div");

            var htmlContent =
                '<div>' +
                '<strong>' + comment.userId + '</strong>' +
                '<span>' + comment.commentDate + '</span>' +
                '</div>' +
                '<p>' + comment.content + '</p>' +
                '<button onclick="openModal(\'' + comment.commentNo + '\', \'' + comment.content + '\')">수정</button>' +
                '<button onclick="deleteComment(\'' + comment.commentNo + '\')">삭제</button>';

            // 수정 및 삭제 모달 추가
            if (!isEmpty) {
                htmlContent +=
                    '<div class="modal" id="commentModal_' + comment.commentNo + '" style="display: none;">' +
                    '<div class="modal-content">' +
                    '<span class="close" onclick="closeModal(\'commentModal_' + comment.commentNo + '\')">&times;</span>' +
                    '<textarea id="editedContent_' + comment.commentNo + '" placeholder="댓글을 수정하세요"></textarea>' +
                    '<button onclick="updateComment(\'' + comment.commentNo + '\')">수정</button>' +
                    '</div>' +
                    '</div>';
            }

            listItem.innerHTML = htmlContent;
            commentListElement.appendChild(listItem);
        }

        if (isEmpty) {
            var emptyMessage = document.createElement("p");
            emptyMessage.textContent = "아직 댓글 내역이 없습니다.";
            commentListElement.appendChild(emptyMessage);
        }
    }

    // 댓글 수정 모달 열기
    function openModal(commentNo, content) {
        document.getElementById("editedContent_" + commentNo).value = content;
        document.getElementById("commentModal_" + commentNo).style.display = "block";
    }

    // 댓글 수정 모달 닫기
    function closeModal(modalId) {
        document.getElementById(modalId).style.display = "none";
    }


    // 댓글 수정
    function updateComment(commentNo) {
        var editedContent = document.getElementById("editedContent_" + commentNo).value;

        $.ajax({
            type: "POST",
            url: "/episode/json/updateComment",
            contentType: "application/json",
            data: JSON.stringify({
                commentNo: commentNo,
                content: editedContent
            }),
            success: function (comments) {
                // 댓글 수정 후, 화면 갱신
                loadComments();
            },
            error: function () {
                loadComments();
            }
        });
    }

    // 댓글 삭제
    function deleteComment(commentNo) {
        // AJAX를 사용하여 서버에 댓글 삭제 요청을 보냄 (RESTful API 활용)
        // 실제 서버 URL은 프로젝트에 맞게 수정 필요
        console.log(commentNo)
        $.ajax({
            type: "POST",
            url: "/episode/json/deleteComment",
            contentType: "application/json",
            data: JSON.stringify({
                commentNo: commentNo
            }),
            success: function () {
                // 댓글 삭제 후, 화면 갱신
                loadComments();
            },
            error: function () {
                alert("댓글 삭제 실패");
            }
        });
    }
</script>

</html>
