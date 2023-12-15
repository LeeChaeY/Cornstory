<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html>
<head>
    <title>cornstory</title>
    <link rel="stylesheet" href="/ssh/css/setting.css">
    <link rel="stylesheet" href="/ssh/css/plugin.css">
    <link rel="stylesheet" href="/ssh/css/template.css">
    <link rel="stylesheet" href="/ssh/css/common.css">
    <link rel="stylesheet" href="/ssh/css/style.css">
    <meta charset="utf-8">
    <style>
        .main{ width: 300px; height: 400px; }
        .sub{ width: 150px; height: 200px; }
        .content-container { text-align: center; }
        .container-md { margin: 0 auto; }
        .img-box, .txt-box { display: inline-block; vertical-align: top; }
        .txt-box { max-width: 600px; padding-left: 20px; }
        .tableset-table { width: 100%; border-collapse: collapse; }
        .tableset-table th, .tableset-table td { border: 1px solid #ddd; padding: 8px; text-align: left; }
        .tableset-table th { background-color: #f9f9f9; }
        .thead-border-top th { border-top: 2px solid #666; }
        .number { text-align: center; }
        .img-box img { max-width: 100%;}
        .tableset-table td img { width: 100px; height: auto; }
        .btnset { background-color: #0056b3; color: #fff; padding: 8px 15px; border: none; border-radius: 4px; cursor: pointer; }
        .btnset:hover { background-color: #004494; }
        .btn-delete { background-color: #ff0000; }
        .btn-delete:hover { background-color: #cc0000; }
    </style>
</head>
<body>

<!--top start-->
<%@ include file="../layout/top.jsp" %>
<!--top end-->

<main class="th-layout-main">
    <h2>작품 회차 목록</h2>
    <p>전체 개수: ${totalCount}</p>

    <div class="content-container">
        <div class="container-md">
            <div class="content-group">
                <figure class="img-box">
                    <img class="main" src="${work.thumbnail}" alt="이미지">
                </figure>
                <div class="txt-box">
                    <div class="textset">
                        <h2 class="textset-tit"> 작품명 : ${work.workName}</h2>
                        <p class="textset-desc">작가명 : ${work.userId}</p>
                        <p class="textset-desc">카테고리 : ${work.category}</p>
                        <p class="textset-desc">작품 소개 : ${work.workDesc}</p>
                        <p class="textset-desc">장르 : ${work.genre1}
                            <c:if test="${not empty work.genre2}">, ${work.genre2}</c:if>
                            <c:if test="${not empty work.genre3}">, ${work.genre3}</c:if></p>
                        <p class="textset-desc">등록일 : ${work.workDate}</p>
                        <p class="textset-desc">${work.fap == 0 ? '무료' : '유료'}</p>
                        <p class="info-item"><a href="../episode/addEpisode?workNo=${work.workNo}">작품 회차 추가</a></p>
                        <p class="info-item"><a href="../work/addBookmark?workNo=${work.workNo}">찜하기</a></p>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="opilsol-N24" data-bid="yElQ4UCyOa">
        <div class="content-container">
            <div class="container-md">
                <div class="tableset">
                    <div class="tableset-inner">
                        <table class="tableset-table table">
                            <colgroup>
                                <col>
                                <col>
                                <col>
                            </colgroup>
                            <thead class="thead-border-top">
                            <tr>
                                <th class="number" scope="col">회차 순서</th>
                                <th scope="col">회차 이미지</th>
                                <th scope="col">회차명</th>
                                <th class="" scope="col">등록일</th>
                                <th scope="col">유료 / 무료</th>
                                <c:if test="${work.fap eq 1}">
                                    <th scope="col">조회여부</th>
                                </c:if>
                                <c:if test="${user.userId eq work.userId}">
                                    <th>에피소드 수정</th>
                                    <th>에피소드 삭제</th>
                                </c:if>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="episode" items="${list}">
                                <tr>
                                    <td>${episode.episodeOrder}</td>
                                    <td><img class="sub" src="${episode.thumbnail}"/></td>
                                    <c:if test="${work.fap == 0}">
                                        <td><a href="../episode/getEpisode?episodeNo=${episode.episodeNo}">${episode.episodeName}</a></td>
                                    </c:if>
                                    <c:if test="${work.fap == 1}">
                                        <td><a href="../episode/getEpisode?episodeNo=${episode.episodeNo}">${episode.episodeName}</a></td>
                                    </c:if>
                                    <td><fmt:formatDate value="${episode.episodeDate}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
                                    <td>${work.fap == 0 ? '무료' : '유료'}</td>
                                    <c:if test="${work.fap == 1}">
                                        <td>팝콘 <c:choose>
                                            <c:when test="${work.category eq '0'}">2</c:when>
                                            <c:when test="${work.category eq '1'}">3</c:when>
                                            <c:when test="${work.category eq '2'}">5</c:when>
                                        </c:choose> 소비하고 시청하기</td>
                                    </c:if>
                                    <c:if test="${user.userId eq work.userId}">
                                        <td><a href="../episode/updateEpisode?episodeNo=${episode.episodeNo}">수정</a></td>
                                        <td>
                                            <form method="post" action="../episode/deleteEpisode">
                                                <input type="hidden" name="episodeNo" value="${episode.episodeNo}" />
                                                <button type="submit" class="btn-delete">삭제</button>
                                            </form>
                                        </td>
                                    </c:if>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</main>

<%@ include file="../layout/bottom.jsp" %>

</body>
</html>

