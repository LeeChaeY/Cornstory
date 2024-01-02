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
    <link rel="stylesheet" href="../support/css/setting.css">
    <link rel="stylesheet" href="../support/css/plugin.css">
    <link rel="stylesheet" href="../support/css/template.css">
    <link rel="stylesheet" href="../support/css/common.css">
    <link rel="stylesheet" href="../support/css/style.css">
</head>
<body>
<%@ include file="../layout/top.jsp" %>
<main class="th-layout-main ">
    <!-- [S]thpart-HmlqLtFlNZ -->
    <div class="thpart-HmlqLtFlNZ" data-bid="HmlqLtFlNZ" id="">
        <div class="contents-container">
            <img class="contents-backimg" src="https://images.unsplash.com/photo-1532276269954-64188308dcb3?crop=entropy&amp;cs=tinysrgb&amp;fit=max&amp;fm=jpg&amp;ixid=M3w0OTE2MDd8MHwxfHNlYXJjaHw0fHwlRUIlQTElOUMlRUElQjclQjglRUMlOUQlQjh8a298MHx8fGJsYWNrfDE3MDM1NjQ1NDB8MA&amp;ixlib=rb-4.0.3&amp;q=80&amp;w=1080" alt="">
            <div class="contents-body container-md">
                <h2 class="contents-title">
                </h2>
                <h2 class="contents-title" style="font-family: var(--ff-ko2);">Support</h2>
                <h7 class="contents-sub" contenteditable="true">고객센터</h7>
            </div>
        </div>
    </div>
    <!-- [E]thpart-HmlqLtFlNZ -->
    <main class="th-layout-main ">
        <!-- [S]hooms-N32 -->
        <div class="hooms-N32" data-bid="fvLqM90X4Z" id="">
            <div class="contents-inner">
                <div class="contents-container container-md">
                    <div class="textset textset-h2">
                        <h2 class="textset-tit">${support.supName}</h2>
                    </div>
                    <div class="contents-group">
                        <input type="hidden" name="userId" value="${sessionScope.user.userId}">
                        <h5 class="contents-tit">작성자 : ${support.userId}

                    </div>
                    <h7>등록일 : ${support.supDate}</h7>
                    <div class="contents-cardlist contents-cardlist-active">
                        <a href="javascript:void(0)" class="cardset">
                            <br><h2>공지내용</h2><br>
                            <div class="cardset-body">
                                ${support.supContent}
                            </div>
                            <figure class="cardset-figure">
                                <img src="../file/support/support.jpg" width="1280" height="270"/>
                            </figure>
                        </a>
                    </div>
                    <div class="contents-btn">
                        <a class="btnset" href="listSupport?category=${support.supCategory}">목록으로</a>
                        <c:choose>
                            <c:when test="${support.supCategory eq '0' and sessionScope.user.role eq 1}">
                                <span class="button-gap"></span>

                                <a  class="btnset" href="updateSupport?supNo=${support.supNo}">수정하기</a>


                                <span class="button-gap"></span>

                                <a class="btnset" id="withdrawLink">삭제하기</a>
                            </c:when>
                        </c:choose>
                    </div>
                </div>
            </div>
        </div>
        <!-- [E]hooms-N32 -->
    </main>



</main>
</body>
</html>

<script src="../common/js/setting.js"></script>
<script src="../common/js/plugin.js"></script>
<script src="../common/js/template.js"></script>
<script src="../common/js/common.js"></script>
<script src="../common/js/script.js"></script>
<script src="../support/js/setting.js"></script>
<script src="../support/js/plugin.js"></script>
<script src="../support/js/template.js"></script>
<script src="../support/js/common.js"></script>
<script src="../support/js/script.js"></script>
<script src="../support/js/support.js"></script>
<script src="../support/js/deleteSupport.js"></script>
<%@ include file="../layout/bottom.jsp" %>
