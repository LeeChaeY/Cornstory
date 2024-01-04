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
    <link rel="stylesheet" href="/lcy/css/style.css">

    <!-- [E]thwhole-wfLpW5Z3pJ -->
    <script src="/ssh/js/setting.js"></script>
    <script src="/ssh/js/plugin.js"></script>
    <script src="/ssh/js/template.js"></script>
    <script src="/ssh/js/common.js"></script>
    <script src="/ssh/js/script.js"></script>

    <script src="/lcy/js/listStore.js"></script>
    <script src="https://cdn.iamport.kr/v1/iamport.js"></script>
</head>

<body>

<%@ include file="../layout/top.jsp" %>

<!-- [E]opilsol-N26 -->
<main class="th-layout-main">
    <div class="thpart-HmlqLtFlNZ" data-bid="HmlqLtFlNZ" id="">
        <div class="contents-container">
            <img class="contents-backimg"
                 src="https://images.unsplash.com/photo-1582567257180-eff71017288d?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0OTE2MDd8MHwxfHNlYXJjaHwzMjJ8fCVFQSVCMiU4MCVFQyU5RCU4MHxrb3wwfHx8fDE3MDM2MDk4NDZ8MA&ixlib=rb-4.0.3&q=80&w=200"
                 alt="">
            <div class="contents-body container-md">
                <h2 class="contents-title">
                    Store
                </h2>
                <h7 class="contents-sub">스토어</h7>
            </div>
        </div>
    </div>


    <div class="hooms-N31" data-bid="viLqMAGCT2">
            <div class="contents-inner">
                <div class="content-container container-md">
                    <div class="textset textset-h2">
                        <h2 class="textset-tit">상품 조회</h2>
                    </div>
                    <input type="hidden" name="userId" value="${sessionScope.user.userId}">
                    <input type="hidden" name="userName" value="${sessionScope.user.userName}">
                    <input type="hidden" name="phone" value="${sessionScope.user.phone}">
                    <input type="hidden" name="email" value="${sessionScope.user.email}">

                    <c:if test="${userStatus == 0}">
                        <h2>팝콘</h2>
                        <p class="contents-result">
                            전체<span> ${totalCountPopcorn}</span> 개
                        </p>
                        <div class="contents-group">
                            <div class="contents-cardlist contents-cardlist-active">
                                <c:set var="i" value="0"/>
                                <c:forEach var="popcorn" items="${ popcornList }">
                                <c:set var="i" value="${i+1}"/>
                                <div class="cardset">
                                    <figure class="cardset-figure">
                                        <img class="cardset-img" src="/file/product/${popcorn.prodImage}" alt="이미지">
                                    </figure>
                                    <div class="cardset-body">
                                        <div class="cardset-tit-group">
                                            <h5 class="cardset-tit">
                                                ${popcorn.prodName}
                                            </h5>
                                        </div>
                                        <div class=".contents-info">
                                            <div class="prodCnt">
                                                팝콘 개수 &nbsp;:&nbsp; <fmt:formatNumber value="${popcorn.prodCnt}" pattern="#,##0"/> 개
                                            </div>
                                            <div class="prodPrice">
                                                팝콘 가격 &nbsp;:&nbsp; <fmt:formatNumber value="${popcorn.prodPrice}" pattern="#,##0"/> 원
                                            </div>
                                            <div class="contents-date">
                                                팝콘 등록일 &nbsp;:&nbsp; ${popcorn.prodDate}
                                            </div>
                                        </div>
                                        <div class="contents-button">
                                            <c:if test="${sessionScope.user.role == 0}">
                                                <c:if test="${popcorn.prodCnt == 1}">
                                                    <input type="text" min="1" value="1" name="tranCnt"
                                                           style="width: 70px; margin-bottom: 1rem;"> 개&nbsp;&nbsp;
                                                </c:if>
                                                <c:if test="${popcorn.prodCnt != 1}">
                                                    <input type="hidden" value="1" name="tranCnt">
                                                </c:if>
                                                <input type="button" value="충전하기">
                                            </c:if>
                                            <c:if test="${sessionScope.user.role == 1}">
                                                <input type="button" value="수정하기"><br>
                                                <input type="button" value="삭제하기"><br>
                                            </c:if>
                                        </div>
                                    </div>
                                </div>
                                </c:forEach>
                            </div>
                        </div>
                    </c:if>
                </div>
            </div>
    </div>

    <!-- [S]opilsol-N24 -->
    <div class="hooms-N36" data-bid="iSLqLSg68L">
        <div class="contents-inner">
            <div class="content-container container-md">
                <form name="form" method="post">
                    <input type="hidden" name="userStatus" value="${userStatus}">
                    <input type="hidden" name="tranCategory" value="">
                    <input type="hidden" name="condition" value="${condition}">
                    <h2>저작권</h2>
                    <div class="contents-form">
                        <p class="contents-result">
                        전체<span> ${totalCountCopyright}</span> 개
                        </p>
                        <div class="inputset inputset-lg">
                            <button class="inputset-icon icon-right icon-search btn" type="button"
                                    aria-label="아이콘"></button>
                            <input type="text" class="inputset-input form-control" name="searchKeyword"
                                   placeholder="작품명 또는 작가 닉네임을 입력해 주세요." aria-label="내용"
                                   value="${!empty search.searchKeyword ? search.searchKeyword : ''}">
                        </div>
                    </div>
                </form>
                <div class="contents-group">
                    <div class="contents-cardlist contents-cardlist-active">
                        <c:set var="i" value="0"/>
                        <c:forEach var="copyright" items="${ copyrightList }">
                        <c:set var="i" value="${i+1}"/>
                        <div class="cardset cardset-hor">
                            <input type="hidden" name="prodNo" value="${copyright.prodNo}">
                            <div class="no">${i}</div>
                            <figure class="cardset-figure">
                                <img class="cardset-img"
                                     src="${copyright.prodImage}" alt="이미지">
                            </figure>
                            <div class="cardset-body">
                                <div class="cardset-tit-group">
                                    <h5 class="cardset-tit">
                                            ${copyright.prodName}
                                    </h5>
                                    <br>
                                </div>
                                <div class=".contents-info">
                                    <div class="viewWork">
                                        <input type="hidden" name="workNo" value="${copyright.workNo}">
                                        작품명&nbsp; : &nbsp;${copyright.workName}
                                    </div>
                                    <div class="contents-name">
                                        <input type="hidden" name="userId" value="${copyright.userId}">
                                        작가명&nbsp; : &nbsp;${copyright.nickname}
                                    </div>
                                    <div class="prodPrice">
                                        저작권 가격&nbsp; : &nbsp;<fmt:formatNumber value="${copyright.prodPrice}" pattern="#,##0"/> 팝콘
                                    </div>
                                    <div class="episodeOrder">
                                        완결 회차&nbsp; : &nbsp;<fmt:formatNumber value="${copyright.episodeOrder}" pattern="#,##0"/> 회차 완결
                                    </div>
                                    <div class="contents-date">
                                        등록일&nbsp; : &nbsp;${copyright.prodDate}
                                    </div>
                                </div>
                            </div>
                                <div class="contents-button">
                                    <c:if test="${!empty sessionScope.user}">
                                        <c:if test="${copyright.userId != sessionScope.user.userId}">
                                            <c:if test="${copyright.purchaseCheck == 1}">
                                                구매 완료!
                                            </c:if>
                                            <c:if test="${copyright.purchaseCheck == 0}">
                                                <input type="button" class="purchase" value="구매하기">
                                            </c:if>
                                            <input type="hidden" name="popcornCnt" value="${sessionScope.user.popcornCnt}">
                                        </c:if>
                                        <c:if test="${copyright.userId == sessionScope.user.userId}">
                                            <input type="button" class="update" value="수정하기"><br>
                                            <input type="button" class="delete" value="삭제하기"><br>
                                        </c:if>
                                    </c:if>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
                <br><br>
            </div>
        </div>
    </div>

</main>


<%@ include file="../layout/bottom.jsp" %>

</body>

</html>