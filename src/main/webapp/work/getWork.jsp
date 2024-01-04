<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html>
<head>
    <title>cornstory</title>
    <link rel="stylesheet" href="../common/css/setting.css">
    <link rel="stylesheet" href="../common/css/plugin.css">
    <link rel="stylesheet" href="../common/css/template.css">
    <link rel="stylesheet" href="../common/css/common.css">
    <link rel="stylesheet" href="../common/css/style.css">
    <link rel="stylesheet" href="../common/css/drag.css">
    <link rel="stylesheet" href="../support/css/setting.css">
    <link rel="stylesheet" href="../support/css/plugin.css">
    <link rel="stylesheet" href="../support/css/template.css">
    <link rel="stylesheet" href="../support/css/common.css">
    <link rel="stylesheet" href="../support/css/style.css">
    <meta charset="utf-8">
    <style>
        .genre-list span {
            display: inline-block; /* 각 장르를 inline-block으로 설정하여 가로로 배열 */
            margin-right: 5px; /* 각 장르 사이에 간격 추가 */
        }

        .contents-radioset {
            display: flex; /* Flex 컨테이너 설정 */
            flex-wrap: wrap; /* 내용이 넘칠 경우 줄바꿈 */
        }

        .radioset {
            margin-right: 10px; /* 각 장르 사이의 간격 설정 */
        }

        #workList {
            display: flex; /* 가로로 정렬하기 위해 flex 컨테이너로 설정 */
            flex-wrap: wrap; /* 필요하다면 자식 요소들을 여러 행에 걸쳐 표시 */
            justify-content: flex-start; /* 왼쪽 정렬로 변경 */
        }

        .contents-cardlist.contents-cardlist-active {
            width: calc(20% - 10px); /* 마진을 고려한 실제 너비 계산 */
            margin-right: 10px; /* 오른쪽 마진 */
            margin-bottom: 10px; /* 아래쪽 마진 */
        }

        .hooms-N31 .cardset {
            width: 100%; /* 전체 너비의 20%에서 간격을 빼기 */
            margin-right: 10px; /* 오른쪽 간격 */
            margin-bottom: 10px; /* 아래쪽 간격 */
        }

        /* 한 줄의 마지막 항목에는 오른쪽 여백 제거 */
        .hooms-N31 .cardset:nth-child(5n) {
            margin-right: 0;
        }

        .textset textset-h2{
            margin-top: 50px;
            margin-bottom: 20px;
        }
    </style>
</head>
<%@ include file="../layout/top.jsp" %>
<body>


<!-- 나의 작품 리스트 -->
<main class="th-layout-main">
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



    <div class="hooms-N31" data-bid="geLqKMOmeJ">
        <div class="contents-inner">
            <div class="contents-container container-md">
                <div class="textset textset-h2">
                    <h2 class="textset-tit">작품 관리</h2>
                    <p class="contents-result">전체<span id="totalCount"> ${myCount}</span>개</p>
                    <a href="../work/addWork"><img class="icon-sm" src="../common/icons/ico_plus_circle.svg" alt="아이콘">작품추가</a>
                </div>
                <!-- 작품 목록 -->
                <div class="contents-group">
                    <div class="work-items-container custom-work-list">
                        <div class="container-md" id="workList">
                            <c:forEach var="work" items="${list}">
                                <div class="contents-cardlist contents-cardlist-active">
                                    <a href="../work/getDetailWork?workNo=${work.workNo}" class="cardset">
                                        <figure class="cardset-figure">
                                            <img class="cardset-img" src="${work.thumbnail}" alt="이미지">
                                        </figure>
                                        <div class="cardset-body">
                                            <div class="cardset-tit-group">
                                                <h5 class="cardset-tit">${work.workName}</h5>
                                            </div>
                                            <p class="cardset-desc">
                                                유/무료:
                                                <c:choose>
                                                    <c:when test="${work.fap == 0}">무료</c:when>
                                                    <c:otherwise>유료</c:otherwise>
                                                </c:choose>
                                                | 장르: ${work.genre1}
                                                <c:if test="${not empty work.genre2}">, ${work.genre2}</c:if>
                                                <c:if test="${not empty work.genre3}">, ${work.genre3}</c:if>
                                                | 카테고리: <c:choose>
                                                <c:when test="${work.category eq '0'}">웹소설</c:when>
                                                <c:when test="${work.category eq '1'}">웹툰</c:when>
                                                <c:when test="${work.category eq '2'}">웹드라마</c:when>
                                            </c:choose>
                                            </p>
                                        </div>
                                    </a>
                                    <a href="../work/updateWork?workNo=${work.workNo}">수정</a>
                                    <form method="post" action="../work/deleteWork">
                                        <input type="hidden" name="workNo" value="${work.workNo}"/>
                                        <button type="submit">삭제</button>
                                    </form>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</main>


</body>
</html>
<script src="../common/js/setting.js"></script>
<script src="../common/js/plugin.js"></script>
<script src="../common/js/template.js"></script>
<script src="../common/js/common.js"></script>
<script src="../common/js/script.js"></script>
<script src="../support/js/support.js"></script>
<script src="/common/js/drag.js"></script>
<%@ include file="../layout/bottom.jsp" %>