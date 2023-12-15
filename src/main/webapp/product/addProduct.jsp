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
    <title>addProduct</title>
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

    <script src="/lcy/js/addProduct.js"></script>
</head>

<body>

<%@ include file="../layout/top.jsp" %>

<%@ include file="../product/listStoreTop.jsp" %>

<!-- [E]opilsol-N26 -->
<main class="th-layout-main ">
    <!-- [S]opilsol-N27 -->
    <div class="opilsol-N27" data-bid="Si2cLPRPujy">
        <div class="content-container">
            <div class="contents-form container-md">
                <div class="contents-form-top d-flex justify-content-between">
                    <c:if test="${prodCategory == 0}">
                        <h3 class="inputset-tit">팝콘 등록하기</h3>
                    </c:if>
                    <c:if test="${prodCategory == 2}">
                        <h3 class="inputset-tit">저작권 등록하기</h3>
                    </c:if>
                    <span class="req">필수 선택입니다.</span>
                </div>

                <form name="form" method="post">
                    <input type="hidden" name="userId" value="${userId}">
                    <input type="hidden" name="sessionUserId" value="${sessionScope.user.userId}">
                    <input type="hidden" name="tranCategory" value="">
                </form>

                <div class="contents-form tableset">
                    <div class="tableset-inner">
                        <form name="addProduct" enctype="multipart/form-data">
                            <input type="hidden" name="prodCategory" value="${prodCategory}">
                            <table class="tableset-table table">
                                <colgroup>
                                    <col>
                                    <col>
                                    <col>
                                </colgroup>
                                <tbody>
                                <c:if test="${prodCategory == 0}">
                                    <tr>
                                        <th>
                                            <label class="req label">팝콘 수량</label>
                                        </th>
                                        <td>
                                            <input type="number" min="1" value="1" name="prodCnt" required=""> 개
                                            <p class="prodNameCheck" style="color: red; display: none;">
                                                해당 수량의 팝콘이 등록되어있습니다.
                                            </p>
                                            <p class="check" style="color: red; display: none;">
                                                팝콘 수량은 1개 이상부터 가능합니다.
                                            </p>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>
                                            <label class="req label">팝콘 가격</label>
                                        </th>
                                        <td>
                                            <div class="inputset">
                                                <input type="number" min="100" value="100" name="prodPrice" required="">
                                                원<br><br>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>
                                            <span class="label">팝콘 이미지 첨부</span>
                                        </th>
                                        <td colspan="2">
                                            <div class="fileset fileset-lg fileset-label">
                                                <label>
                                                    <div class="fileset-body">
                                                        <div class="fileset-group">
                                                            <input type="file" class="fileset-input" name="file">
                                                            <button class="fileset-cancel"></button>
                                                        </div>
                                                        <span class="btnset btnset-line btnset-mono btnset-lg btnset-rect fileset-upload">팝콘 이미지 첨부</span>
                                                    </div>
                                                </label>
                                            </div>
                                            <p class="p1 co-text3">이미지 형식의 jpg만 첨부 가능합니다.</p>
                                            <p class="p1 co-text3">첨부파일은 10MB를 초과할 수 없으며, 최대 1개까지 가능합니다.</p>
                                        </td>
                                        <td colspan="1">
                                            * 기본 팝콘 이미지<br><br>
                                            <img width="100px" height="100px" src="/file/product/popcorn.jpg">
                                        </td>
                                    </tr>
                                </c:if>

                                <c:if test="${prodCategory == 2}">
                                    <tr>
                                        <th>
                                            <input type="file" name="file" style="display: none;">
                                            <input type="hidden" name="workNo" value="">
                                            <label class="req label">작품 이름</label>
                                        </th>
                                        <td>
                                            <select name="workSelect">
                                                <option>작품 선택</option>
                                                <c:set var="i" value="0"/>
                                                <c:forEach var="work" items="${ workList }">
                                                    <c:set var="i" value="${i+1}"/>
                                                    <option value="${work.workNo}" name="workNo">
                                                            ${work.workName}
                                                        <input type="hidden" name="${work.workNo}" value="${work.fap}">
                                                    </option>
                                                </c:forEach>
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>
                                            <label class="req label">저작권 가격</label>
                                        </th>
                                        <td>
                                            <div class="inputset">
                                                <input type="number" min="0" value="100" name="prodPrice" required="">
                                                <span class="free" style="display: none;">0</span> 개<br>
                                                <p class="freeCheck" style="color: red; display: none;">
                                                    무료인 작품의 저작권 가격은 팝콘 0개입니다.
                                                </p>
                                            </div>
                                        </td>
                                    </tr>
                                </c:if>
                                </tbody>
                            </table>
                        </form>
                        <br>
                        <div class="bottom-btn">
                            <input type="button" class="btnset btnset-lg btnset-dark btnset-rect" value="취소"/>
                            <input type="button" class="btnset btnset-lg btnset-rect" value="등록"/>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- [E]opilsol-N27 -->
</main>

<%@ include file="../layout/bottom.jsp" %>

</body>

</html>