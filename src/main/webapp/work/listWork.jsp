<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
    <title>작품 조회 목록</title>
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

    <style>
        body {
            font-family: 'Arial', sans-serif;
            margin: 20px;
        }

        h2 {
            color: #333;
        }

        #searchForm {
            margin-bottom: 20px;
        }

        #workList {
            display: flex;
            flex-wrap: wrap;
        }

        .work-item {
            border: 1px solid #ccc;
            border-radius: 5px;
            padding: 10px;
            margin: 10px;
            width: 300px;
        }

        #totalCount {
            font-weight: bold;
        }
    </style>
</head>
<body>

<h2>작품 조회 목록</h2>

<form id="searchForm" action="../work/listWork" method="get">
    <label for="searchKeyword">검색 키워드:</label>
    <input type="text" id="searchKeyword" name="searchKeyword" value="${! empty search.searchKeyword ? search.searchKeyword : '' }" />
    <button type="submit">검색</button>
    <label>카테고리:</label>
    <label>
        <input type="radio" name="searchCondition" value="0" ${ ! empty search.searchCondition && search.searchCondition==0 ? "checked" : ""}/> 웹소설
    </label>
    <label>
        <input type="radio" name="searchCondition" value="1" ${ ! empty search.searchCondition && search.searchCondition==1 ? "checked" : ""}/> 웹툰
    </label>
    <label>
        <input type="radio" name="searchCondition" value="2" ${ ! empty search.searchCondition && search.searchCondition==2 ? "checked" : ""}/> 웹드라마
    </label>

    <label>장르:</label>
    <label>
        <input type="radio" name="orderKeyword" value="학원" ${search.orderKeyword == '학원' ? 'checked' : ''}/> 학원
    </label>
    <label>
        <input type="radio" name="orderKeyword" value="액션" ${search.orderKeyword == '액션' ? 'checked' : ''}/> 액션
    </label>
    <label>
        <input type="radio" name="orderKeyword" value="SF" ${search.orderKeyword == 'SF' ? 'checked' : ''}/> SF
    </label>
    <label>
        <input type="radio" name="orderKeyword" value="판타지" ${search.orderKeyword == '판타지' ? 'checked' : ''}/> 판타지
    </label>
    <label>
        <input type="radio" name="orderKeyword" value="개그" ${search.orderKeyword == '개그' ? 'checked' : ''}/> 개그
    </label>
    <label>
        <input type="radio" name="orderKeyword" value="로맨스" ${search.orderKeyword == '로맨스' ? 'checked' : ''}/> 로맨스
    </label>
    <label>
        <input type="radio" name="orderKeyword" value="스포츠" ${search.orderKeyword == '스포츠' ? 'checked' : ''}/> 스포츠
    </label>
    <label>
        <input type="radio" name="orderKeyword" value="일상" ${search.orderKeyword == '일상' ? 'checked' : ''}/> 일상
    </label>
    <label>
        <input type="radio" name="orderKeyword" value="추리" ${search.orderKeyword == '추리' ? 'checked' : ''}/> 추리
    </label>
    <label>
        <input type="radio" name="orderKeyword" value="스릴러" ${search.orderKeyword == '스릴러' ? 'checked' : ''}/> 스릴러
    </label>
    <label>
        <input type="radio" name="orderKeyword" value="무협" ${search.orderKeyword == '무협' ? 'checked' : ''}/> 무협
    </label>
    <label>
        <input type="radio" name="orderKeyword" value="기타" ${search.orderKeyword == '기타' ? 'checked' : ''}/> 기타
    </label>

    <label>조회수 : </label>
    <label>
        <input type="checkbox" name="orderCondition" value="1" ${!empty search.orderCondition && search.orderCondition == 1 ? "checked" : ""}/>조회순
    </label>


</form>

<p>전체 개수: <span id="totalCount">${totalCount}</span></p>

<!-- 기존의 table 대신 div를 사용한 목록 부분 -->
<div id="workList">
<%--        <div class="work-item">--%>
<%--            <p>작성자: ${work.userId}</p>--%>
<%--            <td>--%>
<%--                <c:choose>--%>
<%--                    <c:when test="${work.category eq '0'}">웹소설</c:when>--%>
<%--                    <c:when test="${work.category eq '1'}">웹툰</c:when>--%>
<%--                    <c:when test="${work.category eq '2'}">웹드라마</c:when>--%>
<%--                    <c:otherwise>기타</c:otherwise>--%>
<%--                </c:choose>--%>
<%--            </td>--%>
<%--            <td>--%>
<%--                    ${work.genre1}--%>
<%--                <c:if test="${not empty work.genre2}">, ${work.genre2}</c:if>--%>
<%--                <c:if test="${not empty work.genre3}">, ${work.genre3}</c:if>--%>
<%--            </td>--%>
<%--            <p>FAP: ${work.fap == 0 ? '무료' : '유료'}</p>--%>
<%--            <p>작업 이름: ${work.workName}</p>--%>
<%--            <p>썸네일: <a href='../work/getDetailWork?workNo=${work.workNo}'>${work.thumbnail}</a></p>--%>
<%--            <p>조회 수: <fmt:formatNumber value="${work.viewCnt}" pattern="#,##0" /></p>--%>
<%--            <p>작업 일자: ${work.workDate}</p>--%>
<%--            <p>창작여부: ${work.status == 0 ? '원작' : '창작'}</p>--%>
<%--        </div>--%>
</div>

<!-- 추가된 작업 목록을 저장할 div 요소 -->
<div id="additionalWorkList"></div>

<!-- 페이지 정보를 저장할 hidden input -->
<input type="hidden" id="currentPage" value="${search.currentPage}" />
<input type="hidden" id="loading" value="false" />

</body>
<script>
    $(document).ready(function () {
        // 검색 폼의 라디오 버튼이나 체크 박스 변경 시에 검색 수행
        $("#searchForm").on("change", "input[type='radio'], input[type='checkbox']", function () {
            // 초기 로드가 아닌 경우에만 updateWorkList 함수 호출
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

                // 로딩 중 상태로 변경
                $("#loading").val("true");

                $.ajax({
                    type: "GET",
                    url: "/work/json/listWork",
                    data: {

                        searchCondition: $("input[name='searchCondition']:checked").val(),
                        orderKeyword: $("input[name='orderKeyword']:checked").val(),
                        orderCondition: $("input[name='orderCondition']:checked").val(),
                        searchKeyword: $("#searchKeyword").val(),
                        currentPage: currentPage,
                        pageSize: 3
                    },
                    dataType: "json",
                    success: function (response) {
                        var workList = $("#workList");

                        $.each(response.list, function (index, work) {
                            // 중복 작품인지 체크
                            if (workList.find(".work-item[data-workno='" + work.workNo + "']").length === 0) {
                                var workItem = $("<div class='work-item' data-workno='" + work.workNo + "'></div>");

                                workItem.append("<p>작성자: " + work.userId + "</p>");

                                // 카테고리 텍스트 처리
                                var categoryText = getCategoryText(work.category);
                                workItem.append("<p>카테고리: " + categoryText + "</p>");

                                // 장르 텍스트 처리
                                var genreText = getGenreText(work.genre1, work.genre2, work.genre3);
                                workItem.append("<p>장르: " + genreText + "</p>");

                                // FAP 텍스트 처리
                                var fapText = work.fap == 0 ? "무료" : "유료";
                                workItem.append("<p>FAP: " + fapText + "</p>");

                                workItem.append("<p>작업 이름: " + work.workName + "</p>");
                                workItem.append("<p>썸네일: <a href='../work/getDetailWork?workNo=" + work.workNo + "'>" + work.thumbnail + "</a></p>");
                                workItem.append("<p>조회 수: " + work.viewCnt + "</p>");
                                workItem.append("<p>작업 일자: " + work.workDate + "</p>");

                                // 창작여부 텍스트 처리
                                var statusText = work.status == 0 ? '원작' : '창작';
                                workItem.append("<p>창작여부: " + statusText + "</p>");

                                workList.append(workItem);
                            }
                        });

                        // 현재 페이지 업데이트
                        $("#currentPage").val(currentPage + 1);

                        // 로딩 완료 상태로 변경
                        $("#loading").val("false");
                    },
                    error: function (error) {
                        console.error("Error fetching work list: ", error);

                        // 로딩 완료 상태로 변경
                        $("#loading").val("false");
                    }
                });
            }
        }

        function updateWorkList(clearList) {
            // 검색 조건 수집
            var searchCondition = $("input[name='searchCondition']:checked").val();
            var orderKeyword = $("input[name='orderKeyword']:checked").val();
            var orderCondition = $("input[name='orderCondition']:checked").val();
            var searchKeyword = $("#searchKeyword").val(); // 검색 키워드 수집

            var currentPage = 1;
            if (!clearList) {
                // 추가 데이터 로드가 아닌 경우 현재 페이지를 가져옴
                currentPage = parseInt($("#currentPage").val());
            }

            // Ajax를 사용하여 작품 목록 요청
            $.ajax({
                type: "GET",
                url: "/work/json/listWork",
                data: {
                    searchCondition: searchCondition,
                    orderKeyword: orderKeyword,
                    orderCondition: orderCondition,
                    //searchKeyword: searchKeyword,
                    currentPage: currentPage,
                    pageSize: 3
                },
                dataType: "json",
                success: function(response) {
                    // 성공적으로 응답을 받았을 때 처리
                    console.log(response.list);

                    if (clearList) {
                        // 초기 로드가 아닌 경우 기존 목록을 제거
                        $("#workList").empty();
                    }

                    // 작품 목록을 동적으로 생성하여 화면에 추가
                    var workList = $("#workList");
                    $.each(response.list, function(index, work) {
                        // 중복 작품인지 체크
                        if (workList.find(".work-item[data-workno='" + work.workNo + "']").length === 0) {
                            var workItem = $("<div class='work-item' data-workno='" + work.workNo + "'></div>");

                            workItem.append("<p>작성자:"  + work.userId + "</p>");
                            var categoryText = getCategoryText(work.category);
                            workItem.append("<p>카테고리: " + categoryText + "</p>");
                            var genreText = getGenreText(work.genre1, work.genre2, work.genre3);
                            workItem.append("<p>장르: " + genreText + "</p>");
                            var fap = work.fap == 0 ? "무료" : "유료";
                            workItem.append("<p>FAP: " + fap + "</p>");
                            workItem.append("<p>작업 이름: " + work.workName + "</p>");
                            workItem.append("<p>썸네일: <a href='../work/getDetailWork?workNo=" + work.workNo + "'>" + work.thumbnail + "</a></p>");
                            workItem.append("<p>조회 수: " + work.viewCnt + "</p>");
                            workItem.append("<p>작업 일자: " + work.workDate + "</p>");
                            var status = work.status === 0 ? "원작" : "창작";
                            workItem.append("<p>창작여부: " + status + "</p>");
                            workItem.append("<p>작업 설명: " + work.workDesc + "</p>");

                            workList.append(workItem);
                        }
                    });

                    $("#currentPage").val(currentPage + 1);
                    $("#totalCount").text(response.totalCount);
                },
                error: function(error) {
                    console.error("Error fetching work list: ", error);
                }
            });
        }

        // 작품 카테고리 번호를 텍스트로 변환하는 함수
        function getCategoryText(category) {
            switch (category) {
                case '0':
                    return "웹소설";
                case '1':
                    return "웹툰";
                case '2':
                    return "웹드라마";
                default:
                    return "웹소설";
            }
        }

        // 작품 장르를 텍스트로 변환하는 함수
        function getGenreText(genre1, genre2, genre3) {
            var result = "";
            if (genre1) {
                result += genre1;
            }
            if (genre2) {
                result += ", " + genre2;
            }
            if (genre3) {
                result += ", " + genre3;
            }
            return result;
        }
    });
</script>

</html>
