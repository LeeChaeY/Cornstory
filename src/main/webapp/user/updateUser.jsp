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
    <title>회원 가입</title>
    <link rel="stylesheet" href="../ssh/css/setting.css">
    <link rel="stylesheet" href="../ssh/css/plugin.css">
    <link rel="stylesheet" href="../ssh/css/template.css">
    <link rel="stylesheet" href="../ssh/css/common.css">
    <link rel="stylesheet" href="../ssh/css/style.css">



    <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <script>
        function findAddress() {
            new daum.Postcode({
                oncomplete: function(data) {
                    document.getElementById('addr').value = data.address;
                }
            }).open();
        }
    </script>
    <style>
        .check-text {
            padding: 140px;
            font-size: 12px;
        }
        .check-image {

            font-size: 12px;
        }
    </style>
</head>
<body>

<%@ include file="../layout/top.jsp" %>

<form action="/user/updateUser?${user.userId}" method="post">
    <div class="opilsol-N31" data-bid="pc4J773eI8y" id="">
        <div class="content-container">
            <div class="textset content-top">
                <div class="container-md">
                    <h2 class="textset-tit">회원정보수정</h2>
                </div>
            </div>
            <div class="contents-form">
                <div class="container-md">
                    <div class="contents-form-top">
                    </div>
                    <div class="inputset inputset-lg inputset-group" for="social">
                        <label class="inputset-label">소셜 연동</label>
                        <input type="checkbox" class="inputset-input check-text" id="social" name="social" value="${user.social}" required><br>
                    </div>
                    <div class="inputset inputset-lg inputset-group">
                        <label class="inputset-label" for="password">비밀번호</label>
                        <input type="password" class="inputset-input form-control" id="password" name="password" value="${user.password}" required><br>
                    </div>
                    <div class="inputset inputset-lg inputset-group" for="nickName">
                        <label class="inputset-label">닉네임</label>
                        <input type="text" class="inputset-input form-control" id="nickName" name="nickName" value="${user.nickName}" required><br>
                    </div>
                    <div class="inputset inputset-lg inputset-group" for="addr">
                        <label class="inputset-label">주소</label>
                        <input type="text"  class="inputset-input form-control" id="addr" name="addr" value="${user.addr}" required>
                        <button type="button" onclick="findAddress()">주소 찾기</button><br>
                    </div>
                    <div class="inputset inputset-lg inputset-group" for="address">
                        <label class="inputset-label">상세주소</label>
                        <input type="text" class="inputset-input form-control" id="address" name="address" value="${user.address}" required><br>
                    </div>
                    <div class="inputset inputset-lg inputset-group" for="phone">
                        <label class="inputset-label">휴대폰번호</label>
                        <input type="tel" class="inputset-input form-control" id="phone" name="phone" value="${user.phone}" required><br>
                    </div>

                    <div class="inputset inputset-lg inputset-group" for="userImage">
                        <label class="inputset-label">회원 사진</label>
                        <img src="../file/user/${user.userImage}" width="100" alt=""/>
                        <label class="inputset-label">${user.userImage}</label>
                        <input class="check-image" type="file" id="userImage" name="filename" accept=".jpg"/>

                    </div>
                    <span class="check-text"> 파일 용량 1MB 이하 JPG만 업로드 가능합니다.</span>

                    <div class="inputset inputset-lg inputset-group" for="email">
                        <label class="inputset-label">이메일</label>
                        <input type="email"  class="inputset-input form-control" id="email" name="email" value="${user.email}" required><br>
                    </div>
                    <div class="inputset inputset-lg inputset-group">
                        <label class="inputset-label"></label>
                        <div class="checkset checkset-sm">
                            <input id="checkset-c-6-1" class="checkset-input input-round" type="checkbox" value="" checked="">
                            <label class="checkset-label" for="checkset-c-6-1"></label>
                            <span class="checkset-text">정보성 메일에 동의합니다</span>
                        </div>
                    </div>
                </div>
                <div class="bottom-btn">
                    <button class="btnset btnset-lg btnset-dark btnset-rect">취소</button>
                    <button type="submit" class="btnset btnset-lg btnset-rect" contenteditable="true">수정 왼료</button>
                </div>
            </div>
        </div>
    </div>

    <%@ include file="../layout/bottom.jsp" %>
    <script src="../ssh/js/setting.js"></script>
    <script src="../ssh/js/plugin.js"></script>
    <script src="../ssh/js/template.js"></script>
    <script src="../ssh/js/common.js"></script>
    <script src="../ssh/js/script.js"></script>
</form>
</body>
</html>
