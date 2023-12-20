<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html>
<head>
    <title>cornstory</title>
    <link rel="stylesheet" href="/ssh/css/setting.css">
    <link rel="stylesheet" href="/ssh/css/plugin.css">
    <link rel="stylesheet" href="/ssh/css/template.css">
    <link rel="stylesheet" href="/ssh/css/common.css">
    <link rel="stylesheet" href="/ssh/css/style.css">
    <meta charset="utf-8">
    <style>
        /* 기본 스타일 설정 */
        :root {
            --primary-color: #0056b3;
            --secondary-color: #e9ecef;
            --text-color: #333333;
            --background-color: #ffffff;
        }

        body {
            font-family: 'Arial', sans-serif;
            color: var(--text-color);
            background-color: var(--background-color);
        }

        /* 콘텐츠 컨테이너 스타일 */
        .content-container {
            text-align: center;
            margin: 20px 0;
        }

        /* 제목 및 날짜 표시 스타일 */
        .textset-tit, .textset-eu {
            font-size: 24px;
            color: var(--primary-color);
            margin-bottom: 10px;
        }

        /* 에피소드 콘텐츠 스타일 */
        .text-content, .image-content, .video-content {
            margin-top: 20px;
            padding: 15px;
            background: var(--secondary-color);
            border-radius: 5px;
        }

        .image-content img, .video-content video {
            max-width: 100%;
            height: auto;
            border-radius: 4px;
        }

        /* 댓글 섹션 스타일링 */
        #commentForm, #commentList {
            margin-top: 20px;
            padding: 15px;
            background: var(--secondary-color);
            border-radius: 5px;
        }

        #commentForm textarea {
            width: 100%;
            margin-bottom: 10px;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
        }

        #commentList div {
            margin-bottom: 15px;
            padding: 10px;
            background: #f8f9fa;
            border: 1px solid #ddd;
            border-radius: 4px;
        }

        #commentList strong {
            font-weight: bold;
        }

        /* 반응형 디자인 */
        @media screen and (max-width: 768px) {
            .textset-tit, .textset-eu {
                font-size: 20px;
            }
        }

    </style>
</head>

<!--top start-->
<%@ include file="../layout/top.jsp" %>
<!--top end-->

<main class="th-layout-main ">

    <div class="opilsol-N34" data-bid="Dklq5i7YYR" >
        <div class="content-container container-md">
            <div class="textset content-tit">
                <h4 class="h4">${work.workName} | ${episode.episodeOrder}</h4>
                <h2 class="textset-tit">${episode.episodeName}</h2>
                <p class="textset-eu"><fmt:formatDate value="${episode.episodeDate}" pattern="yyyy-MM-dd HH:mm:ss"/></p>
            </div>
        </div>
    </div>

    <div class="opilsol-N17" data-bid="GkLq5I7z1g">
        <div class="content-container">
            <c:choose>

                <c:when test="${work.category eq '0'}">
                    <div class="text-content">
                        <p>${textContent}</p>
                    </div>
                </c:when>


                <c:when test="${work.category eq '1'}">
                    <div class="image-content">
                        <img src="${files}" alt="Episode Image" style="max-width: 300px; max-height: 300px; display: block;">
                    </div>
                </c:when>


                <c:when test="${work.category eq '2'}">
                    <div class="video-content">
                        <video controls style="width: 100%; height: auto;">
                            <source src="${files}" type="video/mp4">
                            브라우저가 비디오를 지원하지 않습니다.
                        </video>
                    </div>
                </c:when>
            </c:choose>
        </div>
    </div>

    <!-- 다른 섹션들 -->

    <div class="opilsol-N22" data-bid="QklQ5i7Z5J">
        <div class="content-container">
            <div class="container-md">
                <h4 class="h4">댓글란</h4>
                <div id="commentForm">
                    <input type="hidden" id="episodeNo" value="${episode.episodeNo}">
                    <textarea id="commentContent" placeholder="댓글을 입력하세요"></textarea>
                    <button type="button" onclick="addComment()">댓글 추가</button>
                </div>
                <h3>댓글 목록</h3>
                <div id="commentList">
                    <!-- 댓글 목록이 여기에 동적으로 로드됩니다. -->
                </div>
            </div>
        </div>
    </div>
</main>

<%@ include file="../layout/bottom.jsp" %>

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
            success: function () {
                loadComments();
                document.getElementById("commentContent").value = ''; // 댓글 입력란 초기화
            },
            error: function () {
                alert("댓글 추가 실패");
            }
        });
    }

    // 댓글 목록을 서버에서 가져와서 화면에 표시하는 함수
    function loadComments() {
        var episodeNo = document.getElementById("episodeNo").value;

        $.ajax({
            type: "GET",
            url: "/episode/json/listComment",
            data: {episodeNo: episodeNo},
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
        var loggedInUserId = "${user.userId}";
        var commentListElement = document.getElementById("commentList");
        commentListElement.innerHTML = ""; // 댓글 목록 초기화

        comments.forEach(function (comment) {
            var listItem = document.createElement("div");
            if(loggedInUserId === comment.userId){
                listItem.innerHTML =
                    '<div>' +
                    '<strong>' + comment.userId + '</strong> ' +
                    '<span>' + comment.commentDate + '</span>' +
                    '</div>' +
                    '<p>' + comment.content + '</p>'+
                    '<button onclick="openModal(\'' + comment.commentNo + '\', \'' + escapeHtml(comment.content) + '\')">수정</button>' +
                    '<button onclick="deleteComment(\'' + comment.commentNo + '\')">삭제</button>';

            }else{
                listItem.innerHTML =
                    '<div>' +
                    '<strong>' + comment.userId + '</strong> ' +
                    '<span>' + comment.commentDate + '</span>' +
                    '</div>' +
                    '<p>' + comment.content + '</p>';
            }

            commentListElement.appendChild(listItem);
        });

        if (comments.length === 0) {
            commentListElement.innerHTML = "<p>아직 댓글 내역이 없습니다.</p>";
        }
    }

    // HTML 태그를 escape 하는 함수
    function escapeHtml(unsafe) {
        return unsafe
            .replace(/&/g, "&amp;")
            .replace(/</g, "&lt;")
            .replace(/>/g, "&gt;")
            .replace(/"/g, "&quot;")
            .replace(/'/g, "&#039;");
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
            success: function () {
                loadComments(); // 댓글 목록 다시 로드
                closeModal('commentModal_' + commentNo); // 모달 닫기
            },
            error: function () {
                alert("댓글 수정 실패");
            }
        });
    }

    // 댓글 삭제
    function deleteComment(commentNo) {
        if(confirm("댓글을 삭제하시겠습니까?")) {
            $.ajax({
                type: "POST",
                url: "/episode/json/deleteComment",
                contentType: "application/json",
                data: JSON.stringify({
                    commentNo: commentNo
                }),
                success: function () {
                    loadComments(); // 댓글 목록 다시 로드
                },
                error: function () {
                    alert("댓글 삭제 실패");
                }
            });
        }
    }
    var loggedIn = ${not empty user};
    if (loggedIn) {
        document.getElementById("commentForm").style.display = "block";
    } else {
        document.getElementById("commentForm").style.display = "none";
        document.getElementById("commentForm").text("로그인 후 댓글을 이용해 주세요");
    }
</script>

</html>
