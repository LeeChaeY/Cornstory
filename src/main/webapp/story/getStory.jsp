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
    <style>

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
<!--top start-->
<%@ include file="../layout/top.jsp" %>
<!--top end-->
<body>
<main class="th-layout-main ">
    <div class="thpart-HmlqLtFlNZ" data-bid="HmlqLtFlNZ">
        <div class="contents-container">
            <img class="contents-backimg" src="../khs/images/story.jpg" alt="">
            <div class="contents-body container-md">
                <h2 class="contents-title"> Story </h2>
                <h7 class="contents-sub">스토리</h7>
            </div>
        </div>
    </div>

    <!-- [S]hooms-N8 -->
    <div class="hooms-N8" data-bid="VtLQKozMcd" >
        <div class="contents-inner">
            <div class="contents-container container-md">
                <div class="textset textset-h2">
                    <h2 class="textset-tit">마이 스토리</h2>
                </div>
                <a href="/story/addStory">스토리 추가</a>
                <c:if test="${not empty story}">
                    <c:forEach var="story" items="${story}">
                        <div class="contents-cardgroup">

                            <div class="cardset" style="border: 1px black solid;">
                                <figure class="cardset-figure">
                                    <img class="cardset-img" src="${story.storyImage}" alt="이미지">
                                </figure>
                                <div class="cardset-body">
                                    <h5 class="cardset-tit">${story.storyName}</h5>
                                    <p class="cardset-desc"> <fmt:formatDate value="${story.storyDate}" pattern="yyyy-MM-dd" /> </p>
                                    <p class="cardset-desc"> ${story.userId} </p>
                                    <p class="cardset-desc"> ${story.storyContent} </p>
                                    <c:if test="${story.userId eq user.userId}">
                                        <a href="/story/updateStory?storyNo=${story.storyNo}">수정</a>
                                        |
                                        <form action="/story/deleteStory" method="post" id="deleteForm_${story.storyNo}">
                                            <input type="hidden" name="storyNo" value="${story.storyNo}">
                                            <a href="#" onclick="confirmAndSubmit(${story.storyNo})">삭제</a>
                                        </form>
                                    </c:if>
                                </div>
                                <a href="#" onclick="event.preventDefault(); toggleComments(${story.storyNo});">댓글 보기/숨기기</a>
                                <c:if test="${not empty user}">
                                    <div class="comment-form" id="commentForm_${story.storyNo}" style="display: none;">
                                        <input type="hidden" id="storyNo_${story.storyNo}" value="${story.storyNo}">
                                        <textarea id="commentContent_${story.storyNo}" placeholder="댓글을 입력하세요"></textarea>
                                        <button type="button" onclick="addComment(${story.storyNo})">댓글 추가</button>
                                    </div>
                                </c:if>
                                <c:if test="${empty user}">
                                    <div class="comment-form" id="commentForm_${story.storyNo}" style="display: none;">
                                        <h4>로그인 후 입력이 가능합니다.</h4>
                                    </div>
                                </c:if>
                                <div class="comment-list" id="commentList_${story.storyNo}" style="display: none;"></div>
                            </div>
                        </div>
                    </c:forEach>
                </c:if>
            </div>
        </div>
    </div>
    <!-- [E]hooms-N8 -->
</main>
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

        var isHidden = commentForm.style.display === "none";

        if (isHidden) {
            commentForm.style.display = "block";
            commentList.style.display = "block";
            loadComments(storyNo);
        } else {
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
    function formatDate(dateString) {
        var date = new Date(dateString);
        var year = date.getFullYear();
        var month = ('0' + (date.getMonth() + 1)).slice(-2); // 월은 0부터 시작하므로 1을 더합니다.
        var day = ('0' + date.getDate()).slice(-2);

        return year + '-' + month + '-' + day; // yyyy-MM-dd 형식
    }
    // 댓글 목록을 화면에 표시하는 함수
    function displayCommentList(comments, storyNo) {
        var commentListElement = document.getElementById("commentList_" + storyNo);

        // 기존에 표시된 댓글들을 모두 제거 (초기화)
        if (commentListElement) {
            commentListElement.innerHTML = "";
        }

        // comments 배열을 순회하면서 각 댓글을 화면에 추가
        comments.forEach(function(comment) {
            var listItem = document.createElement("tr"); // 테이블 행 생성

            // 사용자 ID
            var userIdCell = document.createElement("td");
            userIdCell.className = "tableset-tit tableset-order02";
            userIdCell.innerHTML = '<span>' + comment.userId + '</span>';

            // 댓글 내용
            var contentCell = document.createElement("td");
            contentCell.className = "tableset-order03";
            contentCell.textContent = comment.sContent;

            // 댓글 날짜
            var formattedDate = formatDate(comment.sCommentDate);

            var dateCell = document.createElement("td");
            dateCell.className = "tableset-order03";
            dateCell.textContent = formattedDate;

            // 수정 및 삭제 버튼
            var actionCell = document.createElement("td");
            actionCell.className = "tableset-order03";
            var editButton = document.createElement("button");
            editButton.textContent = "수정";
            editButton.onclick = function() {
                // 수정 기능 구현
                openModal('commentModal_' + comment.sCommentNo, comment.sContent);
            };
            var deleteButton = document.createElement("button");
            deleteButton.textContent = "삭제";
            deleteButton.onclick = function() {
                // 삭제 기능 구현
                deleteComment(comment.sCommentNo, storyNo);
            };

            actionCell.appendChild(editButton);
            actionCell.appendChild(deleteButton);

            // 행에 셀 추가
            listItem.appendChild(userIdCell);
            listItem.appendChild(contentCell);
            listItem.appendChild(dateCell);
            listItem.appendChild(actionCell);

            // 댓글 목록에 행 추가
            commentListElement.appendChild(listItem);
        });

        if (comments.length === 0) {
            var emptyRow = document.createElement("tr");
            var emptyCell = document.createElement("td");
            emptyCell.colSpan = "4"; // 4개의 열을 합침
            emptyCell.textContent = "아직 댓글 내역이 없습니다.";
            emptyRow.appendChild(emptyCell);
            commentListElement.appendChild(emptyRow);
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
<script src="../common/js/setting.js"></script>
<script src="../common/js/plugin.js"></script>
<script src="../common/js/template.js"></script>
<script src="../common/js/common.js"></script>
<script src="../common/js/script.js"></script>
<%--<script src="../support/js/support.js"></script>--%>
<%--<script src="/common/js/drag.js"></script>--%>
<%@ include file="../layout/bottom.jsp" %>