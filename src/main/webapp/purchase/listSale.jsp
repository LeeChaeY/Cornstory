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

    <script src="/lcy/js/listSale.js"></script>
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
                    <input type="hidden" name="condition" value="${condition}">
                    <input type="hidden" name="userStatus" value="${userStatus}">
                    <div class="inputset inputset-line inputset-lg">
                        <button class="listStoreSearchButton inputset-icon icon-right icon-search btn"
                                type="button"
                                aria-label="아이콘"></button>
                        <input type="text" class="inputset-input form-control" name="searchKeyword"
                               placeholder="작품 이름을 입력해 주세요." aria-label="내용"
                               value="${!empty search.searchKeyword ? search.searchKeyword:''}">
                    </div>
                </form>
                <br>
                <br><br>

                <div class="tableset">
                    <div class="tableset-inner">
                        <h3>판매 내역</h3> 전체 ${totalCount} 개 <br>
                        <p align="right">* 회차가 등록된 작품만 보여집니다.</p>
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
                            <thead class="thead-border-top">
                            <tr>
                                <th class="number" scope="col">NO</th>
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
                                    <td class="number">
                                            <input type="hidden" name="workNo" value="${workSale.work_no}">
                                            ${i}
                                    </td>
                                    <c:if test="${sessionScope.user.role == 1}">
                                        <td>
                                                ${workSale.nickname}
                                        </td>
                                    </c:if>
                                    <td>
                                            ${workSale.workName}
                                    </td>
                                    <td>
                                            <c:if test="${workSale.category == 0}">웹소설</c:if>
                                            <c:if test="${workSale.category == 1}">웹툰</c:if>
                                            <c:if test="${workSale.category == 2}">웹드라마</c:if>
                                    </td>
                                    <td>
                                            ${workSale.workPrice} 팝콘
                                    </td>
                                    <td>
                                            ${workSale.workUserCount} 명
                                    </td>
                                    <td>
                                            ${workSale.workTotalPrice} 팝콘
                                    </td>
                                    <td>
                                            <c:if test="${workSale.copyPrice == -1}">
                                                저작권 등록 X
                                            </c:if>
                                            <c:if test="${workSale.copyPrice != -1}">
                                                ${workSale.copyPrice} 팝콘
                                            </c:if>
                                    </td>
                                    <td>
                                            ${workSale.copyUserCount} 명
                                    </td>
                                    <td>
                                            ${workSale.copyTotalPrice} 팝콘
                                    </td>
                                    <td>
                                            ${workSale.workTotalPrice + workSale.copyTotalPrice} 팝콘
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