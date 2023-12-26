<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
    <title>CornStory</title>
    <link rel="stylesheet" href="../common/css/setting.css">
    <link rel="stylesheet" href="../common/css/plugin.css">
    <link rel="stylesheet" href="../common/css/template.css">
    <link rel="stylesheet" href="../common/css/common.css">
    <link rel="stylesheet" href="../common/css/style.css">
</head>

<%@ include file="layout/top.jsp" %>

<!-- [S]hooms-N1 -->
<div class="hooms-N1" data-bid="SAlQg8Ft2x" id="">
    <div class="contents-container">
        <div class="contents-swiper">
            <div class="swiper-wrapper">
                <div class="swiper-slide">
                    <img class="contents-backimg img-pc" src="../common/images/main.jpg" alt="">
                    <img class="contents-backimg img-mobile" src="../common/images/main.jpg" alt="">
                    <div class="contents-slide-group">
                        <h2 class="contents-title">Create OR New STORY</h2>
                        <p class="contents-text">​<br>이곳은 당신만의 이야기가 시작 되는 특별한 공간입니다.<br>지금 여기에서, 당신만의 창작을 펼쳐보세요.</p>
                        <c:if test="${!empty sessionScope.user}">
                        <a class="contents-link" href="/work/addWork">Create</a>
                        </c:if>
                    </div>
                </div>
                <div class="swiper-slide">
                    <img class="contents-backimg img-pc" src="../common/images/one.jpg" alt="">
                    <img class="contents-backimg img-mobile" src="../common/images/one.jpg" alt="">
                    <div class="contents-slide-group">
                        <h2 class="contents-title">Create OR New STORY</h2>
                        <p class="contents-text">​<br>이곳은 당신만의 이야기가 시작 되는 특별한 공간입니다.<br>지금 여기에서, 당신만의 창작을 펼쳐보세요.</p>
                        <c:if test="${!empty sessionScope.user}">
                            <a class="contents-link" href="/work/addWork">Create</a>
                        </c:if>
                    </div>
                </div>
                <div class="swiper-slide">
                    <img class="contents-backimg img-pc" src="https://images.unsplash.com/photo-1598237601465-af66b7475e92?crop=entropy&amp;cs=tinysrgb&amp;fit=max&amp;fm=jpg&amp;ixid=M3w0OTE2MDd8MHwxfHNlYXJjaHwyM3x8YmxhY2t8a298MHx8fHwxNzAzMjI1ODk3fDA&amp;ixlib=rb-4.0.3&amp;q=80&amp;w=1080" alt="">
                    <img class="contents-backimg img-mobile" src="https://images.unsplash.com/photo-1598237601465-af66b7475e92?crop=entropy&amp;cs=tinysrgb&amp;fit=max&amp;fm=jpg&amp;ixid=M3w0OTE2MDd8MHwxfHNlYXJjaHwyM3x8YmxhY2t8a298MHx8fHwxNzAzMjI1ODk3fDA&amp;ixlib=rb-4.0.3&amp;q=80&amp;w=1080" alt="">
                    <div class="contents-slide-group">
                        <h2 class="contents-title">Create OR New STORY</h2>
                        <p class="contents-text">​<br>이곳은 당신만의 이야기가 시작 되는 특별한 공간입니다.<br>지금 여기에서, 당신만의 창작을 펼쳐보세요.</p>
                        <c:if test="${!empty sessionScope.user}">
                            <a class="contents-link" href="/work/addWork">Create</a>
                        </c:if>
                    </div>
                </div>
            </div>
            <div class="swiper-button-next"></div>
            <div class="swiper-button-prev"></div>
            <div class="contents-control">
                <div class="swiper-pagination"></div>
                <div class="swiper-button-pause">
                    <img src="../common/icons/ico_pause.svg" alt="스와이퍼 멈춤버튼">
                </div>
                <div class="swiper-button-play">
                    <img src="../common/icons/ico_play.svg" alt="스와이퍼 재생버튼">
                </div>
            </div>
        </div>
    </div>
</div>
<!-- [E]hooms-N1 -->
<!-- [S]hooms-N3 -->
<div class="hooms-N3" data-bid="QuLqG8vXpA" id="">
    <div class="contents-container container-md">
        <div class="contents-group">
            <div class="contents-left">
                <div class="textset textset-h2">
                    <h2 class="textset-tit">Tool</h2>
                </div>
                <div class="textset">
                    <h5 class="textset-tit">설명</h5>
                    <p class="textset-desc">"최신 작품, 게시물, 채팅 그리고 고객센터 까지 ​<br>​Tool bar에서​ 당신의 창작 여정을 더욱 편리하게 즐겨보세요.<br>​<br><br></p>
                </div>
            </div>
            <div class="contents-right">
                <img src="https://images.unsplash.com/photo-1651085349238-75cac5c9258b?crop=entropy&amp;cs=tinysrgb&amp;fit=max&amp;fm=jpg&amp;ixid=M3w0OTE2MDd8MHwxfHNlYXJjaHw0Mzl8fGJsYWNrfGtvfDB8fHxibGFja19hbmRfd2hpdGV8MTcwMzIyNzAxNnww&amp;ixlib=rb-4.0.3&amp;q=80&amp;w=1080" alt="">
                <div class="contents-history-group">
                    <ul class="contents-historylist">
                        <li class="contents-historyitem">
                            <img class="contents-backimg" src="https://images.unsplash.com/photo-1571863281644-68331501b108?crop=entropy&amp;cs=tinysrgb&amp;fit=max&amp;fm=jpg&amp;ixid=M3w0OTE2MDd8MHwxfHNlYXJjaHw5M3x8Ym9va3xrb3wwfHx8YmxhY2tfYW5kX3doaXRlfDE3MDMyMjY4NjV8MA&amp;ixlib=rb-4.0.3&amp;q=80&amp;w=1080" alt="">
                            <span class="contents-historytext">Work​<br>​작품<br></span>
                        </li>
                        <li class="contents-historyitem">
                            <img class="contents-backimg" src="https://images.unsplash.com/photo-1605472039796-ceb156c31e4c?crop=entropy&amp;cs=tinysrgb&amp;fit=max&amp;fm=jpg&amp;ixid=M3w0OTE2MDd8MHwxfHNlYXJjaHwxOHx8JUVDJThBJUE0JUVEJTg2JUEwJUVCJUE2JUFDfGtvfDB8fHxibGFja19hbmRfd2hpdGV8MTcwMzIyNzE5NHww&amp;ixlib=rb-4.0.3&amp;q=80&amp;w=1080" alt="">
                            <span class="contents-historytext">Story​<br>​게시물<br></span>
                        </li>
                        <li class="contents-historyitem">
                            <img class="contents-backimg" src="https://images.unsplash.com/photo-1575722290270-626b0208df99?crop=entropy&amp;cs=tinysrgb&amp;fit=max&amp;fm=jpg&amp;ixid=M3w0OTE2MDd8MHwxfHNlYXJjaHwyMXx8JUVDJUIxJTg0JUVEJThDJTg1fGtvfDB8fHxibGFja19hbmRfd2hpdGV8MTcwMzIyNzIyNnww&amp;ixlib=rb-4.0.3&amp;q=80&amp;w=1080" alt="">
                            <span class="contents-historytext">Chat​<br>​채팅<br></span>
                        </li>
                        <li class="contents-historyitem">
                            <img class="contents-backimg" src="https://images.unsplash.com/photo-1543053976-1f0d57a634ea?crop=entropy&amp;cs=tinysrgb&amp;fit=max&amp;fm=jpg&amp;ixid=M3w0OTE2MDd8MHwxfHNlYXJjaHw0NTh8fGJsYWNrfGtvfDB8fHxibGFja19hbmRfd2hpdGV8MTcwMzIyNzAyN3ww&amp;ixlib=rb-4.0.3&amp;q=80&amp;w=1080" alt="">
                            <span class="contents-historytext">Support​<br>​고객센터<br></span>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- [E]hooms-N3 -->
<!-- [S]hooms-N28 -->
<div class="hooms-N28" data-bid="HrLQGAoi17" id="">
    <div class="contents-inner">
        <div class="contents-container container-md">
            <div class="textset textset-h2">
                <h2 class="textset-tit">Work</h2>
                <h7>작품</h7>
            </div>
            <div class="contents-cardgroup">
                <a href="/work/listWork?category=0" class="cardset cardset-hover">
                    <figure class="cardset-figure">
                        <img class="cardset-img" src="https://images.unsplash.com/photo-1543769657-fcf1236421bc?crop=entropy&amp;cs=tinysrgb&amp;fit=max&amp;fm=jpg&amp;ixid=M3w0OTE2MDd8MHwxfHNlYXJjaHwxfHx0ZXh0fGtvfDB8fHxibGFja19hbmRfd2hpdGV8MTcwMzIzMDUzNnww&amp;ixlib=rb-4.0.3&amp;q=80&amp;w=1080" alt="">
                    </figure>
                    <div class="cardset-body" contenteditable="true">
                        <h5 class="cardset-tit">Web N​ovel​<br>​​웹 소설<br></h5>
                    </div>
                </a>
                <a href="/work/listWork?category=1" class="cardset cardset-hover">
                    <figure class="cardset-figure">
                        <img class="cardset-img" src="https://images.unsplash.com/photo-1545199040-e144651a428d?crop=entropy&amp;cs=tinysrgb&amp;fit=max&amp;fm=jpg&amp;ixid=M3w0OTE2MDd8MHwxfHNlYXJjaHwyOXx8JUVDJTg4JTk4JUVDJUIxJTg0JUVEJTk5JTk0fGtvfDB8fHxibGFja19hbmRfd2hpdGV8MTcwMzIzMDE3NXww&amp;ixlib=rb-4.0.3&amp;q=80&amp;w=1080" alt="">
                    </figure>
                    <div class="cardset-body">
                        <h5 class="cardset-tit">Web Toon​<br>​웹툰<br></h5>
                    </div>
                </a>
                <a href="/work/listWork?category=2" class="cardset cardset-hover">
                    <figure class="cardset-figure">
                        <img class="cardset-img" src="https://images.unsplash.com/photo-1620130313303-040a008b945b?crop=entropy&amp;cs=tinysrgb&amp;fit=max&amp;fm=jpg&amp;ixid=M3w0OTE2MDd8MHwxfHNlYXJjaHw0fHwlRUIlOEYlOTklRUMlOTglODElRUMlODMlODF8a298MHx8fGJsYWNrX2FuZF93aGl0ZXwxNzAzMjMwMzU3fDA&amp;ixlib=rb-4.0.3&amp;q=80&amp;w=1080" alt="">
                    </figure>
                    <div class="cardset-body">
                        <h5 class="cardset-tit">Web Drama​<br>​웹 드라마<br></h5>
                    </div>
                </a>
            </div>
            <div class="textset" th-hoverbox="true">
                <a class="textset-link btnset btnset-mono" href="/work/listWork">View more</a>
            </div>
        </div>
    </div>
</div>
<!-- [E]hooms-N28 -->
<!-- [S]hooms-N15 -->
<div class="hooms-N15" data-bid="OElqgAD1qw">
    <div class="contents-inner">
        <div class="contents-container container-md">
            <div class="textset textset-h2">
                <h2 class="textset-tit textset-h2"> Shop</h2>
            </div>
            <p class="contents-subtitle">상품</p>
            <div class="contents-group">
                <div class="cardset">
                    <div class="cardset-body">
                        <p class="cardset-desc">팝콘은 플랫폼 내에서 다양한 창작물을 이용하고 즐기기 위한 가상 화폐입니다. 팝콘은 작품의 저작권을 구매하거나 회차를 감상하는 데 사용됩니다. 플랫폼에서의 창작물 소비와 창작자에 대한 지원에 활용되며, 다양한 창작물을 자유롭게 즐길 수 있도록 돕습니다.​<br>​<br></p>
                    </div>
                    <figure class="cardset-figure">
                        <img class="cardset-img" src="https://images.unsplash.com/photo-1657046935595-40897d3c1316?crop=entropy&amp;cs=tinysrgb&amp;fit=max&amp;fm=jpg&amp;ixid=M3w0OTE2MDd8MHwxfHNlYXJjaHwxMDV8fHBvcGNvcm58a298MHwwfHx8MTcwMzIyOTA2OXww&amp;ixlib=rb-4.0.3&amp;q=80&amp;w=1080" alt="">
                    </figure>
                </div>
                <div class="cardset">
                    <div class="cardset-body">
                        <p class="cardset-desc"> 팝콘을 사용하여 창작물의 저작권을 구매하면, 해당 작품을 다양한 목적으로 활용할 수 있는 권리를 얻게 됩니다. 이는 재창작, 수정, 상업적 이용 등을 포함하며, 창작자에 대한 예의를 기리면서 창작물을 적극적으로 활용할 수 있게 합니다. 저작권 구매는 창작자와 플랫폼 내 창작 생태계를 지속적으로 지원하는 중요한 요소입니다. </p>
                    </div>
                    <figure class="cardset-figure">
                        <img class="cardset-img" src="https://images.unsplash.com/photo-1616628188859-7a11abb6fcc9?crop=entropy&amp;cs=tinysrgb&amp;fit=max&amp;fm=jpg&amp;ixid=M3w0OTE2MDd8MHwxfHNlYXJjaHw1OHx8Y29weXxrb3wwfDB8fHwxNzAzMjI5MDMyfDA&amp;ixlib=rb-4.0.3&amp;q=80&amp;w=1080" alt="">
                    </figure>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- [E]hooms-N15 -->
<!-- [S]blank-ERlQGaz2qq -->
<div class="blank-ERlQGaz2qq" data-bid="ERlQGaz2qq">
    <div class="container"></div>
</div>
<!-- [E]blank-ERlQGaz2qq -->
<!-- [S]hooms-N57 -->
<%@ include file="layout/bottom.jsp" %>
<!-- [E]hooms-N57 -->
<script src="../common/js/setting.js"></script>
<script src="../common/js/plugin.js"></script>
<script src="../common/js/template.js"></script>
<script src="../common/js/common.js"></script>
<script src="../common/js/script.js"></script>
</body>