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
    <title>listSale</title>
    <link rel="stylesheet" href="/lcy/css/style.css">


    <!-- [E]thwhole-wfLpW5Z3pJ -->
    <script src="/ssh/js/setting.js"></script>
    <script src="/ssh/js/plugin.js"></script>
    <script src="/ssh/js/template.js"></script>
    <script src="/ssh/js/common.js"></script>
    <script src="/ssh/js/script.js"></script>

    <script src="/lcy/js/listSale.js"></script>
</head>

<body>

<%@ include file="../layout/top.jsp" %>


<!-- [E]opilsol-N26 -->
<main class="th-layout-main ">
    <div class="thpart-HmlqLtFlNZ" data-bid="HmlqLtFlNZ">
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

    <div class="hooms-N36" data-bid="fdLqmbY43s">
        <div class="contents-inner">
            <div class="content-container container-md">
                <div class="textset textset-h2">
                    <h2 class="textset-tit">판매 내역</h2>
                    <c:if test="${sessionScope.user.role == 0}">
                        <br><a href="javascript:void(0)" style="text-align: center; display: block;">나의 저작권</a>
                    </c:if>
                    <c:if test="${sessionScope.user.role == 1}">
                        <br><a href="javascript:void(0)" style="text-align: center; display: block;">팝콘 총 매출</a>
                    </c:if>
                </div>
                <form name="form" method="post">
                    <div class="contents-form">
                        <p class="contents-result">
                            전체<span> ${totalCount}</span> 개
                        </p>
                        <div class="inputset inputset-lg">
                            <button class="inputset-icon icon-right icon-search btn" type="button"
                                    aria-label="아이콘"></button>
                            <input type="text" class="inputset-input form-control" name="searchKeyword"
                                   placeholder="작품 이름을 입력해 주세요." aria-label="내용"
                                   value="${!empty search.searchKeyword ? search.searchKeyword:''}">
                        </div>
                        <input type="hidden" name="tranCategory" value="${tranCategory}">
                        <input type="hidden" name="condition" value="${condition}">
                        <input type="hidden" name="userStatus" value="${userStatus}">
                    </div>
                </form>
                <p style="font-weight: bold;">
                    * 작가가 등록한 작품에 대한 작품 회차 및 저작권 판매 현황입니다.<br>
                    * 작품 회차 및 저작권의 가격, 구매 인원, 그에 따른 누적 팝콘수를 확인할 수 있습니다.<br>
                    * 작품 저작권 미등록 시 저작권 가격은 저작권 등록 X로 표시되며 구매 인원 및 누적 팝콘수은 0으로 표시됩니다.<br>
                    * 회차가 등록된 작품만 보여집니다.<br>
                </p><br>

                <c:if test="${empty workList}">
                    <div class="contents-ico">
                        <figure class="contents-figure">
                            <img class="cardset-img"
                                 src="https://temha.io/api/t-a/56/1703523600/resources/icons/ico_plus_circle.svg"
                                 alt="체크아이콘">
                            <h4>작품 등록하러가기</h4>
                        </figure>
                        <h3>회차가 등록된 작품이 없습니다.</h3>
                    </div>
                </c:if>

                <c:if test="${!empty workList}">
                <div class="tableset">
                    <table class="tableset-table table">
                        <colgroup>
                            <col>
                            <c:if test="${sessionScope.user.role == 1}">
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
                            <th scope="col">작품 이름</th>
                            <th scope="col">카테고리</th>
                            <th scope="col">작품 회차 가격</th>
                            <th scope="col">작품 구매 인원</th>
                            <th scope="col">작품 누적 팝콘수</th>
                            <th scope="col">저작권 가격</th>
                            <th scope="col">저작권 구매 인원</th>
                            <th scope="col">저작권 누적 팝콘수</th>
                            <th scope="col">누적 판매 팝콘수</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:set var="i" value="0"/>
                        <c:forEach var="workSale" items="${ workList }">
                            <c:set var="i" value="${i+1}"/>
                            <tr>
                                <td class="tableset-mobile">
                                    <input type="hidden" name="workNo" value="${workSale.work_no}">
                                        ${i}
                                </td>
                                <c:if test="${sessionScope.user.role == 1}">
                                    <td class="tableset-category tableset-order03">
                                            ${workSale.nickname}
                                    </td>
                                </c:if>
                                <td class="tableset-tit tableset-order02">
                                        ${workSale.workName}
                                </td>
                                <td class="tableset-category tableset-order03">
                                    <c:if test="${workSale.category == 0}">웹소설</c:if>
                                    <c:if test="${workSale.category == 1}">웹툰</c:if>
                                    <c:if test="${workSale.category == 2}">웹드라마</c:if>
                                </td>
                                <td class="tableset-tit tableset-order02">
                                        ${workSale.workPrice} 팝콘
                                </td>
                                <td class="tableset-tit tableset-order02">
                                    <fmt:formatNumber value="${workSale.workUserCount}" pattern="#,##0"/> 명
                                </td>
                                <td class="tableset-tit tableset-order02">
                                    <fmt:formatNumber value="${workSale.workTotalPrice}" pattern="#,##0"/> 팝콘
                                </td>
                                <td class="tableset-tit tableset-order02">
                                    <c:if test="${workSale.copyPrice == -1}">
                                        저작권 등록 X
                                    </c:if>
                                    <c:if test="${workSale.copyPrice != -1}">
                                        <fmt:formatNumber value="${workSale.copyPrice}" pattern="#,##0"/> 팝콘
                                    </c:if>
                                </td>
                                <td class="tableset-tit tableset-order02">
                                    <fmt:formatNumber value="${workSale.copyUserCount}" pattern="#,##0"/> 명
                                </td>
                                <td class="tableset-tit tableset-order02">
                                    <fmt:formatNumber value="${workSale.copyTotalPrice}" pattern="#,##0"/> 팝콘
                                </td>
                                <td class="tableset-tit tableset-order02">
                                    <fmt:formatNumber value="${workSale.workTotalPrice + workSale.copyTotalPrice}"
                                                      pattern="#,##0"/> 팝콘
                                </td>
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
    <!-- [E]opilsol-N24 -->
</main>

<%@ include file="../layout/bottom.jsp" %>

</body>

</html>