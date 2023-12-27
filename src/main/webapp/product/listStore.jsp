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
    <script src="https://cdn.iamport.kr/v1/iamport.js"></script>
</head>

<body>

<%@ include file="../layout/top.jsp" %>

<%@ include file="../product/listStoreTop.jsp" %>

<!-- [E]opilsol-N26 -->
<main class="th-layout-main">
    <!-- [S]opilsol-N24 -->
    <div class="opilsol-N24" data-bid="XZlQ1o5z61">
        <div class="content-container">
            <input type="hidden" name="userId" value="${sessionScope.user.userId}">
            <input type="hidden" name="userName" value="${sessionScope.user.userName}">
            <input type="hidden" name="phone" value="${sessionScope.user.phone}">
            <input type="hidden" name="email" value="${sessionScope.user.email}">
            <c:if test="${userStatus == 0}">
                <div class="container-md">
                    <div class="tableset">
                        <div class="tableset-inner">
                            <h3>팝콘</h3> 전체 ${totalCountPopcorn} 개
                            <table class="tableset-table table">
                                <colgroup>
                                    <col>
                                    <col>
                                    <col>
                                    <col>
                                    <col>
                                    <col>
                                    <col width="150">
                                </colgroup>
                                <thead class="thead-border-top">
                                <tr>
                                    <th class="number" scope="col">NO</th>
                                    <th scope="col">팝콘 이미지</th>
                                    <th scope="col">팝콘 이름</th>
                                    <th scope="col">팝콘 개수</th>
                                    <th scope="col">팝콘 가격</th>
                                    <th scope="col">팝콘 등록일</th>
                                    <th class="last-child" scope="col"></th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:set var="i" value="0"/>
                                <c:forEach var="popcorn" items="${ popcornList }">
                                    <c:set var="i" value="${i+1}"/>
                                    <tr>
                                        <td class="number">
                                            <input type="hidden" name="prodNo" value="${popcorn.prodNo}">
                                                ${i}
                                        </td>
                                        <td>
                                            <img width="100px" height="100px" src="/file/product/${popcorn.prodImage}">
                                        </td>
                                        <td>
                                                ${popcorn.prodName}
                                        </td>
                                        <td>
                                            <fmt:formatNumber value="${popcorn.prodCnt}" pattern="#,##0"/> 개
                                        </td>
                                        <td>
                                                <fmt:formatNumber value="${popcorn.prodPrice}" pattern="#,##0"/> 원
                                        </td>
                                        <td>
                                                ${popcorn.prodDate}
                                        </td>
                                        <td class="last-child">
                                            <c:if test="${sessionScope.user.role == 0}">
                                                <c:if test="${popcorn.prodCnt == 1}">
                                                    <input type="text" min="1" value="1" name="tranCnt"
                                                           style="width: 70px; margin-bottom: 1rem;"> 개<br>
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
                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <br><br>
            </c:if>

            <div class="content-container">
                <div class="container-md">
                    <div class="tableset">
                        <div class="tableset-inner">
                            <form name="form" method="post">
                                <input type="hidden" name="userStatus" value="${userStatus}">
                                <input type="hidden" name="tranCategory" value="">
                                <input type="hidden" name="condition" value="${condition}">
                                <div class="listStoreSearch inputset inputset-line inputset-lg">
                                    <button class="listStoreSearchButton inputset-icon icon-right icon-search btn"
                                            type="button" aria-label="아이콘"></button>
                                    <input type="text" name="searchKeyword" class="inputset-input form-control"
                                           placeholder="작품명 또는 작가 닉네임을 입력해 주세요."
                                           aria-label="내용"
                                           value="${!empty search.searchKeyword ? search.searchKeyword : ''}">
                                </div>
                            </form>
                            <br>

                            <h3>저작권</h3> 전체 ${totalCountCopyright} 개
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
                                    <th scope="col">저작권 이미지</th>
                                    <th scope="col">저작권 이름</th>
                                    <th scope="col">작품명</th>
                                    <th scope="col">저작권 가격</th>
                                    <th scope="col">완결 회차</th>
                                    <th scope="col">등록일</th>
                                    <th scope="col">작가명</th>
                                    <th class="last-child" scope="col"></th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:set var="i" value="0"/>
                                <c:forEach var="copyright" items="${ copyrightList }">
                                    <c:set var="i" value="${i+1}"/>
                                    <tr>
                                        <td class="number">
                                            <input type="hidden" name="prodNo" value="${copyright.prodNo}">
                                                ${i}
                                        </td>
                                        <td>
                                            <img width="100px" height="100px" src="/file/work/${copyright.prodImage}">
                                        </td>
                                        <td>
                                                ${copyright.prodName}
                                        </td>
                                        <td class="viewWork">
                                            <input type="hidden" name="workNo" value="${copyright.workNo}">
                                                ${copyright.workName}
                                        </td>
                                        <td>
                                                <fmt:formatNumber value="${copyright.prodPrice}" pattern="#,##0"/> 팝콘
                                        </td>
                                        <td>
                                                <fmt:formatNumber value="${copyright.episodeOrder}" pattern="#,##0"/> 회차 완결
                                        </td>
                                        <td>
                                                ${copyright.prodDate}
                                        </td>
                                        <td class="viewUser">
                                            <input type="hidden" name="userId" value="${copyright.userId}">
                                                ${copyright.nickname}
                                        </td>
                                        <td class="last-child">
                                            <c:if test="${!empty sessionScope.user}">
                                                <c:if test="${copyright.userId != sessionScope.user.userId}">
                                                    <input type="button" value="구매하기">
                                                    <input type="hidden" name="popcornCnt" value="${sessionScope.user.popcornCnt}">
                                                </c:if>
                                                <c:if test="${copyright.userId == sessionScope.user.userId}">
                                                    <input type="button" value="수정하기"><br>
                                                    <input type="button" value="삭제하기"><br>
                                                </c:if>
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
    </div>
    <!-- [E]opilsol-N24 -->
</main>


<%@ include file="../layout/bottom.jsp" %>

</body>

</html>