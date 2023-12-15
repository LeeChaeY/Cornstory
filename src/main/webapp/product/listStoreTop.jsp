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

    <script src="/lcy/js/listStoreTop.js"></script>
</head>

<body>

<!-- [E]thwhole-lNlPW5z3lS -->
<!-- [S]opilsol-N26 -->
<div class="opilsol-N26" data-bid="sblQ1o2joM">
    <div class="content-container">
        <div class="contents-form container-md">
            <div class="contents-form-top d-flex justify-content-between">
                <h3 class="inputset-tit">스토어</h3>
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
                        <span>구매 내역</span>
                    </label>
                </div>
                <div class="checkset">
                    <input id="checkset-e-5-6" class="visually-hidden" type="radio" name="inquiryType" value="">
                    <label class="checkset-thumb" for="checkset-e-5-6">
                        <span>판매 내역</span>
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

</body>

</html>