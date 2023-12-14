<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

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
    <title>listPurchase</title>
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

    <script src="/lcy/js/listStore.js"></script>
</head>

<body>

<%@ include file="../layout/top.jsp" %>

<!-- [E]thwhole-lNlPW5z3lS -->
<!-- [S]opilsol-N26 -->
<div class="opilsol-N26" data-bid="sblQ1o2joM">
    <div class="content-container">
        <div class="contents-form container-md">
            <div class="contents-form-top d-flex justify-content-between">
                <h3 class="inputset-tit">스토어</h3>
                <div class="dropset dropset-solid">
                    <div class="dropset-head"></div>
                </div>
            </div>
            <div class="checkset-wrap">
                <div class="checkset">
                    <input id="checkset-e-5-1" class="visually-hidden" type="radio" name="inquiryType" value="">
                    <label class="checkset-thumb" for="checkset-e-5-1">
                        <span>상품 조회</span>
                    </label>
                </div>
                <c:if test="${sessionScope.user.role == 0}">
                    <div class="checkset">
                        <input id="checkset-e-5-2" class="visually-hidden" type="radio" name="inquiryType" value="">
                        <label class="checkset-thumb" for="checkset-e-5-2">
                            <span>나의 저작권</span>
                        </label>
                    </div>
                    <div class="checkset">
                        <input id="checkset-e-5-3" class="visually-hidden" type="radio" name="inquiryType" value="">
                        <label class="checkset-thumb" for="checkset-e-5-3">
                            <span>저작권 등록</span>
                        </label>
                    </div>
                </c:if>
                <c:if test="${sessionScope.user.role == 1}">
                    <div class="checkset">
                        <input id="checkset-e-5-4" class="visually-hidden" type="radio" name="inquiryType" value="">
                        <label class="checkset-thumb" for="checkset-e-5-4">
                            <span>팝콘 등록</span>
                        </label>
                    </div>
                </c:if>
                <div class="checkset">
                    <input id="checkset-e-5-5" class="visually-hidden" type="radio" name="inquiryType" value="">
                    <label class="checkset-thumb" for="checkset-e-5-5">
                        <span>팝콘 소비 내역</span>
                    </label>
                </div>
                <div class="checkset">
                    <input id="checkset-e-5-6" class="visually-hidden" type="radio" name="inquiryType" value="" checked="">
                    <label class="checkset-thumb" for="checkset-e-5-6">
                        <span>팝콘 충전 내역</span>
                    </label>
                </div>
                <c:if test="${sessionScope.user.role == 1}">
                    <div class="checkset">
                        <input id="checkset-e-5-7" class="visually-hidden" type="radio" name="inquiryType" value="">
                        <label class="checkset-thumb" for="checkset-e-5-7">
                            <span>팝콘 총 매출</span>
                        </label>
                    </div>
                </c:if>
            </div>
        </div>
    </div>
</div>



<!-- [E]opilsol-N26 -->
<main class="th-layout-main ">
    <!-- [S]opilsol-N24 -->
    <div class="opilsol-N24" data-bid="bZ2ClR05J8P" style="margin-left: 0px;" id="">
        <div class="content-container">
            <div class="container-md">
                <div class="inputset inputset-line inputset-lg">
                    <button class="inputset-icon icon-right icon-search btn" type="button" aria-label="아이콘"></button>
                    <input type="text" class="inputset-input form-control" placeholder="저작권 이름을 입력해 주세요." aria-label="내용">
                </div>
                <br><br>
                <div class="tableset">
                    <div class="tableset-inner">
                        <h3>팝콘 충전 내역</h3> 전체 ${totalCount} 개
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
                                <col>
                            </colgroup>
                            <thead class="thead-border-top">
                            <tr>
                                <th class="number" scope="col">NO</th>
                                <th scope="col">팝콘 수량</th>
                                <th scope="col">팝콘 가격</th>
                                <th scope="col">구매수단</th>
                                <th scope="col">구매 수량</th>
                                <th scope="col">총 팝콘 가격</th>
                                <th scope="col">구매 전 팝콘수</th>
                                <th scope="col">구매 후 팝콘수</th>
                                <th class="last-child" scope="col">구매일</th>
                            </tr>
                            </thead>
                            <tbody>
                            <!--<c:set var="i" value="0"/>
            <c:foreach var="purchase" items="${ list }">
              <c:set var="i" value="${i+1}"/>-->
                            <tr>
                                <td class="number">
                                    <input type="hidden" name="prodNo" value="${purchase.prodNo}">
                                    <input type="hidden" name="tranNo" value="${purchase.tranNo}">
                                        ${i}
                                </td>
                                <td>
                                        ${purchase.prodCnt} 개
                                </td>
                                <td>
                                        ${purchase.prodPrice} 원
                                </td>
                                <td>
                                        ${purchase.tranMethod}
                                </td>
                                <td>
                                        ${purchase.tranCnt} 개
                                </td>
                                <td>
                                        ${purchase.tranCnt} * ${purchase.prodPrice} 원
                                </td>
                                <td>
                                        ${purchase.bfPopcornCnt} 개
                                </td>
                                <td>
                                        ${purchase.afPopcornCnt} 개
                                </td>
                                <td>
                                        ${purchase.tranDate}
                                </td>
                                <td>
                                </td>
                            </tr>
                            <!--</c:foreach>-->
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