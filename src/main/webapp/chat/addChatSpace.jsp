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
    <title>addChatSpace</title>
    <link rel="stylesheet" href="/lcy/css/style.css">
    <link rel="stylesheet" href="/common/css/drag.css">
    <!-- [E]thwhole-wfLpW5Z3pJ -->
    <script src="/ssh/js/setting.js"></script>
    <script src="/ssh/js/plugin.js"></script>
    <script src="/ssh/js/template.js"></script>
    <script src="/ssh/js/common.js"></script>
    <script src="/ssh/js/script.js"></script>

    <script src="/lcy/js/addChatSpace.js"></script>
    <script src="/common/js/drag.js"></script>
</head>

<body>

<%@ include file="../layout/top.jsp" %>

<!-- [E]opilsol-N26 -->
<main class="th-layout-main ">
    <div class="thpart-HmlqLtFlNZ" data-bid="HmlqLtFlNZ" id="">
        <div class="contents-container">
            <img class="contents-backimg"
                 src="https://images.unsplash.com/photo-1616004675303-ae5657c14af7?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0OTE2MDd8MHwxfHNlYXJjaHw1OXx8JUVBJUIyJTgwJUVDJTlEJTgwfGtvfDB8fHx8MTcwMzYwOTc4MXww&ixlib=rb-4.0.3&q=80&w=1080"
                 alt="">
            <div class="contents-body container-md">
                <h2 class="contents-title">
                    Chatting
                </h2>
                <h7 class="contents-sub">채팅</h7>
            </div>
        </div>
    </div>


    <!-- [S]opilsol-N27 -->
    <div class="hooms-N53" data-bid="lYlQluvFkB">
        <div class="contents-inner">
            <div class="contents-form container-md">
                <div class="textset textset-h2">
                    <h2 class="textset-tit">채팅방 추가하기</h2>
                </div>

                <form name="addForm" method="post" enctype="multipart/form-data">
                    <div class="contents-form">
                        <div class="contents-form-top"></div>
                        <label class="labelset">
                            <strong class="labelset-vital">
                                <span>*</span>필수입력
                            </strong>
                        </label>
                        <div class="contents-form tableset">
                            <div class="tableset-inner">
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
                                            <%--                                        <div class="inputset">--%>
                                            ${sessionScope.user.nickName}
                                            <%--                                        </div>--%>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>
                                            <label class="req label" for="Name">채팅방 제목 <span>*</span></label>
                                        </th>
                                        <td>
                                            <div class="inputset">
                                                <input type="text" class="inputset-input form-control" name="cSpaceName"
                                                       id="Name"
                                                       placeholder="채팅방 제목을 입력해주세요" aria-label="이름" required
                                                       maxlength="30">
                                                <span class="cSpaceNameLength">0/30</span>
                                            </div>
                                            <p class="cSpaceNameCheck" style="color: red; display: none;">
                                            </p>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>
                                            <label class="req label">장르 선택 <span>*</span></label>
                                        </th>
                                        <td colspan="3">
                                            <p style="color: red; text-align: left;">
                                                * 장르는 1개만 선택 가능합니다.<br>
                                                * 장르는 등록 후 수정이 불가능합니다.
                                            </p>
                                            <br>
                                            <div class="radioset-wrap">
                                                <div class="radioset2">
                                                    <input id="genre-1" name="genre"
                                                           class="radioset-input input-line" type="radio"
                                                           aria-label="선택"
                                                           value="학원">
                                                    <label class="radioset-label" for="genre-1"></label>
                                                    <span class="radioset-text">학원</span>
                                                </div>
                                                <div class="radioset2">
                                                    <input id="genre-2" name="genre"
                                                           class="radioset-input input-line" type="radio"
                                                           aria-label="선택"
                                                           value="액션">
                                                    <label class="radioset-label" for="genre-2"></label>
                                                    <span class="radioset-text">액션</span>
                                                </div>
                                                <div class="radioset2">
                                                    <input id="genre-3" name="genre"
                                                           class="radioset-input input-line" type="radio"
                                                           aria-label="선택"
                                                           value="SF">
                                                    <label class="radioset-label" for="genre-3"></label>
                                                    <span class="radioset-text">SF</span>
                                                </div>
                                                <div class="radioset2">
                                                    <input id="genre-4" name="genre"
                                                           class="radioset-input input-line" type="radio"
                                                           aria-label="선택"
                                                           value="판타지">
                                                    <label class="radioset-label" for="genre-4"></label>
                                                    <span class="radioset-text">판타지</span>
                                                </div>
                                                <div class="radioset2">
                                                    <input id="genre-5" name="genre"
                                                           class="radioset-input input-line" type="radio"
                                                           aria-label="선택"
                                                           value="개그">
                                                    <label class="radioset-label" for="genre-5"></label>
                                                    <span class="radioset-text">개그</span>
                                                </div>
                                                <div class="radioset2">
                                                    <input id="genre-6" name="genre"
                                                           class="radioset-input input-line" type="radio"
                                                           aria-label="선택"
                                                           value="로맨스">
                                                    <label class="radioset-label" for="genre-6"></label>
                                                    <span class="radioset-text">로맨스</span>
                                                </div>
                                                <div class="radioset2">
                                                    <input id="genre-7" name="genre"
                                                           class="radioset-input input-line" type="radio"
                                                           aria-label="선택"
                                                           value="스포츠">
                                                    <label class="radioset-label" for="genre-7"></label>
                                                    <span class="radioset-text">스포츠</span>
                                                </div>
                                                <div class="radioset2">
                                                    <input id="genre-8" name="genre"
                                                           class="radioset-input input-line" type="radio"
                                                           aria-label="선택"
                                                           value="일상">
                                                    <label class="radioset-label" for="genre-8"></label>
                                                    <span class="radioset-text">일상</span>
                                                </div>
                                            </div>
                                            <div class="radioset-wrap">
                                                <div class="radioset2">
                                                    <input id="genre-9" name="genre"
                                                           class="radioset-input input-line" type="radio"
                                                           aria-label="선택"
                                                           value="추리">
                                                    <label class="radioset-label" for="genre-9"></label>
                                                    <span class="radioset-text">추리</span>
                                                </div>
                                                <div class="radioset2">
                                                    <input id="genre-10" name="genre"
                                                           class="radioset-input input-line" type="radio"
                                                           aria-label="선택"
                                                           value="스릴러">
                                                    <label class="radioset-label" for="genre-10"></label>
                                                    <span class="radioset-text">스릴러</span>
                                                </div>
                                                <div class="radioset2">
                                                    <input id="genre-11" name="genre"
                                                           class="radioset-input input-line" type="radio"
                                                           aria-label="선택"
                                                           value="무협">
                                                    <label class="radioset-label" for="genre-11"></label>
                                                    <span class="radioset-text">무협</span>
                                                </div>
                                                <div class="radioset2">
                                                    <input id="genre-12" name="genre"
                                                           class="radioset-input input-line" type="radio"
                                                           aria-label="선택"
                                                           value="기타">
                                                    <label class="radioset-label" for="genre-12"></label>
                                                    <span class="radioset-text">기타</span>
                                                </div>
                                            </div>
                                            <p class="genreCheck" style="color: red; display: none;">
                                            </p>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>
                                            <span class="label">썸네일 첨부</span>
                                        </th>
                                        <td colspan="2">
                                            <div id="dropArea" class="drop-area">
                                                <span class="drop-text">Drag and drop files here or click to upload</span>
                                                <input class="check-image" type="file" name="file" accept=".jpg"/>
                                                <ul id="fileList" class="file-list"></ul>
                                            </div>
                                            <br>
                                            <p class="p1 co-text3">이미지 형식의 jpg만 첨부 가능합니다.</p>
                                            <p class="p1 co-text3">첨부파일은 10MB를 초과할 수 없으며, 최대 1개까지 가능합니다.</p>
                                            <p class="fileCheck" style="color: red; display:none;">
                                            </p>
                                        </td>
                                        <td colspan="1">
                                            * 기본 썸네일<br><br>
                                            <img width="200px" height="200px" src="/file/chat/chat.jpg">
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                                <br>
                                <div class="bottom-btn">
                                    <input type="button" class="btnset btnset-lg btnset-dark btnset-rect" value="취소"/>
                                    <input type="button" class="btnset btnset-lg btnset-rect" value="등록"/>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <!-- [E]opilsol-N27 -->
</main>

<%@ include file="../layout/bottom.jsp" %>

</body>

</html>