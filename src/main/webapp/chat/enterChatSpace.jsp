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
    <title>enterChatSpace</title>
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

    <script src="/lcy/js/enterChatSpace.js"></script>

    <style type="text/css">
        body {
            position: relative;
            overflow-x: hidden;
        }

        #closeSlideMenu {
            padding-top: 1.2rem;
            padding-left: 1.2rem;
            cursor: pointer;
        }

        #slideMenu {
            width: 40%;
            height: 80%;
            position: absolute;
            right: -100%;
            top: 0;
            background-color: #808080;
            cursor: default;
            z-index: 1;

            -webkit-transition: right .3s;
            -moz-transition: right .3s;
            -ms-transition: right .3s;
            -o-transition: right .3s;
            transition: right .3s;
        }

        #slideMenu table tr {
            text-align: center;
        }

        #slideMenu.on {
            right: 0;
        }
    </style>
</head>

<body>

<!-- [E]opilsol-N26 -->
<main class="th-layout-main ">
    <!-- [S]opilsol-N24 -->
    <div class="opilsol-N24" data-bid="El2cLoRe4L1" style="margin-left: 0px;">
        <div class="content-container">
            <div class="container-md">

                <div class="tableset">
                    <div class="tableset-inner">
                        <h3 contenteditable="true">채팅방</h3><br>
                        <table class="tableset-table table">
                            <colgroup>
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
                            <tr>
                                <td>
                                    <img width="100px" height="100px" src="/file/chat/${chatSpace.cSpaceImage}">
                                </td>
                                <td>
                                    ${chatSpace.cSpaceName}
                                </td>
                                <td>
                                    <img src="/file/chat/${chatSpace.userImage}">
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
                                    <input type="button" id="slide-open" value="인원보기">
                                </td>
                            </tr>
                            </tbody>
                        </table>
                        <br>
                        <form name="form">
                            <div class="inputset inputset-line inputset-lg">
                                <button class="listStoreSearchButton inputset-icon icon-right icon-search btn"
                                        type="button" aria-label="아이콘"></button>
                                <input type="text" class="inputset-input form-control" name="searchKeyword"
                                       placeholder="채팅 내용을 입력해 주세요." aria-label="내용"
                                       value="${!empty search.searchKeyword ? search.searchKeyword:''}">
                            </div>
                            <input type="hidden" name="chatSpaceNo" value="${chatSpace.chatSpaceNo}">
                        </form>
                    </div>
                </div>


                <div id="slideMenu" class="slide">
                    <div id="closeSlideMenu">닫기</div>
                    <br><br>
                    <div>전체 ${ totalCount } 명</div>
                    <table>
                        <tbody>
                        <tr>
                            <td width="50">No</td>
                            <td width="100">회원 사진</td>
                            <td width="200">회원 닉네임</td>
                            <td width="150">회원 입장시간</td>
                        </tr>
                        <c:set var="j" value="0"/>
                        <c:forEach var="chatSpace" items="${ userList }">
                            <c:set var="j" value="${j+1}"/>
                            <tr>
                                <td>${j}</td>
                                <td><img src="/file/chat/${chatSpace.userImage}"></td>
                                <td>
                                        ${chatSpace.nickname}
                                    <c:if test="${j == 1}">
                                    <개설자></c:if>
                                </td>
                                <td>${chatSpace.chatEnterDate}</td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>


                <br>


                <div class="chatList">
                    <c:set var="i" value="0"/>
                    <c:forEach var="chat" items="${ list }">
                        <c:set var="i" value="${i+1}"/>
                        <c:if test="${sessionScope.user.userId == chat.userId}">
                            <div align="right" style="padding-bottom: 10px;">
                                <p class="ct_list_pop" align="left" style="min-height: 100px; width: 40%;
                                background-color: lightgray; padding : 5px; position: relative;">
                                <span style="display: block; padding-bottom: 10px">
                                    <img src="/file/user/${chat.userImage}"> ${chat.nickname}</span>
                                        ${chat.chatContent}
                                    <span style="display: block; padding: 5px; position: absolute; bottom: 0; right: 0;">
                                            ${chat.chatDate}</span>
                                </p>
                            </div>
                        </c:if>
                        <c:if test="${sessionScope.user.userId != chat.userId}">
                            <div align="left" style="padding-bottom: 10px;">
                                <p class="ct_list_pop" align="left" style="min-height: 100px; width: 40%;
                                background-color: lightgray; padding : 5px; position: relative;">
                                <span style="display: block; padding-bottom: 10px">
                                    <img src="/file/user/${chat.userImage}"> ${chat.nickname}</span>
                                        ${chat.chatContent}
                                    <span style="display: block; padding: 5px; position: absolute; bottom: 0; right: 0;">
                                            ${chat.chatDate}</span>
                                </p>
                            </div>
                        </c:if>
                    </c:forEach>
                </div>

                <div align="right" style="margin: 10px">
                    <input type="hidden" name="chatSpaceNo" value="${chatSpace.chatSpaceNo}">

                    <textarea name="chatContent" cols="50" rows="10"></textarea>
                    <input type="submit" value="전송">
                </div>

            </div>
        </div>
    </div>
    <!-- [E]opilsol-N24 -->
</main>

</body>

</html>