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
</head>
<body>

<%@ include file="../layout/top.jsp" %>

<form action="/user/updateUser?${user.userId}" method="post" enctype="multipart/form-data">
    <input type="hidden" name="userId" value="${user.userId}" />
    <input type="hidden" name="userName" value="${user.userName}" />

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
                    <div class="inputset inputset-lg inputset-group">
                        <label class="inputset-label" for="password">비밀번호</label>
                        <input type="password" class="inputset-input form-control" id="password" name="password"
                               pattern="^(?=.*[A-Za-z])(?=.*\d)(?=.*[!@#$%^&*()])[A-Za-z\d!@#$%^&*()]{8,16}$"
                               title="# 영문, 숫자, 특수문자를 혼합하여 8자 이상 16자 이하로 입력하세요" maxlength="16"
                               oninput="updateCharCount('password', 'passwordLength')" minlength="8" value="${user.password}" required >
                        <span id="passwordLength">0/16</span>
                    </div>
                    <span class="check-text"> 영문 숫자 특수문자를 조합하여 최소 8자 최대 16자 등록 가능합니다.</span>
                    <span class="check-text" id="passwordMessage"></span>

                    <div class="inputset inputset-lg inputset-group" for="nickName">
                        <label class="inputset-label">닉네임</label>
                        <input type="text" class="inputset-input form-control" id="nickName" name="nickName" value="${user.nickName}"
                               required maxlength="8" oninput="updateCharCount('nickName', 'nickNameLength')" minlength="2"/>
                        <span id="nickNameLength">0/8</span>
                    </div>
                    <span class="check-text">영문과 숫자 한글을 조합하여 최소 2자 최대 8자 등록 가능합니다.</span>
                    <span class="check-text" id="nickNameMessage"></span>

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
                    <span class="check-text" id="phoneMessage"></span>

                    <div class="inputset inputset-lg inputset-group" for="userImage">
                        <label class="inputset-label">회원 이미지</label>

                        <div style="text-align: center;">
                            <img src="../file/user/${user.userImage}" width="100" alt=""/>
                            <p class="check-stext">* 기존이미지 입니다.</p>

                        </div>

                        <div id="dropArea" class="drop-area">
                            <span class="drop-text">
                                JPG 이미지를 올려 주세요
                            </span>
                            <input class="check-image" type="file" id="userfile" name="userfile" accept=".jpg"/>
                            <ul id="fileList" class="file-list" style="list-style-type: none; padding: 0; margin-top: 10px;"></ul>
                        </div>

                    </div>




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
                    <button type="submit" class="btnset btnset-lg btnset-rect" contenteditable="true">수정 완료</button>
                </div>
            </div>
        </div>
    </div>
</form>
    <%@ include file="../layout/bottom.jsp" %>

    <script src="../ssh/js/setting.js"></script>
    <script src="../ssh/js/plugin.js"></script>
    <script src="../ssh/js/template.js"></script>
    <script src="../ssh/js/common.js"></script>
    <script src="../ssh/js/script.js"></script>
    <script src="../ssh/js/addUser.js"></script>

</body>
</html>
