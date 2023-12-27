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

    <!-- [S]opilsol-N24 -->
    <div class="hooms-N36" data-bid="fdLqmbY43s">
        <div class="contents-inner">
            <div class="content-container container-md">
                <div class="textset textset-h2">
                    <h2 class="textset-tit">팝콘 총 매출</h2>
                </div>
                <form name="form" method="post">
                    <input type="hidden" name="tranCategory" value="${tranCategory}">
                    <input type="hidden" name="condition" value="${condition}">
                    <input type="hidden" name="userStatus" value="${userStatus}">
                </form>
                <div class="contents-form">
                    <p class="contents-result">
                        전체<span> ${totalCount}</span> 개
                    </p>
                </div>


<%--                <select name="condition" class="selectset selectset-lg">--%>
<%--                    <option value="0" class="selectset-item"--%>
<%--                    ${!empty condition && condition.equals("0") ? "selected" : ""}>--%>
<%--                        전체--%>
<%--                    </option>--%>
<%--                    <option value="1" class="selectset-item"--%>
<%--                    ${!empty condition && condition.equals("1") ? "selected" : ""}>--%>
<%--                        일별--%>
<%--                    </option>--%>
<%--                    <option value="2" class="selectset-item"--%>
<%--                    ${!empty condition && condition.equals("2") ? "selected" : ""}>--%>
<%--                        월별--%>
<%--                    </option>--%>
<%--                </select>--%>

                <div class="tableset">
                        <table class="tableset-table table">
                            <colgroup>
                                <col>
                                <col>
                                <col>
                                <col>
                                <col>
                            </colgroup>
                            <thead class="thead-light thead-border-top">
                            <tr>
                                <th scope="col">NO.</th>
                                <th scope="col">기간</th>
                                <th scope="col">총 구매 팝콘수</th>
                                <th scope="col">총 팝콘 구매 금액</th>
                                <th scope="col">총 소비 팝콘수</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:set var="i" value="0"/>
                            <c:forEach var="purchaseCnt" items="${ list }">
                                <c:set var="i" value="${i+1}"/>
                                <tr>
                                    <td class="tableset-mobile">
                                            ${i}
                                    </td>
                                    <td class="tableset-category tableset-order03">
                                            <c:if test="${purchaseCnt.date == ''}">
                                                전체
                                            </c:if>
                                            <c:if test="${purchaseCnt.date != ''}">
                                                ${purchaseCnt.date}
                                            </c:if>
                                    </td>
                                    <td class="tableset-tit tableset-order02">
                                            <fmt:formatNumber value="${purchaseCnt.purchasePopcornCnt}" pattern="#,##0"/> 팝콘
                                    </td>
                                    <td class="tableset-tit tableset-order02">
                                            <fmt:formatNumber value="${purchaseCnt.purchasePrice}" pattern="#,##0"/> 원
                                    </td>
                                    <td class="tableset-tit tableset-order02">
                                            <fmt:formatNumber value="${purchaseCnt.usePopcornCnt}" pattern="#,##0"/> 팝콘
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