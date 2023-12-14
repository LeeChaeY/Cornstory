<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="imagetoolbar" content="no">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="format-detection" content="telephone=no">
    <meta name="title" content="웹사이트">
    <meta name="description" content="웹사이트입니다.">
    <meta name="keywords" content="키워드,키워드,키워드">
    <meta property="og:title" content="웹사이트">
    <meta property="og:description" content="웹사이트입니다">
    <meta property="og:image" content="https://웹사이트/images/opengraph.png">
    <meta property="og:url" content="https://웹사이트">
    <title>회원 정보 조회</title>
    <link rel="stylesheet" href="../ssh/css/setting.css">
    <link rel="stylesheet" href="../ssh/css/plugin.css">
    <link rel="stylesheet" href="../ssh/css/template.css">
    <link rel="stylesheet" href="../ssh/css/common.css">
    <link rel="stylesheet" href="../ssh/css/style.css">



    <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <!-- jQuery 추가 -->
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <script>
        $(document).ready(function () {
            // "탈퇴하기" 링크 클릭 시 실행
            $("#withdrawLink").click(function () {
                var userId = "${sessionScope.user.userId}"; // 세션에서 현재 사용자의 아이디 가져오기

                // Ajax를 통한 서버 요청
                $.ajax({
                    type: "GET",
                    url: "json/deleteUser",
                    data: { userId: userId },
                    success: function (response) {
                        console.log(response); // 응답을 콘솔에 출력
                        if (response === "valid") {
                            alert("회원 탈퇴가 완료되었습니다.");
                            window.location.href = "../index.jsp";
                        } else {
                            alert("회원 탈퇴에 실패했습니다.");
                        }
                    },

                    error: function (xhr, status, error) {
                        console.log(xhr.status); // HTTP 응답 코드를 콘솔에 출력
                        alert("기존 등록 또는 작성으로 인한 회원탈퇴 실패");
                    }

                });
            });
        });
    </script>
    <style>
        .user-size{
            padding: 140px;
            font-size: 12px;
        }
    </style>
</head>
<body>
<%@ include file="../layout/top.jsp" %>
<main class="th-layout-main ">
    <!-- [S]opilsol-N29 -->
    <div class="opilsol-N29" data-bid="aO2clo2iX6D" id="">
        <div class="modal">
        </div>
    </div>
    <!-- [E]opilsol-N29 -->
</main>
<!-- [S]opilsol-N31 -->
<div class="opilsol-N31" data-bid="bg4j773N4HN">
    <div class="content-container">
        <div class="textset content-top">
            <div class="container-md">
                <h2 class="textset-tit">회원정보조회</h2>
            </div>
        </div>
        <div class="contents-form">
            <div class="container-md">
                <div class="contents-form-top">
                </div>
                <div class="inputset inputset-lg inputset-group" for="userName">
                    <label class="inputset-label">성명</label>
                    <label class="inputset-label">${user.userName}</label>
                </div>
                <div class="inputset inputset-lg inputset-group" for="userId">
                    <label class="inputset-label">아이디</label>
                    <label class="inputset-label">${user.userId}</label>
                </div>
                <div class="inputset inputset-lg inputset-group" for="nickName">
                    <label class="inputset-label">닉네임</label>
                    <label class="inputset-label">${user.nickName}</label>
                </div>
                <div class="inputset inputset-lg inputset-group" for="addr">
                    <label class="inputset-label">주소</label>
                    <label class="inputset-label"><c:out value="${user.addr}"/><br></label>
                </div>
                <div class="inputset inputset-lg inputset-group" for="address">
                    <label class="inputset-label">상세주소</label>
                    <label class="inputset-label">${user.address}</label>
                </div>
                <div class="inputset inputset-lg inputset-group" for="phone">
                    <label class="inputset-label">휴대폰번호</label>
                    <label class="inputset-label">${user.phone}</label>
                </div>
                <div class="inputset inputset-lg inputset-group" for="email">
                    <label class="inputset-label">이메일</label>
                    <label class="inputset-label">${user.email}</label>
                </div>
                <div class="inputset inputset-lg inputset-group" for="birthday">
                    <label class="inputset-label">생년월일</label>
                    <label class="inputset-label">${user.birthday}</label>
                </div>

                <div class="inputset inputset-lg inputset-group" for="userImage">
                    <label class="inputset-label">회원사진</label>
                    <img src="../file/user/${user.userImage}" width="100" alt=""/>
                    <label class="inputset-label">${user.userImage}</label>
                </div>
            </div>
            <div class="bottom-btn">
                <a href="../index.jsp"><button class="btnset btnset-lg btnset-dark btnset-rect">확인</button></a>
                <a href="updateUser?userId=${sessionScope.user.userId}"><button class="btnset btnset-lg btnset-rect">수정하기</button></a>
                <a id="withdrawLink" href="#"><button class="btnset btnset-lg btnset-dark btnset-rect">탈퇴하기</button></a>
            </div>
<!-- 탈퇴가 완료되면 표시할 메시지 -->
<c:if test="${param.deleted eq 'true'}">
    <p style="color: green;">회원 탈퇴가 완료되었습니다.</p>
</c:if>
        </div>
    </div>
</div>

<script src="../ssh/js/setting.js"></script>
<script src="../ssh/js/plugin.js"></script>
<script src="../ssh/js/template.js"></script>
<script src="../ssh/js/common.js"></script>
<script src="../ssh/js/script.js"></script>

<%@ include file="../layout/bottom.jsp" %>
</body>
</html>
