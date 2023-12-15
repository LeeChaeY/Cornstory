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

    <script src="/lcy/js/listPurchase.js"></script>
</head>

<body>

<%@ include file="../layout/top.jsp" %>

<%@ include file="../product/listStoreTop.jsp" %>

<!-- [E]opilsol-N26 -->
<main class="th-layout-main ">
    <!-- [S]opilsol-N24 -->
    <div class="opilsol-N24" data-bid="bZ2ClR05J8P" style="margin-left: 0px;" id="">
        <div class="content-container">
            <div class="container-md">
                <form name="form" method="post">
                    <input type="hidden" name="tranCategory" value="${tranCategory}">
                    <input type="hidden" name="userStatus" value="${userStatus}">
                </form>

                <div class="radioset-wrap">
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
                </div><br><br>

                <div class="tableset">
                    <div class="tableset-inner">
                        <h3>팝콘 충전 내역</h3> 전체 ${totalCount} 개 <br>
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
                            <thead class="thead-border-top">
                            <tr>
                                <th class="number" scope="col">NO</th>
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
                                    <td class="number">
                                        <input type="hidden" name="prodNo" value="${purchase.prodNo}">
                                        <input type="hidden" name="tranNo" value="${purchase.tranNo}">
                                            ${i}
                                    </td>
                                    <c:if test="${sessionScope.user.role == 1}">
                                        <td>
                                                ${purchase.nickname}
                                        </td>
                                    </c:if>
                                    <td>
                                            ${purchase.prodCnt} 개
                                    </td>
                                    <td>
                                            ${purchase.prodPrice} 원
                                    </td>
                                    <td>
                                            <c:if test="${purchase.tranMethod == 0}">팝콘</c:if>
                                            <c:if test="${purchase.tranMethod == 1}">카카오페이</c:if>
                                            <c:if test="${purchase.tranMethod == 2}">토스페이</c:if>
                                            <c:if test="${purchase.tranMethod == 3}">카드</c:if>
                                    </td>
                                    <td>
                                            ${purchase.tranCnt} 개
                                    </td>
                                    <td>
                                            ${purchase.tranCnt * purchase.prodPrice} 원
                                    </td>
                                    <td>
                                            ${purchase.bfPopcornCnt} 팝콘
                                    </td>
                                    <td>
                                            ${purchase.afPopcornCnt} 팝콘
                                    </td>
                                    <td>
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
            </div>
        </div>
    </div>
    <!-- [E]opilsol-N24 -->
</main>

<%@ include file="../layout/bottom.jsp" %>

</body>

</html>