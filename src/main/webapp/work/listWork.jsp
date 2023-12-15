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
        /* 기존 스타일 유지 */
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

        /* 검색 폼 스타일 수정 */
        .contents-form {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            padding: 10px 0;
        }

        .inputset {
            margin-bottom: 15px;
        }

        .radioset-wrap, .checkset-wrap {
            display: block;
            margin: 10px 5px;
            text-align: left;
        }

        .radioset, .checkset {
            margin-right: 10px;
            white-space: nowrap;
        }

        .radioset-thumb, .checkset-text {
            font-size: 14px;
            display: inline-block;
            margin-left: 5px;
        }

        /* 반응형 레이아웃 조정 */
        @media screen and (max-width: 768px) {
            .radioset-wrap, .checkset-wrap {
                flex-direction: row;
                justify-content: space-around;
                width: 100%;
            }
        }
    </style>

</head>
<body>

<!--top start-->
<%@ include file="../layout/top.jsp" %>
<!--top end-->

    <!-- 작품 목록을 표시하는 부분 -->
    <main class="th-layout-main ">
        <div class="opilsol-N31" data-bid="nu2ClPPZgeB" >
            <div class="content-container">

                <h2 class="textset-tit">작품 목록</h2>
                <!-- 전체 작품 개수를 표시 -->
                <p>전체 개수: <span id="totalCount">${totalCount}</span></p>

                <div class="contents-form">
                    <div class="inputset inputset-line inputset-lg">
                        <button class="inputset-icon icon-right icon-search btn" type="button" aria-label="아이콘"></button>
                        <input type="text" class="inputset-input form-control" placeholder="내용을 입력해 주세요." aria-label="내용" id="searchKeyword" name="searchKeyword" value="${! empty search.searchKeyword ? search.searchKeyword : '' }">
                    </div>
                        <div class="radioset-wrap">
                            <div class="radioset radioset-brick">
                                <!-- 카테고리 선택 -->
                                <input id="radioset-b-1-1" name="searchCondition" class="visually-hidden" type="radio" value="0" ${ ! empty search.searchCondition && search.searchCondition==0 ? "checked" : ""}>
                                <label class="radioset-thumb" for="radioset-b-1-1">웹소설</label>
                                <input id="radioset-b-1-2" name="searchCondition" class="visually-hidden" type="radio" value="1" ${ ! empty search.searchCondition && search.searchCondition==1 ? "checked" : ""}>
                                <label class="radioset-thumb" for="radioset-b-1-2">웹툰</label>
                                <input id="radioset-b-1-3" name="searchCondition" class="visually-hidden" type="radio" value="2" ${ ! empty search.searchCondition && search.searchCondition==2 ? "checked" : ""}>
                                <label class="radioset-thumb" for="radioset-b-1-3">웹드라마</label>
                            </div>
                        </div>

                        <!-- 장르 선택 -->
                        <div class="radioset-wrap">
                            <div class="radioset">
                                <input id="radioset-c-1-1" name="orderKeyword" class="visually-hidden" type="radio" value="학원" ${search.orderKeyword == '학원' ? 'checked' : ''}>
                                <label class="radioset-thumb thumb-round" for="radioset-c-1-1">학원</label>
                            </div>
                            <div class="radioset">
                                <input id="radioset-c-1-2" name="orderKeyword" class="visually-hidden" type="radio" value="액션" ${search.orderKeyword == '액션' ? 'checked' : ''}>
                                <label class="radioset-thumb thumb-round" for="radioset-c-1-2">액션</label>
                            </div>
                            <div class="radioset">
                                <input id="radioset-c-1-3" name="orderKeyword" class="visually-hidden" type="radio" value="SF" ${search.orderKeyword == 'SF' ? 'checked' : ''}>
                                <label class="radioset-thumb thumb-round" for="radioset-c-1-3">SF</label>
                            </div>
                            <div class="radioset">
                                <input id="radioset-c-1-4" name="orderKeyword" class="visually-hidden" type="radio" value="판타지" ${search.orderKeyword == '판타지' ? 'checked' : ''}>
                                <label class="radioset-thumb thumb-round" for="radioset-c-1-4">판타지</label>
                            </div>
                            <div class="radioset">
                                <input id="radioset-c-1-5" name="orderKeyword" class="visually-hidden" type="radio" value="개그" ${search.orderKeyword == '개그' ? 'checked' : ''}>
                                <label class="radioset-thumb thumb-round" for="radioset-c-1-5">개그</label>
                            </div>
                            <div class="radioset">
                                <input id="radioset-c-1-6" name="orderKeyword" class="visually-hidden" type="radio" value="로맨스" ${search.orderKeyword == '로맨스' ? 'checked' : ''}>
                                <label class="radioset-thumb thumb-round" for="radioset-c-1-6">로맨스</label>
                            </div>
                            <div class="radioset">
                                <input id="radioset-c-1-7" name="orderKeyword" class="visually-hidden" type="radio" value="스포츠" ${search.orderKeyword == '스포츠' ? 'checked' : ''}>
                                <label class="radioset-thumb thumb-round" for="radioset-c-1-7">스포츠</label>
                            </div>
                            <div class="radioset">
                                <input id="radioset-c-1-8" name="orderKeyword" class="visually-hidden" type="radio" value="일상" ${search.orderKeyword == '일상' ? 'checked' : ''}>
                                <label class="radioset-thumb thumb-round" for="radioset-c-1-8">일상</label>
                            </div>
                            <div class="radioset">
                                <input id="radioset-c-1-9" name="orderKeyword" class="visually-hidden" type="radio" value="추리" ${search.orderKeyword == '추리' ? 'checked' : ''}>
                                <label class="radioset-thumb thumb-round" for="radioset-c-1-9">추리</label>
                            </div>
                            <div class="radioset">
                                <input id="radioset-c-1-10" name="orderKeyword" class="visually-hidden" type="radio" value="스릴러" ${search.orderKeyword == '스릴러' ? 'checked' : ''}>
                                <label class="radioset-thumb thumb-round" for="radioset-c-1-10">스릴러</label>
                            </div>
                            <div class="radioset">
                                <input id="radioset-c-1-11" name="orderKeyword" class="visually-hidden" type="radio" value="무협" ${search.orderKeyword == '무협' ? 'checked' : ''}>
                                <label class="radioset-thumb thumb-round" for="radioset-c-1-11">무협</label>
                            </div>
                            <div class="radioset">
                                <input id="radioset-c-1-12" name="orderKeyword" class="visually-hidden" type="radio" value="기타" ${search.orderKeyword == '기타' ? 'checked' : ''}>
                                <label class="radioset-thumb thumb-round" for="radioset-c-1-12">기타</label>
                            </div>
                        </div>


                        <!-- 조회순 선택 -->
                        <div class="checkset-wrap">
                            <div class="checkset">
                                <input id="checkset-a-1-1" class="checkset-input input-fill" type="checkbox" name="orderCondition" value="1" ${!empty search.orderCondition && search.orderCondition == 1 ? "checked" : ""}>
                                <label class="checkset-label" for="checkset-a-1-1"></label>
                                <span class="checkset-text">조회순</span>
                            </div>
                        </div>

                </div>


                <!-- 작품 목록을 그리드 형식으로 표시 -->
                <div class="container-md" id="workList">
                    <!-- 작품 목록을 순회하며 표시 -->
                    <c:forEach var="work" items="${list}">
                        <div class="container-list">
                            <!-- 작품 이미지와 정보를 표시 -->
                            <figure class="cardset-figure">
                                <a class="cardset cardset-border" href="../work/getDetailWork?workNo=${work.workNo}">
                                    <img class="cardset-img" src="${work.thumbnail}" alt="이미지">
                                </a>
                            </figure>
                            <div class="cardset-body">
                                <!-- 작품 제목 표시 -->
                                <h5 class="cardset-tit">${work.workName}</h5>
                                <p class="cardset-user">${work.userId}</p>
                                <!-- 작품 카테고리 표시 -->
                                <p class="cardset-desc">카테고리: <c:choose>
                                    <c:when test="${work.category eq '0'}">웹소설</c:when>
                                    <c:when test="${work.category eq '1'}">웹툰</c:when>
                                    <c:when test="${work.category eq '2'}">웹드라마</c:when>
                                    <c:otherwise>기타</c:otherwise>
                                </c:choose></p>
                                <!-- 작품 장르 표시 -->
                                <p class="cardset-desc">장르:  ${work.genre1}
                                    <c:if test="${not empty work.genre2}">, ${work.genre2}</c:if>
                                    <c:if test="${not empty work.genre3}">, ${work.genre3}</c:if></p>
                                <!-- 작품 가격(무료 또는 유료) 표시 -->
                                <p class="cardset-desc">${work.fap == 0 ? '무료' : '유료'}</p>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
    </main>

<!-- 추가된 작업 목록을 저장할 div 요소 -->
<div id="additionalWorkList"></div>

<!-- 페이지 정보를 저장할 hidden input -->
<input type="hidden" id="currentPage" value="${search.currentPage}" />
<input type="hidden" id="loading" value="false" />

<%@ include file="../layout/bottom.jsp" %>

</body>
<script>
    // 카테고리에 따른 텍스트 반환
    function getCategoryText(category) {
        switch (category) {
            case '0': return "웹소설";
            case '1': return "웹툰";
            case '2': return "웹드라마";
            default:  return "기타";
        }
    }

    // 장르에 따른 텍스트 반환
    function getGenreText(genre1, genre2, genre3) {
        var result = genre1;
        if (genre2) { result += ", " + genre2; }
        if (genre3) { result += ", " + genre3; }
        return result;
    }

    $(document).ready(function () {
        // 라디오 버튼, 체크 박스, 검색창 변경 시에 검색 수행
        $("input[type='radio'], input[type='checkbox'], #searchKeyword").on("change keyup", function () {
            updateWorkList(true);
        });

        // 스크롤 이벤트 리스너 등록
        $(window).scroll(function () {
            var scrollHeight = $(document).height();
            var scrollTop = $(window).scrollTop();
            var clientHeight = $(window).height();

            // 스크롤이 페이지 하단에 닿으면 추가 데이터 로드
            if (scrollTop + clientHeight >= scrollHeight - 100) {
                loadMoreWorks();
            }
        });

        // 초기 로딩 시에 추가 데이터 로드
        loadMoreWorks();

        function loadMoreWorks() {
            var loading = $("#loading").val();
            if (loading === "false") {
                var currentPage = parseInt($("#currentPage").val());
                $("#loading").val("true");

                // 데이터 로드
                $.ajax({
                    type: "GET",
                    url: "/work/json/listWork",
                    data: {
                        searchCondition: $("input[name='searchCondition']:checked").val(),
                        orderKeyword: $("input[name='orderKeyword']:checked").val(),
                        orderCondition: $("input[name='orderCondition']:checked").val(),
                        searchKeyword: $("#searchKeyword").val(),
                        currentPage: currentPage,
                        pageSize: 4
                    },
                    dataType: "json",
                    success: function (response) {
                        updateWorkItems(response.list);
                        $("#currentPage").val(currentPage + 1);
                        $("#loading").val("false");
                    },
                    error: function (error) {
                        console.error("Error fetching work list: ", error);
                        $("#loading").val("false");
                    }
                });
            }
        }

        function updateWorkList(clearList) {
            var searchCondition = $("input[name='searchCondition']:checked").val();
            var orderKeyword = $("input[name='orderKeyword']:checked").val();
            var orderCondition = $("input[name='orderCondition']:checked").val();
            var searchKeyword = $("#searchKeyword").val();

            var currentPage = clearList ? 1 : parseInt($("#currentPage").val());

            // 데이터 업데이트
            $.ajax({
                type: "GET",
                url: "/work/json/listWork",
                data: {
                    searchCondition: searchCondition,
                    orderKeyword: orderKeyword,
                    orderCondition: orderCondition,
                    searchKeyword: searchKeyword,
                    currentPage: currentPage,
                    pageSize: 4
                },
                dataType: "json",
                success: function(response) {
                    if (clearList) {
                        $("#workList").empty();
                    }
                    updateWorkItems(response.list);
                    $("#currentPage").val(currentPage + 1);
                    $("#totalCount").text(response.totalCount);
                },
                error: function(error) {
                    console.error("Error fetching work list: ", error);
                }
            });
        }

        function updateWorkItems(workItems) {
            var workList = $("#workList");
            $.each(workItems, function(index, work) {
                if (workList.find(".work-item[data-workno='" + work.workNo + "']").length === 0) {
                    var workItem = $("<div class='container-list work-item' data-workno='" + work.workNo + "'></div>");

                    var figure = $("<figure class='cardset-figure'></figure>");
                    var link = $("<a class='cardset cardset-border'></a>").attr("href", "../work/getDetailWork?workNo=" + work.workNo);
                    var img = $("<img class='cardset-img'>").attr("src", work.thumbnail).attr("alt", "이미지");
                    link.append(img);
                    figure.append(link);
                    workItem.append(figure);

                    var cardBody = $("<div class='cardset-body'></div>");
                    cardBody.append("<h5 class='cardset-tit'>" + work.workName + "</h5>");

                    var categoryText = getCategoryText(work.category);
                    cardBody.append("<p class='cardset-desc'>카테고리: " + categoryText + "</p>");

                    var genreText = getGenreText(work.genre1, work.genre2, work.genre3);
                    cardBody.append("<p class='cardset-desc'>장르: " + genreText + "</p>");

                    var fapText = work.fap == 0 ? "무료" : "유료";
                    cardBody.append("<p class='cardset-desc'>" + fapText + "</p>");

                    workItem.append(cardBody);
                    workList.append(workItem);
                }
            });
        }
    });
</script>





</html>
