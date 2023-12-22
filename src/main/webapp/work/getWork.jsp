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
        /* 추가된 스타일 */
        :root {
            --primary-color: #0056b3;
            --secondary-color: #e9ecef;
            --text-color: #333333;
            --background-color: #ffffff;
        }

        body {
            font-family: 'Arial', sans-serif;
            color: var(--text-color);
            background-color: var(--background-color);
        }

        .content-container {
            text-align: center;
        }

        .textset-tit {
            font-size: 24px;
            color: var(--primary-color);
            margin-bottom: 10px;
        }

        .content-container p {
            font-size: 20px;
        }

        .container-md {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
            gap: 20px;
        }

        .container-list {
            background: var(--secondary-color);
            border: 1px solid #ddd;
            border-radius: 5px;
            overflow: hidden;
            box-shadow: 0 4px 8px rgba(0,0,0,0.15);
            transition: box-shadow 0.3s ease-in-out, transform 0.3s ease-in-out;
        }

        .container-list:hover {
            box-shadow: 0 6px 12px rgba(0,0,0,0.2);
            transform: translateY(-5px);
        }

        .cardset-img {
            width: 100%;
            height: auto;
            border-top-left-radius: 5px;
            border-top-right-radius: 5px;
            object-fit: cover;
        }

        .cardset-body {
            padding: 15px;
            text-align: center;
        }

        .cardset-tit {
            font-size: 18px;
            font-weight: bold;
            color: var(--text-color);
            margin-bottom: 10px;
        }

        .cardset-desc {
            font-size: 14px;
            color: var(--text-color);
        }

        /* 반응형 레이아웃 */
        @media screen and (max-width: 992px) {
            .container-md {
                grid-template-columns: repeat(2, 1fr);
            }
        }

        @media screen and (max-width: 768px) {
            .container-md {
                grid-template-columns: repeat(2, 1fr);
            }
        }

        @media screen and (max-width: 480px) {
            .container-md {
                grid-template-columns: 1fr;
            }
        }
    </style>
</head>
<body>

<!--top start-->
<%@ include file="../layout/top.jsp" %>
<!--top end-->

<main class="th-layout-main ">
    <div class="opilsol-N31" data-bid="nu2ClPPZgeB" id="">
        <div class="content-container">
            <h2 class="textset-tit">나의 작품 목록</h2>
            <p>전체 개수: ${myCount}</p>
            <p><a href="../work/addWork">작품추가</a></p>
            <div class="container-md">
                <c:forEach var="work" items="${list}">
                    <div class="container-list">
                        <figure class="cardset-figure">
                            <a class="cardset cardset-border" href="../work/getDetailWork?workNo=${work.workNo}">
                                <img class="cardset-img" src="${work.thumbnail}" alt="이미지">
                            </a>
                        </figure>
                        <div class="cardset-body">
                            <h5 class="cardset-tit">${work.workName}</h5>
                            <p class="cardset-desc">카테고리: <c:choose>
                                <c:when test="${work.category eq '0'}">웹소설</c:when>
                                <c:when test="${work.category eq '1'}">웹툰</c:when>
                                <c:when test="${work.category eq '2'}">웹드라마</c:when>
                            </c:choose></p>
                            <p class="cardset-desc">장르:  ${work.genre1}
                                <c:if test="${not empty work.genre2}">, ${work.genre2}</c:if>
                                <c:if test="${not empty work.genre3}">, ${work.genre3}</c:if></p>
                            <p class="cardset-desc">${work.fap == 0 ? '무료' : '유료'}</p>
                                <a href="../work/updateWork?workNo=${work.workNo}">수정</a>
                                <form method="post" action="../work/deleteWork">
                                    <input type="hidden" name="workNo" value="${work.workNo}" />
                                    <button type="submit">삭제</button>
                                </form>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
</main>

<%@ include file="../layout/bottom.jsp" %>

</body>
</html>
