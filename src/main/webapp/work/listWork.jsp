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

    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
</head>
<body>

<!--top start-->
<%--<%@ include file="../layout/header.jsp" %>--%>
<jsp:include page="../layout/header.jsp" flush="true"/>
<!--top end-->

    <!-- 작품 목록을 표시하는 부분 -->
<%--    <main class="th-layout-main ">--%>
<%--        <div class="opilsol-N31" data-bid="nu2ClPPZgeB" >--%>
<%--            <div class="content-container">--%>

<%--                <h2 class="textset-tit">작품 목록</h2>--%>
<%--                <!-- 전체 작품 개수를 표시 -->--%>
<%--                <p>전체 개수: <span id="totalCount">${totalCount}</span></p>--%>

<%--                <div class="contents-form">--%>
<%--                    <div class="inputset inputset-line inputset-lg">--%>
<%--                        <button class="inputset-icon icon-right icon-search btn" type="button" aria-label="아이콘"></button>--%>
<%--                        <input type="text" class="inputset-input form-control" placeholder="내용을 입력해 주세요." aria-label="내용" id="searchKeyword" name="searchKeyword" value="${! empty search.searchKeyword ? search.searchKeyword : '' }">--%>
<%--                    </div>--%>
<%--                        <div class="radioset-wrap">--%>
<%--                            <div class="radioset radioset-brick">--%>
<%--                                <!-- 카테고리 선택 -->--%>
<%--                                <input id="radioset-b-1-1" name="searchCondition" class="visually-hidden" type="radio" value="0" ${ ! empty search.searchCondition && search.searchCondition==0 ? "checked" : ""}>--%>
<%--                                <label class="radioset-thumb" for="radioset-b-1-1">웹소설</label>--%>
<%--                                <input id="radioset-b-1-2" name="searchCondition" class="visually-hidden" type="radio" value="1" ${ ! empty search.searchCondition && search.searchCondition==1 ? "checked" : ""}>--%>
<%--                                <label class="radioset-thumb" for="radioset-b-1-2">웹툰</label>--%>
<%--                                <input id="radioset-b-1-3" name="searchCondition" class="visually-hidden" type="radio" value="2" ${ ! empty search.searchCondition && search.searchCondition==2 ? "checked" : ""}>--%>
<%--                                <label class="radioset-thumb" for="radioset-b-1-3">웹드라마</label>--%>
<%--                            </div>--%>
<%--                        </div>--%>

<%--                        <!-- 장르 선택 -->--%>
<%--                        <div class="radioset-wrap">--%>
<%--                            <div class="radioset">--%>
<%--                                <input id="radioset-c-1-1" name="orderKeyword" class="visually-hidden" type="radio" value="학원" ${search.orderKeyword == '학원' ? 'checked' : ''}>--%>
<%--                                <label class="radioset-thumb thumb-round" for="radioset-c-1-1">학원</label>--%>
<%--                            </div>--%>
<%--                            <div class="radioset">--%>
<%--                                <input id="radioset-c-1-2" name="orderKeyword" class="visually-hidden" type="radio" value="액션" ${search.orderKeyword == '액션' ? 'checked' : ''}>--%>
<%--                                <label class="radioset-thumb thumb-round" for="radioset-c-1-2">액션</label>--%>
<%--                            </div>--%>
<%--                            <div class="radioset">--%>
<%--                                <input id="radioset-c-1-3" name="orderKeyword" class="visually-hidden" type="radio" value="SF" ${search.orderKeyword == 'SF' ? 'checked' : ''}>--%>
<%--                                <label class="radioset-thumb thumb-round" for="radioset-c-1-3">SF</label>--%>
<%--                            </div>--%>
<%--                            <div class="radioset">--%>
<%--                                <input id="radioset-c-1-4" name="orderKeyword" class="visually-hidden" type="radio" value="판타지" ${search.orderKeyword == '판타지' ? 'checked' : ''}>--%>
<%--                                <label class="radioset-thumb thumb-round" for="radioset-c-1-4">판타지</label>--%>
<%--                            </div>--%>
<%--                            <div class="radioset">--%>
<%--                                <input id="radioset-c-1-5" name="orderKeyword" class="visually-hidden" type="radio" value="개그" ${search.orderKeyword == '개그' ? 'checked' : ''}>--%>
<%--                                <label class="radioset-thumb thumb-round" for="radioset-c-1-5">개그</label>--%>
<%--                            </div>--%>
<%--                            <div class="radioset">--%>
<%--                                <input id="radioset-c-1-6" name="orderKeyword" class="visually-hidden" type="radio" value="로맨스" ${search.orderKeyword == '로맨스' ? 'checked' : ''}>--%>
<%--                                <label class="radioset-thumb thumb-round" for="radioset-c-1-6">로맨스</label>--%>
<%--                            </div>--%>
<%--                            <div class="radioset">--%>
<%--                                <input id="radioset-c-1-7" name="orderKeyword" class="visually-hidden" type="radio" value="스포츠" ${search.orderKeyword == '스포츠' ? 'checked' : ''}>--%>
<%--                                <label class="radioset-thumb thumb-round" for="radioset-c-1-7">스포츠</label>--%>
<%--                            </div>--%>
<%--                            <div class="radioset">--%>
<%--                                <input id="radioset-c-1-8" name="orderKeyword" class="visually-hidden" type="radio" value="일상" ${search.orderKeyword == '일상' ? 'checked' : ''}>--%>
<%--                                <label class="radioset-thumb thumb-round" for="radioset-c-1-8">일상</label>--%>
<%--                            </div>--%>
<%--                            <div class="radioset">--%>
<%--                                <input id="radioset-c-1-9" name="orderKeyword" class="visually-hidden" type="radio" value="추리" ${search.orderKeyword == '추리' ? 'checked' : ''}>--%>
<%--                                <label class="radioset-thumb thumb-round" for="radioset-c-1-9">추리</label>--%>
<%--                            </div>--%>
<%--                            <div class="radioset">--%>
<%--                                <input id="radioset-c-1-10" name="orderKeyword" class="visually-hidden" type="radio" value="스릴러" ${search.orderKeyword == '스릴러' ? 'checked' : ''}>--%>
<%--                                <label class="radioset-thumb thumb-round" for="radioset-c-1-10">스릴러</label>--%>
<%--                            </div>--%>
<%--                            <div class="radioset">--%>
<%--                                <input id="radioset-c-1-11" name="orderKeyword" class="visually-hidden" type="radio" value="무협" ${search.orderKeyword == '무협' ? 'checked' : ''}>--%>
<%--                                <label class="radioset-thumb thumb-round" for="radioset-c-1-11">무협</label>--%>
<%--                            </div>--%>
<%--                            <div class="radioset">--%>
<%--                                <input id="radioset-c-1-12" name="orderKeyword" class="visually-hidden" type="radio" value="기타" ${search.orderKeyword == '기타' ? 'checked' : ''}>--%>
<%--                                <label class="radioset-thumb thumb-round" for="radioset-c-1-12">기타</label>--%>
<%--                            </div>--%>
<%--                        </div>--%>


<%--                        <!-- 조회순 선택 -->--%>
<%--                        <div class="checkset-wrap">--%>
<%--                            <div class="checkset">--%>
<%--                                <input id="checkset-a-1-1" class="checkset-input input-fill" type="checkbox" name="orderCondition" value="1" ${!empty search.orderCondition && search.orderCondition == 1 ? "checked" : ""}>--%>
<%--                                <label class="checkset-label" for="checkset-a-1-1"></label>--%>
<%--                                <span class="checkset-text">조회순</span>--%>
<%--                            </div>--%>
<%--                        </div>--%>

<%--                </div>--%>


<%--                <!-- 작품 목록을 그리드 형식으로 표시 -->--%>
<%--                <div class="container-md" id="workList">--%>
<%--                    <!-- 작품 목록을 순회하며 표시 -->--%>
<%--                    <c:forEach var="work" items="${list}">--%>
<%--                        <div class="container-list">--%>
<%--                            <!-- 작품 이미지와 정보를 표시 -->--%>
<%--                            <figure class="cardset-figure">--%>
<%--                                <img class="cardset-img" src="${work.thumbnail}" alt="이미지">--%>
<%--                            </figure>--%>
<%--                            <div class="cardset-body">--%>
<%--                                <!-- 작품 제목 표시 -->--%>
<%--                                <h5 class="cardset-tit">${work.workName}</h5>--%>
<%--                                <p class="cardset-user">${work.userId}</p>--%>
<%--                                <!-- 작품 카테고리 표시 -->--%>
<%--                                <p class="cardset-desc">카테고리: <c:choose>--%>
<%--                                    <c:when test="${work.category eq '0'}">웹소설</c:when>--%>
<%--                                    <c:when test="${work.category eq '1'}">웹툰</c:when>--%>
<%--                                    <c:when test="${work.category eq '2'}">웹드라마</c:when>--%>
<%--                                    <c:otherwise>기타</c:otherwise>--%>
<%--                                </c:choose></p>--%>
<%--                                <!-- 작품 장르 표시 -->--%>
<%--                                <p class="cardset-desc">장르:  ${work.genre1}--%>
<%--                                    <c:if test="${not empty work.genre2}">, ${work.genre2}</c:if>--%>
<%--                                    <c:if test="${not empty work.genre3}">, ${work.genre3}</c:if></p>--%>
<%--                                <!-- 작품 가격(무료 또는 유료) 표시 -->--%>
<%--                                <p class="cardset-desc">${work.fap == 0 ? '무료' : '유료'}</p>--%>

<%--                                <div class="work-options">--%>
<%--                                    <span class="work-option" onclick="viewWorkDetail(${work.workNo})">자세히 보기</span>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </c:forEach>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </main>--%>
<main class="th-layout-main">
    <div class="hooms-N31" data-bid="geLqKMOmeJ" id="">
        <div class="contents-inner">
            <div class="contents-container container-md">
                <div class="textset textset-h2">
                    <h2 class="textset-tit">작품 리스트</h2>
                </div>

                <!-- 카테고리 탭 -->
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

                <!-- 장르 필터링 -->
                <div class="contents-radioset">
                    <!-- 장르 1: 학원 -->
                    <div class="radioset">
                        <input id="genre-academy" class="radioset-input input-line" type="radio" name="orderKeyword" type="radio" value="학원" ${search.orderKeyword == '학원' ? 'checked' : ''}>
                        <label class="radioset-label" for="genre-academy"></label>
                        <span class="radioset-text">학원</span>
                    </div>

                    <!-- 장르 2: 액션 -->
                    <div class="radioset">
                        <input id="genre-action" class="radioset-input input-line" type="radio" name="orderKeyword" type="radio" value="액션" ${search.orderKeyword == '액션' ? 'checked' : ''}>
                        <label class="radioset-label" for="genre-action"></label>
                        <span class="radioset-text">액션</span>
                    </div>

                    <!-- 장르 3: SF -->
                    <div class="radioset">
                        <input id="genre-sf" class="radioset-input input-line" type="radio" name="orderKeyword" type="radio" value="SF" ${search.orderKeyword == 'SF' ? 'checked' : ''}>
                        <label class="radioset-label" for="genre-sf"></label>
                        <span class="radioset-text">SF</span>
                    </div>

                    <!-- 장르 4: 판타지 -->
                    <div class="radioset">
                        <input id="genre-fantasy" class="radioset-input input-line" type="radio" name="orderKeyword" type="radio" value="판타지" ${search.orderKeyword == '판타지' ? 'checked' : ''}>
                        <label class="radioset-label" for="genre-fantasy"></label>
                        <span class="radioset-text">판타지</span>
                    </div>

                    <!-- 장르 5: 개그 -->
                    <div class="radioset">
                        <input id="genre-comedy" class="radioset-input input-line" type="radio" name="orderKeyword" type="radio" value="개그" ${search.orderKeyword == '개그' ? 'checked' : ''}>
                        <label class="radioset-label" for="genre-comedy"></label>
                        <span class="radioset-text">개그</span>
                    </div>

                    <!-- 장르 6: 로맨스 -->
                    <div class="radioset">
                        <input id="genre-romance" class="radioset-input input-line" type="radio" name="orderKeyword" type="radio" value="로맨스" ${search.orderKeyword == '로맨스' ? 'checked' : ''}>
                        <label class="radioset-label" for="genre-romance"></label>
                        <span class="radioset-text">로맨스</span>
                    </div>

                    <!-- 장르 7: 스포츠 -->
                    <div class="radioset">
                        <input id="genre-sports" class="radioset-input input-line" type="radio" name="orderKeyword" type="radio" value="스포츠" ${search.orderKeyword == '스포츠' ? 'checked' : ''}>
                        <label class="radioset-label" for="genre-sports"></label>
                        <span class="radioset-text">스포츠</span>
                    </div>

                    <!-- 장르 8: 일상 -->
                    <div class="radioset">
                        <input id="genre-sliceoflife" class="radioset-input input-line" type="radio" name="orderKeyword" type="radio" value="일상" ${search.orderKeyword == '일상' ? 'checked' : ''}>
                        <label class="radioset-label" for="genre-sliceoflife"></label>
                        <span class="radioset-text">일상</span>
                    </div>

                    <!-- 장르 9: 추리 -->
                    <div class="radioset">
                        <input id="genre-mystery" class="radioset-input input-line" type="radio" name="orderKeyword" type="radio" value="추리" ${search.orderKeyword == '추리' ? 'checked' : ''}>
                        <label class="radioset-label" for="genre-mystery"></label>
                        <span class="radioset-text">추리</span>
                    </div>

                    <!-- 장르 10: 스릴러 -->
                    <div class="radioset">
                        <input id="genre-thriller" class="radioset-input input-line" type="radio" name="orderKeyword" type="radio" value="스릴러" ${search.orderKeyword == '스릴러' ? 'checked' : ''}>
                        <label class="radioset-label" for="genre-thriller"></label>
                        <span class="radioset-text">스릴러</span>
                    </div>

                    <!-- 장르 11: 무협 -->
                    <div class="radioset">
                        <input id="genre-martialarts" class="radioset-input input-line" type="radio" name="orderKeyword" type="radio" value="무협" ${search.orderKeyword == '무협' ? 'checked' : ''}>
                        <label class="radioset-label" for="genre-martialarts"></label>
                        <span class="radioset-text">무협</span>
                    </div>

                    <!-- 장르 12: 기타 -->
                    <div class="radioset">
                        <input id="genre-others" class="radioset-input input-line" type="radio" name="orderKeyword" type="radio" value="기타" ${search.orderKeyword == '기타' ? 'checked' : ''}>
                        <label class="radioset-label" for="genre-others"></label>
                        <span class="radioset-text">기타</span>
                    </div>
                </div>


                <div class="checkset-wrap">
                    <div class="checkset">
                        <input id="checkset-a-1-1" class="checkset-input input-fill" type="checkbox" name="orderCondition" value="1" ${!empty search.orderCondition && search.orderCondition == 1 ? "checked" : ""}>
                        <label class="checkset-label" for="checkset-a-1-1"></label>
                        <span class="checkset-text">조회순</span>
                    </div>
                </div>

                <!-- 작품 검색 -->
                <div class="contents-search">
                    <p class="contents-result">전체<span id="totalCount"> ${totalCount}</span>개</p>
                    <div class="inputset">
                        <button class="inputset-icon icon-right icon-search btn" type="button" aria-label="검색"></button>
                        <input type="text" class="inputset-input form-control" placeholder="검색어를 입력해주세요." aria-label="검색어" id="searchKeyword" name="searchKeyword" value="${! empty search.searchKeyword ? search.searchKeyword : '' }">
                    </div>
                </div>

                <!-- 작품 목록 -->
                <div class="contents-group">
                    <div class="work-items-container custom-work-list">
                        <div class="container-md" id="workList">

                        </div>
                    </div>


                    </div>
                </div>
        </div>
    </div>
    </div>
</main>

<!-- 추가된 작업 목록을 저장할 div 요소 -->
<div id="additionalWorkList"></div>

<!-- 페이지 정보를 저장할 hidden input -->
<input type="hidden" id="currentPage" value="${search.currentPage}" />
<input type="hidden" id="loading" value="false" />

<!-- [S]thwhole-wfLpW5Z3pJ -->
<%--<%@ include file="../layout/footer.jsp" %>--%>
<jsp:include page="../layout/footer.jsp" flush="true"/>
<!-- [E]thwhole-wfLpW5Z3pJ -->

</body>
<script>
    function viewWorkDetail(workNo) {
        window.location.href = "../work/getDetailWork?workNo=" + workNo;
    }

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
                        pageSize: 5
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
                    pageSize: 5
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
            var workList = $("#workList"); // 컨테이너의 ID에 맞게 조정
            $.each(workItems, function(index, work) {
                var contentItem = $("<div></div>").addClass("contents-cardlist contents-cardlist-active");
                var link = $("<a></a>").attr("href", "javascript:void(0)").addClass("cardset");

                var figure = $("<figure></figure>").addClass("cardset-figure");
                var img = $("<img>").addClass("cardset-img").attr("src", work.thumbnail).attr("alt", "이미지");
                figure.append(img);

                var cardBody = $("<div></div>").addClass("cardset-body");
                var titleGroup = $("<div></div>").addClass("cardset-tit-group");
                titleGroup.append("<h5 class='cardset-tit'>" + work.workName + "</h5>");
                cardBody.append(titleGroup);

                // FAP, 장르, 카테고리 정보 추가
                var fapText = work.fap == 0 ? "무료" : "유료";
                var genreText = getGenreText(work.genre1, work.genre2, work.genre3); // 'work.genre'는 예시입니다. 실제 속성 이름에 맞게 조정
                var categoryText = getCategoryText(work.category); // 'getCategoryText' 함수를 사용

                var desc = $("<p></p>").addClass("cardset-desc")
                    .text("유/무료: " + fapText + " | 장르: " + genreText + " | 카테고리: " + categoryText);
                cardBody.append(desc);

                link.append(figure).append(cardBody);
                contentItem.append(link);
                workList.append(contentItem);
            });
        }
    });
</script>





</html>
