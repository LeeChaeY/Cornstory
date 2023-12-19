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
    <title>listChatSpace</title>
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

    <script src="/lcy/js/listChatSpace.js"></script>
</head>

<body>

<%@ include file="../layout/top.jsp" %>


<!-- [E]opilsol-N26 -->
<main class="th-layout-main ">
    <!-- [S]opilsol-N24 -->
    <div class="opilsol-N24" data-bid="El2cLoRe4L1" style="margin-left: 0px;">
        <div class="content-container">
            <div class="container-md">
                <div class="textset content-tit">
                    <p class="textset-eu">채팅</p>
                    <c:if test="${userStatus == 2}"><h4 class="h4">나의 채팅방</h4></c:if>
                    <c:if test="${userStatus != 2}"><h4 class="h4">채팅방 목록</h4></c:if>
                    <a href="javascript:void(0)">채팅방 추가하기</a>
                </div>

                <form name="form">
                    <div class="inputset inputset-line inputset-lg">
                        <button class="listStoreSearchButton inputset-icon icon-right icon-search btn"
                                type="button"
                                aria-label="아이콘"></button>
                        <input type="text" class="inputset-input form-control" name="searchKeyword"
                               placeholder="채팅방 이름 또는 개설자 닉네임을 입력해 주세요." aria-label="내용"
                               value="${!empty search.searchKeyword ? search.searchKeyword:''}">
                    </div>
                    <br>
                    <input type="hidden" name="genre" value="${genre}">
                    <input type="hidden" name="userStatus" value="${userStatus}">
                </form>

                <div class="radioset-wrap">
                    <div class="radioset">
                        <input id="radioset-c-1-1" name="radioset-c-1" class="visually-hidden" type="radio" value="">
                        <label class="radioset-thumb thumb-round" for="radioset-c-1-1">전체</label>
                    </div>
                    <div class="radioset">
                        <input id="radioset-c-1-2" name="radioset-c-1" class="visually-hidden" type="radio" value="">
                        <label class="radioset-thumb thumb-round" for="radioset-c-1-2">학원</label>
                    </div>
                    <div class="radioset">
                        <input id="radioset-c-1-3" name="radioset-c-1" class="visually-hidden" type="radio" value="">
                        <label class="radioset-thumb thumb-round" for="radioset-c-1-3">액션</label>
                    </div>
                    <div class="radioset">
                        <input id="radioset-c-1-4" name="radioset-c-1" class="visually-hidden" type="radio" value="">
                        <label class="radioset-thumb thumb-round" for="radioset-c-1-4">SF</label>
                    </div>
                    <div class="radioset">
                        <input id="radioset-c-1-5" name="radioset-c-1" class="visually-hidden" type="radio" value="">
                        <label class="radioset-thumb thumb-round" for="radioset-c-1-5">판타지</label>
                    </div>
                    <div class="radioset">
                        <input id="radioset-c-1-6" name="radioset-c-1" class="visually-hidden" type="radio" value="">
                        <label class="radioset-thumb thumb-round" for="radioset-c-1-6">개그</label>
                    </div>
                    <div class="radioset">
                        <input id="radioset-c-1-7" name="radioset-c-1" class="visually-hidden" type="radio" value="">
                        <label class="radioset-thumb thumb-round" for="radioset-c-1-7">로맨스</label>
                    </div>
                    <div class="radioset">
                        <input id="radioset-c-1-8" name="radioset-c-1" class="visually-hidden" type="radio" value="">
                        <label class="radioset-thumb thumb-round" for="radioset-c-1-8">스포츠</label>
                    </div>
                    <div class="radioset">
                        <input id="radioset-c-1-9" name="radioset-c-1" class="visually-hidden" type="radio" value="">
                        <label class="radioset-thumb thumb-round" for="radioset-c-1-9">일상</label>
                    </div>
                    <div class="radioset">
                        <input id="radioset-c-1-10" name="radioset-c-1" class="visually-hidden" type="radio" value="">
                        <label class="radioset-thumb thumb-round" for="radioset-c-1-10">추리</label>
                    </div>
                    <div class="radioset">
                        <input id="radioset-c-1-11" name="radioset-c-1" class="visually-hidden" type="radio" value="">
                        <label class="radioset-thumb thumb-round" for="radioset-c-1-11">스릴러</label>
                    </div>
                    <div class="radioset">
                        <input id="radioset-c-1-12" name="radioset-c-1" class="visually-hidden" type="radio" value="">
                        <label class="radioset-thumb thumb-round" for="radioset-c-1-12">무협</label>
                    </div>
                    <div class="radioset">
                        <input id="radioset-c-1-13" name="radioset-c-1" class="visually-hidden" type="radio" value="">
                        <label class="radioset-thumb thumb-round" for="radioset-c-1-13">기타</label>
                    </div>
                </div>

                <div class="tableset">
                    <div class="tableset-inner">
                        <br>
                        전체 ${totalCount} 개<br>
                        <table class="tableset-table table">
                            <colgroup>
                                <col>
                                <col>
                                <col>
                                <col>
                                <col>
                                <col>
                                <col>
                                <col>
                            </colgroup>
                            <thead class="thead-border-top">
                            <tr>
                                <th class="number" scope="col">NO</th>
                                <th scope="col">채팅방 이미지</th>
                                <th scope="col">채팅방 제목</th>
                                <th scope="col">채팅방 개설자</th>
                                <th scope="col">채팅방 장르</th>
                                <th scope="col">채팅방 인원수</th>
                                <th scope="col">채팅방 개설일</th>
                                <th class="last-child" scope="col"></th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:set var="i" value="0"/>
                            <c:forEach var="chatSpace" items="${ list }">
                                <c:set var="i" value="${i+1}"/>
                                <tr>
                                    <td class="number">
                                        <input type="hidden" name="chatSpaceNo" value="${chatSpace.chatSpaceNo}">
                                            ${i}
                                    </td>
                                    <td>
                                        <img width="100px" height="100px" src="/file/chat/${chatSpace.cSpaceImage}">
                                    </td>
                                    <td>
                                            ${chatSpace.cSpaceName}
                                    </td>
                                    <td>
                                        <img src="/file/user/${chatSpace.userImage}" width="30" style="border-radius: 50%; max-width: 100%;" alt="">
                                            ${chatSpace.nickname}
                                    </td>
                                    <td>
                                            ${chatSpace.genre}
                                    </td>
                                    <td>
                                            ${chatSpace.cSpaceUserCnt}
                                    </td>
                                    <td>
                                            ${chatSpace.cSpaceDate}
                                    </td>
                                    <td class="last-child">
                                        <input type="button" value="입장하기"><br>
                                        <c:if test="${chatSpace.userId != sessionScope.user.userId && chatSpace.chatEnterCheck == 1}">
                                            <input type="button" value="나가기">
                                        </c:if>
                                        <c:if test="${chatSpace.userId == sessionScope.user.userId}">
                                            <input type="button" value="수정하기"><br>
                                            <input type="button" value="삭제하기"><br>
                                        </c:if>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- [E]opilsol-N24 -->
</main>


<%@ include file="../layout/bottom.jsp" %>

</body>

</html>