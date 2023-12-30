<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

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
        /*#commentForm, #commentList {*/
        /*    margin-top: 20px;*/
        /*    padding: 15px;*/
        /*    background: var(--secondary-color);*/
        /*    border-radius: 5px;*/
        /*}*/

        /*#commentForm textarea {*/
        /*    width: 100%;*/
        /*    margin-bottom: 10px;*/
        /*    padding: 10px;*/
        /*    border: 1px solid #ddd;*/
        /*    border-radius: 4px;*/
        /*}*/

        /*#commentList div {*/
        /*    margin-bottom: 15px;*/
        /*    padding: 10px;*/
        /*    background: #f8f9fa;*/
        /*    border: 1px solid #ddd;*/
        /*    border-radius: 4px;*/
        /*}*/

        /*#commentList strong {*/
        /*    font-weight: bold;*/
        /*}*/

        /* 반응형 디자인 */
        @media screen and (max-width: 768px) {
            .textset-tit, .textset-eu {
                font-size: 20px;
            }
        }

    </style>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>

<!--top start-->
<%@ include file="../layout/top.jsp" %>
<!--top end-->
<body>
<main class="th-layout-main ">

    <div class="thpart-HmlqLtFlNZ" data-bid="HmlqLtFlNZ">
        <div class="contents-container">
            <img class="contents-backimg" src="../khs/images/work.jpg" alt="">
            <div class="contents-body container-md">
                <h2 class="contents-title"> Work </h2>
                <h7 class="contents-sub">작품</h7>
            </div>
        </div>
    </div>

<%--    <div class="opilsol-N34" data-bid="Dklq5i7YYR" >--%>
<%--        <div class="content-container container-md">--%>
<%--            <div class="textset content-tit">--%>
<%--                <h4 class="h4">${work.workName} | ${episode.episodeOrder}</h4>--%>
<%--                <h2 class="textset-tit">${episode.episodeName}</h2>--%>
<%--                <p class="textset-eu"><fmt:formatDate value="${episode.episodeDate}" pattern="yyyy-MM-dd"/></p>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>

<%--    <div class="opilsol-N17" data-bid="GkLq5I7z1g">--%>
<%--        <div class="content-container">--%>
<%--            <c:choose>--%>

<%--                <c:when test="${work.category eq '0'}">--%>
<%--                    <div class="text-content">--%>
<%--                        <p>${textContent}</p>--%>
<%--                    </div>--%>
<%--                </c:when>--%>


<%--                <c:when test="${work.category eq '1'}">--%>
<%--                    <div class="image-content">--%>
<%--                        <img src="${files}" alt="Episode Image" style="max-width: 300px; max-height: 300px; display: block;">--%>
<%--                    </div>--%>
<%--                </c:when>--%>


<%--                <c:when test="${work.category eq '2'}">--%>
<%--                    <div class="video-content">--%>
<%--                        <video controls style="width: 100%; height: auto;">--%>
<%--                            <source src="${files}" type="video/mp4">--%>
<%--                            브라우저가 비디오를 지원하지 않습니다.--%>
<%--                        </video>--%>
<%--                    </div>--%>
<%--                </c:when>--%>
<%--            </c:choose>--%>
<%--        </div>--%>
<%--    </div>--%>

    <!-- [S]hooms-N32 -->
    <div class="hooms-N32" data-bid="XklqkoBO8I">
        <div class="contents-inner">
            <div class="contents-container container-md">
                <div class="textset textset-h2">
                    <h2 class="textset-tit">${work.workName}</h2>
                </div>
                <div class="contents-group">
                    <h5 class="contents-tit"> ${episode.episodeName} : ${episode.episodeOrder}</h5>
                    <p class="textset-eu"><fmt:formatDate value="${episode.episodeDate}" pattern="yyyy-MM-dd"/></p>
                </div>
                <c:choose>

                    <c:when test="${work.category eq '0'}">
                        <div class="contents-cardlist contents-cardlist-active">
                            <div class="cardset-body">
                                <p class="h5 cardset-desc"> ${textContent}</p>
                            </div>
                        </div>
                    </c:when>
                    <c:when test="${work.category eq '1'}">
                        <div class="contents-cardlist contents-cardlist-active">
                            <figure class="cardset-figure">
                                <img class="cardset-img" src=".${files}" alt="이미지" style="max-width: 690px; max-height: 1280px; display: block;">
                            </figure>
                        </div>
                    </c:when>
                    <c:when test="${work.category eq '2'}">
                        <div class="contents-container">
                            <div class="videoset">
                                <video class="videoset-video">
                                    <source src="../resources/videos/video.mp4">
                                </video>
                                <div class="videoset-body container-md">
                                    <h2 class="videoset-tit"> </h2>
                                    <button class="videoset-play">
                                        <img src="../resources/icons/ico_play_white.svg" alt="">
                                    </button>
                                </div>
                            </div>
                        </div>
                    </c:when>
                </c:choose>

                <div class="contents-btn">
                    <a class="btnset" href="../work/listWork">목록으로</a>
                    <a class="btnset" href="javascript:window.history.back();">뒤로가기</a>
                </div>

            </div>
        </div>
    </div>
    <!-- [E]hooms-N32 -->


    <!-- 다른 섹션들 -->

    <div class="hooms-N41" data-bid="fhlQKohvsi">
        <div class="contents-inner">
            <div class="inputset inputset-lg inputset-label">
                <label >
                    <c:if test="${not empty user}">
                    <h3 class="h3">댓글란</h3>
                    <input type="hidden" id="episodeNo" value="${episode.episodeNo}">
                    <textarea id="commentContent" class="inputset-textarea" placeholder="댓글을 입력해주세요." required=""></textarea>
                    <div class="inputset-langth">
                        <span class="inputset-count">0</span>
                        <span class="inputset-total">/300</span>
                    </div>
                        <a href="javascript:addComment()" class="btnset btnset-lg">댓글추가</a>
                    </c:if>
                    <c:if test="${empty user}">
                        <h3 class="h3">로그인후 댓글을 이용해 주세요</h3>
                    </c:if>
                </label>
            </div>
            <div class="contents-container container-md">
                <div class="contents-group">
                    <div class="contents-cardlist contents-cardlist-active">
                            <div class="cardset-body" id="commentList">

                            </div>
                    </div>
                </div>
            </div>



        </div>
    </div>
</main>
<%--<div id="editCommentModal" class="modal">--%>
<%--    <div class="modal-content">--%>
<%--        <h2>댓글 수정</h2>--%>
<%--        <textarea id="editCommentText" rows="4"></textarea>--%>
<%--        <button onclick="updateComment(currentEditingComment)">수정하기</button>--%>
<%--        <button onclick="closeModal('editCommentModal')">취소하기</button>--%>
<%--    </div>--%>
<%--</div>--%>
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
            var commentBody = document.createElement("div");
            commentBody.className = "cardset-body";

            var contentsInfo = document.createElement("div");
            contentsInfo.className = "contents-info";

            var contentsName = document.createElement("div");
            contentsName.className = "contents-name";
            contentsName.innerHTML = comment.userId + ' <span class="contents-date">' + comment.commentDate + '</span>';

            var cardsetTitGroup = document.createElement("div");
            cardsetTitGroup.className = "cardset-tit-group";

            var cardsetTit = document.createElement("h5");
            cardsetTit.className = "cardset-tit";
            cardsetTit.innerHTML = '<span style="color: rgb(102, 102, 102); font-size: 16px;">' + comment.content + '</span>';

            contentsInfo.appendChild(contentsName);
            cardsetTitGroup.appendChild(cardsetTit);
            commentBody.appendChild(contentsInfo);
            commentBody.appendChild(cardsetTitGroup);

            if (loggedInUserId === comment.userId) {

                var editButton = document.createElement("button");
                editButton.innerText = "수정";
                editButton.onclick = function() {
                    addEditField(commentBody, comment);
                };

                commentBody.appendChild(editButton);

                var deleteButton = document.createElement("button");
                deleteButton.onclick = function() { deleteComment(comment.commentNo); };
                deleteButton.innerText = "삭제";

                commentBody.appendChild(deleteButton);
            }

            commentListElement.appendChild(commentBody);
        });

        if (comments.length === 0) {
            commentListElement.innerHTML = "<p>아직 댓글 내역이 없습니다.</p>";
        }
    }

    // 댓글 수정 필드 추가
    function addEditField(commentBody, comment) {
        var existingEditField = document.getElementById("editedContent_" + comment.commentNo);
        if (existingEditField) {
            return; // 이미 수정 필드가 존재하면 함수 실행을 중단
        }
        var editField = document.createElement("textarea");
        editField.value = comment.content;
        editField.rows = 3;
        editField.id = "editedContent_" + comment.commentNo;

        var saveButton = document.createElement("button");
        saveButton.innerText = "수정";
        saveButton.onclick = function() {
            updateComment(comment.commentNo, editField.value);
        };

        var cancelButton = document.createElement("button");
        cancelButton.innerText = "취소";
        cancelButton.onclick = function() {
            commentBody.removeChild(editField);
            commentBody.removeChild(saveButton);
            commentBody.removeChild(cancelButton);
            //loadComments(); // 댓글 목록을 다시 로드하여 원래 상태로 복원
        };

        commentBody.appendChild(editField);
        commentBody.appendChild(saveButton);
        commentBody.appendChild(cancelButton);
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


    // 댓글 수정
    function updateComment(commentNo, updatedContent) {
        $.ajax({
            type: "POST",
            url: "/episode/json/updateComment",
            contentType: "application/json",
            data: JSON.stringify({
                commentNo: commentNo,
                content: updatedContent
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

</script>

</html>
<script src="../common/js/setting.js"></script>
<script src="../common/js/plugin.js"></script>
<script src="../common/js/template.js"></script>
<script src="../common/js/common.js"></script>
<script src="../common/js/script.js"></script>
<script src="../support/js/support.js"></script>
<script src="/common/js/drag.js"></script>
<%@ include file="../layout/bottom.jsp" %>