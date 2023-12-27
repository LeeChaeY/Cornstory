<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html>
<head>
    <title>cornstory</title>
    <link rel="stylesheet" href="/khs/css/setting.css">
    <link rel="stylesheet" href="/khs/css/plugin.css">
    <link rel="stylesheet" href="/khs/css/template.css">
    <link rel="stylesheet" href="/khs/css/common.css">
    <link rel="stylesheet" href="/khs/css/style.css">
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

        #workList{
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


    </style>
</head>
<body>

<!--top start-->
<%--<%@ include file="../layout/header.jsp" %>--%>
<jsp:include page="../layout/header.jsp" flush="true"/>
<!--top end-->

<%--<main class="th-layout-main ">--%>
<%--    <div class="opilsol-N31" data-bid="nu2ClPPZgeB" id="">--%>
<%--        <div class="content-container">--%>
<%--            <h2 class="textset-tit">나의 작품 목록</h2>--%>
<%--            <p>전체 개수: ${myCount}</p>--%>
<%--            <p><a href="../work/addWork">작품추가</a></p>--%>
<%--            <div class="container-md">--%>
<%--                <c:forEach var="work" items="${list}">--%>
<%--                    <div class="container-list">--%>
<%--                        <figure class="cardset-figure">--%>
<%--                            <a class="cardset cardset-border" href="../work/getDetailWork?workNo=${work.workNo}">--%>
<%--                                <img class="cardset-img" src="${work.thumbnail}" alt="이미지">--%>
<%--                            </a>--%>
<%--                        </figure>--%>
<%--                        <div class="cardset-body">--%>
<%--                            <h5 class="cardset-tit">${work.workName}</h5>--%>
<%--                            <p class="cardset-desc">카테고리: <c:choose>--%>
<%--                                <c:when test="${work.category eq '0'}">웹소설</c:when>--%>
<%--                                <c:when test="${work.category eq '1'}">웹툰</c:when>--%>
<%--                                <c:when test="${work.category eq '2'}">웹드라마</c:when>--%>
<%--                            </c:choose></p>--%>
<%--                            <p class="cardset-desc">장르:  ${work.genre1}--%>
<%--                                <c:if test="${not empty work.genre2}">, ${work.genre2}</c:if>--%>
<%--                                <c:if test="${not empty work.genre3}">, ${work.genre3}</c:if></p>--%>
<%--                            <p class="cardset-desc">${work.fap == 0 ? '무료' : '유료'}</p>--%>
<%--                                <a href="../work/updateWork?workNo=${work.workNo}">수정</a>--%>
<%--                                <form method="post" action="../work/deleteWork">--%>
<%--                                    <input type="hidden" name="workNo" value="${work.workNo}" />--%>
<%--                                    <button type="submit">삭제</button>--%>
<%--                                </form>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </c:forEach>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</main>--%>

<!-- 나의 작품 리스트 -->
<main class="th-layout-main">
    <div class="hooms-N31" data-bid="geLqKMOmeJ" id="">
        <div class="contents-inner">
            <div class="contents-container container-md">
                <div class="textset textset-h2">
                    <h2 class="textset-tit">나의 작품 리스트</h2>
                    <p>전체 개수: ${myCount}</p>
                </div>
                <!-- 작품 목록 -->
                <div class="contents-group">
                    <div class="work-items-container custom-work-list">
                        <div class="container-md" id="workList">
                            <!-- 작품 목록이 여기에 동적으로 생성됩니다. -->
                            <c:forEach var="work" items="${list}">
                                <div class="contents-cardlist contents-cardlist-active">
                                    <a href="javascript:void(0)" class="cardset">
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
                                            <input type="hidden" name="workNo" value="${work.workNo}" />
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


                                <!-- [S]thwhole-wfLpW5Z3pJ -->
                                <%--<%@ include file="../layout/footer.jsp" %>--%>
<jsp:include page="../layout/footer.jsp" flush="true"/>
<!-- [E]thwhole-wfLpW5Z3pJ -->

</body>
</html>
