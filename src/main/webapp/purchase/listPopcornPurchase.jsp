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
    <title>listPopcornPurchase</title>

    <link rel="stylesheet" href="/lcy/css/style.css">

    <!-- [E]thwhole-wfLpW5Z3pJ -->
    <script src="/ssh/js/setting.js"></script>
    <script src="/ssh/js/plugin.js"></script>
    <script src="/ssh/js/template.js"></script>
    <script src="/ssh/js/common.js"></script>
    <script src="/ssh/js/script.js"></script>

    <script src="/lcy/js/listPurchase.js"></script>
    <script src="/lcy/js/listStoreTop.js"></script>
</head>

<body>

<%@ include file="../layout/top.jsp" %>

<!-- [E]opilsol-N26 -->
<main class="th-layout-main ">
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



    <!-- [S]opilsol-N24 -->
    <div class="hooms-N36" data-bid="fdLqmbY43s">
        <div class="contents-inner">
            <div class="content-container container-md">
                <div class="textset textset-h2">
                    <h2 class="textset-tit">구매 내역</h2>
                </div>
                <form name="form" method="post">
                    <input type="hidden" name="tranCategory" value="${tranCategory}">
                    <input type="hidden" name="userStatus" value="${userStatus}">
                </form>
                <div class="contents-form">
                    <p class="contents-result">
                        전체<span> ${totalCount}</span> 개
                    </p>
                </div>

                <div class="radioset-wrap" style="margin-bottom: 0.5rem;">
                    <div class="radioset">
                        <input id="radioset-c-1-1" name="radioset-c-1" class="visually-hidden" type="radio" value="" checked="">
                        <label class="radioset-thumb thumb-round" for="radioset-c-1-1">
                            <span>팝콘 충전 내역</span>
                        </label>
                    </div>
                    <div class="radioset">
                        <input id="radioset-c-1-2" name="radioset-c-1" class="visually-hidden" type="radio" value="">
                        <label class="radioset-thumb thumb-round" for="radioset-c-1-2">
                            <span>작품 회차 구매 내역</span>
                        </label>
                    </div>
                    <div class="radioset">
                        <input id="radioset-c-1-3" name="radioset-c-1" class="visually-hidden" type="radio" value="">
                        <label class="radioset-thumb thumb-round" for="radioset-c-1-3">
                            <span>저작권 구매 내역</span>
                        </label>
                    </div>
                </div>

                <c:if test="${empty list}">
                    <br><br><br>
                    <div class="contents-ico">
                        <figure class="contents-figure">
                            <img class="cardset-img" src="https://temha.io/api/t-a/56/1703523600/resources/icons/ico_plus_circle.svg"
                                 alt="체크아이콘">
                            <h4>충전하러가기</h4>
                        </figure>
                        <h3>팝콘 충전 내역이 없습니다.</h3>
                    </div>
                </c:if>

                <c:if test="${!empty list}">
                    <div class="tableset">
                            <table class="tableset-table table">
                                <colgroup>
                                    <col>
                                    <c:if test="${sessionScope.user.role == 1}">
                                        <col>
                                        <col>
                                    </c:if>
                                    <col>
                                    <col>
                                    <col>
                                    <col>
                                    <col>
                                    <col>
                                    <col>
                                    <col>
                                </colgroup>
                                <thead class="thead-light thead-border-top">
                                <tr>
                                    <th scope="col">NO.</th>
                                    <c:if test="${sessionScope.user.role == 1}">
                                        <th scope="col">닉네임</th>
                                    </c:if>
                                    <th scope="col">팝콘 수량</th>
                                    <th scope="col">팝콘 가격</th>
                                    <th scope="col">구매수단</th>
                                    <th scope="col">구매 수량</th>
                                    <th scope="col">총 팝콘 가격</th>
                                    <th scope="col">구매 전 팝콘수</th>
                                    <th scope="col">구매 후 팝콘수</th>
                                    <c:if test="${sessionScope.user.role == 0}">
                                        <th class="last-child" scope="col">구매일</th>
                                    </c:if>
                                    <c:if test="${sessionScope.user.role == 1}">
                                        <th scope="col">구매일</th>
                                    </c:if>
                                    <c:if test="${sessionScope.user.role == 1}">
                                        <th class="last-child" scope="col"></th>
                                    </c:if>
                                </tr>
                                </thead>
                                <tbody>
                                <c:set var="i" value="0"/>
                                <c:forEach var="purchase" items="${ list }">
                                    <c:set var="i" value="${i+1}"/>
                                    <tr>
                                        <td class="tableset-mobile">
                                            <input type="hidden" name="prodNo" value="${purchase.prodNo}">
                                            <input type="hidden" name="tranNo" value="${purchase.tranNo}">
                                                ${i}
                                        </td>
                                        <c:if test="${sessionScope.user.role == 1}">
                                            <td class="tableset-category tableset-order03">
                                                    ${purchase.nickname}
                                            </td>
                                        </c:if>
                                        <td class="tableset-tit tableset-order02">
                                                <fmt:formatNumber value="${purchase.prodCnt}" pattern="#,##0"/> 개
                                        </td>
                                        <td class="tableset-tit tableset-order02">
                                                <fmt:formatNumber value="${purchase.prodPrice}" pattern="#,##0"/> 원
                                        </td>
                                        <td class="tableset-category tableset-order03">
                                                ${purchase.tranMethod}
                                        <td class="tableset-tit tableset-order02">
                                                <fmt:formatNumber value="${purchase.tranCnt}" pattern="#,##0"/> 개
                                        </td>
                                        <td class="tableset-tit tableset-order02">
                                                <fmt:formatNumber value="${purchase.tranCnt * purchase.prodPrice}" pattern="#,##0"/> 원
                                        </td>
                                        <td class="tableset-tit tableset-order02">
                                                <fmt:formatNumber value="${purchase.bfPopcornCnt}" pattern="#,##0"/> 팝콘
                                        </td>
                                        <td class="tableset-tit tableset-order02">
                                                <fmt:formatNumber value="${purchase.afPopcornCnt}" pattern="#,##0"/> 팝콘
                                        </td>
                                        <td class="tableset-order04">
                                                ${purchase.tranDate}
                                        </td>
                                        <c:if test="${sessionScope.user.role == 1}">
                                            <td>
                                                <input type="button" value="삭제하기"><br>
                                            </td>
                                        </c:if>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </c:if>
                <br><br>
            </div>
        </div>
    </div>
    <!-- [E]opilsol-N24 -->
</main>

<%@ include file="../layout/bottom.jsp" %>

</body>

</html>