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
    <title>listChatSpace</title>
    <link rel="stylesheet" href="/ssh/css/style.css">
    <link rel="stylesheet" href="/ssh/css/plugin.css">
    <link rel="stylesheet" href="/ssh/css/template.css">
    <link rel="stylesheet" href="/ssh/css/common.css">
    <link rel="stylesheet" href="/ssh/css/style.css">
    <link rel="stylesheet" href="../common/css/setting.css">
    <link rel="stylesheet" href="../common/css/plugin.css">
    <link rel="stylesheet" href="../common/css/template.css">
    <link rel="stylesheet" href="../common/css/common.css">
    <link rel="stylesheet" href="../common/css/style.css">

    <link rel="stylesheet" href="/lcy/css/style.css">


    <!-- [E]thwhole-wfLpW5Z3pJ -->
    <script src="/ssh/js/setting.js"></script>
    <script src="/ssh/js/plugin.js"></script>
    <script src="/ssh/js/template.js"></script>
    <script src="/ssh/js/common.js"></script>
    <script src="/ssh/js/script.js"></script>

    <script src="/lcy/js/listChatSpace.js"></script>
    <script src="http://localhost:3000/socket.io/socket.io.js"></script>
    <script>
        $(function () {
            // const socket = io();
            // socket.on('enter', function (data) {
            //     console.log('enter');
            // });
        });
    </script>
</head>

<body>
<%@ include file="../layout/top.jsp" %>


<%--이미지: https://www.privateinternetaccess.com/blog/delta-chat-and-the-future-of-messaging-apps/--%>
<!-- [E]opilsol-N26 -->
<main class="th-layout-main ">
    <div class="thpart-HmlqLtFlNZ" data-bid="HmlqLtFlNZ" id="">
        <div class="contents-container">
            <img class="contents-backimg" src="https://images.unsplash.com/photo-1497091071254-cc9b2ba7c48a?crop=entropy&amp;cs=tinysrgb&amp;fit=max&amp;fm=jpg&amp;ixid=M3w0OTE2MDd8MHwxfHNlYXJjaHw4OXx8dXNlcnxrb3wwfHx8YmxhY2t8MTcwMzU2MTkyN3ww&amp;ixlib=rb-4.0.3&amp;q=80&amp;w=1080" alt="">
            <div class="contents-body container-md">
                <h2 class="contents-title">
                    Chatting
                </h2>
                <h7 class="contents-sub">채팅</h7>
            </div>
        </div>
    </div>

    <!-- [S]opilsol-N24 -->
    <div class="hooms-N36" data-bid="iSLqLSg68L">
        <div class="contents-inner">
        <div class="content-container container-md">
            <div class="textset textset-h2">
                <c:if test="${userStatus == 2}"><h2 class="textset-tit">나의 채팅방</h2></c:if>
                <c:if test="${userStatus != 2}"><h2 class="textset-tit">채팅방 목록</h2></c:if>
                <br><a href="javascript:void(0)" style="text-align: center; display: block;">채팅방 추가하기</a>
            </div>
            <div class="contents-form">
            <form name="form">
                <div class="inputset inputset-lg">
                    <button class="inputset-icon icon-right icon-search btn" type="button" aria-label="아이콘"></button>
                    <input type="text" class="inputset-input form-control" name="searchKeyword"
                           placeholder="채팅방 이름 또는 개설자 닉네임을 입력해 주세요." aria-label="내용"
                           value="${!empty search.searchKeyword ? search.searchKeyword:''}">
                </div>
                <input type="hidden" name="genre" value="${genre}">
                <input type="hidden" name="userStatus" value="${userStatus}">
            </form>
            </div>

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
            <br>

            <c:if test="${empty list}">
                <div class="contents-ico">
                    <figure class="contents-figure">
                        <img class="cardset-img"
                             src="https://temha.io/api/t-a/56/1703523600/resources/icons/ico_plus_circle.svg"
                             alt="체크아이콘">
                        <h4>개설하러가기</h4>
                    </figure>
                    <h3>채팅방 목록이 없습니다.</h3>
                </div>
            </c:if>

            <c:if test="${!empty list}">
                <div class="contents-inner">
                    <div class="contents-container container-md">
                        <p class="contents-result">
                            전체<span> ${totalCount}</span> 개
                        </p>
                        <div class="contents-group">
                            <div class="contents-cardlist contents-cardlist-active">
                                <c:set var="i" value="0"/>
                                <c:forEach var="chatSpace" items="${ list }">
                                    <c:set var="i" value="${i+1}"/>
                                    <div class="cardset cardset-hor">
                                        <input type="hidden" name="chatSpaceNo" value="${chatSpace.chatSpaceNo}">
                                        <div class="no">${i}</div>
                                        <figure class="cardset-figure">
                                            <img class="cardset-img"
                                                 src="/file/chat/${chatSpace.cSpaceImage}" alt="이미지">
                                        </figure>
                                        <div class="cardset-body">
                                            <div class="contents-info">
                                                <div class="genre">${chatSpace.genre}</div>
                                                <div class="cSpaceUserCnt">인원수: ${chatSpace.cSpaceUserCnt}</div>
                                                <div class="contents-name">
                                                    <img src="/file/user/${chatSpace.userImage}" width="30"
                                                         style="border-radius: 50%; max-width: 100%;" alt="">
                                                        ${chatSpace.nickname}
                                                    <span class="contents-date">${chatSpace.cSpaceDate}</span>
                                                </div>
                                            </div>

                                            <div class="cardset-tit-group">
                                                <h5 class="cardset-tit">
                                                        ${chatSpace.cSpaceName}
                                                </h5>
                                            </div>
                                            <div class="cardset-desc">
                                                <c:if test="${chatSpace.chatEnterCheck != 1}">
                                                    채팅방에 입장한 회원만 미리보기가 가능합니다.
                                                </c:if>
                                            </div>
                                            <br>
                                            <input type="button" class="enter" value="입장하기">
                                            <c:if test="${chatSpace.userId != sessionScope.user.userId && chatSpace.chatEnterCheck == 1}">
                                                <input type="button" class="exit" value="나가기">
                                            </c:if>
                                            <c:if test="${chatSpace.userId == sessionScope.user.userId}">
                                                <input type="button" class="update" value="수정하기">
                                                <input type="button" class="delete" value="삭제하기">
                                            </c:if>
                                        </div>

                                    </div>
                                </c:forEach>
                            </div>
                        </div>

                    </div>
                </div>
            </c:if>
            <br><br>
        </div>
    </div>
    <!-- [E]opilsol-N24 -->
</main>


<%@ include file="../layout/bottom.jsp" %>

</body>

</html>