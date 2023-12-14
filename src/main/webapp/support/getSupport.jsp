<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
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
    <title>cornstory</title>
    <link rel="stylesheet" href="../ssh/css/setting.css">
    <link rel="stylesheet" href="../ssh/css/plugin.css">
    <link rel="stylesheet" href="../ssh/css/template.css">
    <link rel="stylesheet" href="../ssh/css/common.css">
    <link rel="stylesheet" href="../ssh/css/style.css">
</head>
<%@ include file="../layout/top.jsp" %>
<body>
<!-- [E]opilsol-N2 -->
<main class="th-layout-main ">
    <!-- [S]opilsol-N25 -->
    <div class="opilsol-N24" data-bid="raLq4sT3lu">
        <div class="content-container">
            <div class="container-md">
                <div class="contant-header textset">
                    <h2 class="textset-tit h2">${support.supContent}</h2>
                    <p class="textset-desc p1">${support.supDate}</p>
                </div>
                <div class="contant-body">
                    <p>
                        <span class="br">${support.supPluscon}</span>
                    </p>
                </div>
                <div class="contant-bottom">
                    <div class="contant-nav">

                        <a class="con-link" href="javascript:void(0)">다음 게시물</a>
                        &nbsp; &nbsp; &nbsp;
                        <a class="con-link" href="javascript:void(0)">이전 게시물</a>

                    </div>
                </div>
                <div class="bottom-btn">
                    <a class="btnset btnset-lg btnset-rect" href="<%=request.getContextPath()%>/support/listSupport?category=${support.supCategory}">목록보기</a>
                </div>


            </div>
        </div>
    </div>
    <!-- [E]opilsol-N25 -->
</main>
</body>
</html>
<script src="../ssh/js/setting.js"></script>
<script src="../ssh/js/plugin.js"></script>
<script src="../ssh/js/template.js"></script>
<script src="../ssh/js/common.js"></script>
<script src="../ssh/js/script.js"></script>
<%@ include file="../layout/bottom.jsp" %>
