<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html lang="ko">

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
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <title>listStore</title>
    <link rel="stylesheet" href="/ssh/css/style.css">
    <link rel="stylesheet" href="/ssh/css/plugin.css">
    <link rel="stylesheet" href="/ssh/css/template.css">
    <link rel="stylesheet" href="/ssh/css/common.css">
    <link rel="stylesheet" href="/ssh/css/style.css">

    <link rel="stylesheet" href="/lcy/css/style.css">


    <!-- [E]thwhole-wfLpW5Z3pJ -->
    <script src="/ssh/js/setting.js"></script>
    <script src="/ssh/js/plugin.js"></script>
    <script src="/ssh/js/template.js"></script>
    <script src="/ssh/js/common.js"></script>
    <script src="/ssh/js/script.js"></script>

    <script src="/lcy/js/addChatSpace.js"></script>
</head>

<body>

<%@ include file="../layout/top.jsp" %>

<!-- [E]thwhole-lNlPW5z3lS -->
<!-- [S]opilsol-N26 -->
<div class="opilsol-N26" data-bid="Mr11fzPLNQx" id="">
    <div class="content-container">
        <div class="contents-form container-md">
            <div class="contents-form-top d-flex justify-content-between">
                <h3 class="inputset-tit">채팅</h3>
                <div class="dropset dropset-solid">
                    <div class="dropset-head"></div>
                </div>
            </div>
            <div class="checkset-wrap">
                <div class="checkset">
                    <input id="checkset-e-4-1" class="visually-hidden" type="radio" name="inquiryType" value="">
                    <label class="checkset-thumb" for="checkset-e-4-1">
                        <span>채팅방 목록</span>
                    </label>
                </div>
                <div class="checkset">
                    <input id="checkset-e-4-2" class="visually-hidden" type="radio" name="inquiryType" value="">
                    <label class="checkset-thumb" for="checkset-e-4-2">
                        <span>개설한 채팅방</span>
                    </label>
                </div>
                <div class="checkset">
                    <input id="checkset-e-4-3" class="visually-hidden" type="radio" name="inquiryType" value="">
                    <label class="checkset-thumb" for="checkset-e-4-3">
                        <span>입장한 채팅방</span>
                    </label>
                </div>
                <div class="checkset">
                    <input id="checkset-e-4-4" class="visually-hidden" type="radio" name="inquiryType" value=""
                           checked="">
                    <label class="checkset-thumb" for="checkset-e-4-4">
                        <span>채팅방 추가하기</span>
                    </label>
                </div>
            </div>
        </div>
    </div>
</div>

<form name="form">
    <input type="hidden" name="genre" value="${genre}">
    <input type="hidden" name="userId" value="${userId}">
    <input type="hidden" name="enterUserId" value="${enterUserId}">
    <input type="hidden" name="sessionUserId" value="${sessionScope.user.userId}">
</form>

<!-- [E]opilsol-N26 -->
<main class="th-layout-main ">
    <!-- [S]opilsol-N27 -->
    <div class="opilsol-N27" data-bid="PNlQ32jk6H">
        <div class="content-container">
            <div class="contents-form container-md">
                <div class="contents-form-top d-flex justify-content-between">
                    <h3 class="inputset-tit">채팅방 추가하기</h3>
                    <span class="req">필수 선택입니다.</span>
                </div>
                <div class="contents-form tableset">
                    <div class="tableset-inner">
                        <form name="updateForm" method="post" enctype="multipart/form-data">
                            <input type="hidden" name="chatSpaceNo" value="${chatSpace.chatSpaceNo}">
                            <table class="tableset-table table">
                                <colgroup>
                                    <col>
                                    <col>
                                    <col>
                                    <col>
                                </colgroup>
                                <tbody>
                                <tr>
                                    <th>
                                        <label class="label">개설자 닉네임</label>
                                    </th>
                                    <td>
                                        <div class="inputset">
                                            ${sessionScope.user.nickName}
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th>
                                        <label class="req label" for="Name">채팅방 제목</label>
                                    </th>
                                    <td>
                                        <div class="inputset">
                                            <input type="text" class="inputset-input form-control" name="cSpaceName" id="Name"
                                                   value="${chatSpace.cSpaceName}" aria-label="이름">
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th>
                                        <span class="label">장르</span>
                                    </th>
                                    <td colspan="3">
                                        ${chatSpace.genre}
                                    </td>
                                </tr>
                                <tr>
                                    <th>
                                        <span class="label">썸네일 첨부</span>
                                    </th>
                                    <td colspan="2">
                                        <div class="fileset fileset-lg fileset-label">
                                            <label>
                                                <div class="fileset-body">
                                                    <div class="fileset-group">
                                                        <input type="file" class="fileset-input" name="file">
                                                        <button class="fileset-cancel"></button>
                                                    </div>
                                                    <span class="btnset btnset-line btnset-mono btnset-lg btnset-rect fileset-upload">썸네일 첨부</span>
                                                </div>
                                            </label>
                                        </div>
                                        <p class="p1 co-text3">이미지 형식의 jpg만 첨부 가능합니다.</p>
                                        <p class="p1 co-text3">첨부파일은 10MB를 초과할 수 없으며, 최대 1개까지 가능합니다.</p>
                                    </td>
                                    <td colspan="1">
                                        * 기존 썸네일<br><br>
                                        <img width="100px" height="100px" src="/file/chat/${chatSpace.cSpaceImage}">
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </form>
                        <br>
                        <div class="bottom-btn">
                            <input type="button" class="btnset btnset-lg btnset-dark btnset-rect" value="취소"/>
                            <input type="button" class="btnset btnset-lg btnset-rect" value="수정"/>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- [E]opilsol-N27 -->
</main>

<%@ include file="../layout/bottom.jsp" %>

</body>

</html>