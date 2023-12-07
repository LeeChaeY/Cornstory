<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
    <title>작업 목록</title>
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
</head>
<body>

<h2>작업 목록</h2>

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
<table border="1">
    <thead>
    <tr>
        <th>작업 번호</th>
        <th>작성자</th>
        <th>카테고리</th>
        <th>장르</th>
        <th>FAP</th>
        <th>작업 이름</th>
        <th>메모</th>
        <th>썸네일</th>
        <th>조회 수</th>
        <th>작업 일자</th>
        <th>창작여부</th>
        <th>작업 설명</th>
    </tr>
    </thead>
    <tbody id="workListBody">
    <c:forEach var="work" items="${list}">
        <tr>
            <td>${work.workNo}</td>
            <td><a href="../work/getDetailWork?workNo=${work.workNo}">${work.userId}</a></td>
            <td>
                <c:choose>
                    <c:when test="${work.category eq '0'}">웹소설</c:when>
                    <c:when test="${work.category eq '1'}">웹툰</c:when>
                    <c:when test="${work.category eq '2'}">웹드라마</c:when>
                    <c:otherwise>기타</c:otherwise>
                </c:choose>
            </td>
            <td>
                ${work.genre1}
                <c:if test="${not empty work.genre2}">, ${work.genre2}</c:if>
                <c:if test="${not empty work.genre3}">, ${work.genre3}</c:if>
            </td>
            <td>${work.fap == 0 ? '무료' : '유료'}</td>
            <td>${work.workName}</td>
            <td>${work.note}</td>
            <td>${work.thumbnail}</td>
            <td><fmt:formatNumber value="${work.viewCnt}" pattern="#,##0" /></td>
            <td>${work.workDate}</td>
            <td>${work.status == 0 ? '원작' : '창작'}</td>
            <td>${work.workDesc}</td>
        </tr>
    </c:forEach>
    </tbody>
</table>

<p>전체 개수: <span id="totalCount">${totalCount}</span></p>

</body>
<script>
    $(document).ready(function() {
        //updateWorkList();
        // 검색 폼의 라디오 버튼이나 체크 박스 변경 시에 검색 수행
        $("#searchForm").on("change", "input[type='radio'], input[type='checkbox']", function() {
                // 초기 로드가 아닌 경우에만 updateWorkList 함수 호출
                updateWorkList();
        });



        function updateWorkList() {

            // 검색 조건 수집
            var searchCondition = $("input[name='searchCondition']:checked").val();
            var orderKeyword = $("input[name='orderKeyword']:checked").val();
            var orderCondition = $("input[name='orderCondition']:checked").val();

            // Ajax를 사용하여 작품 목록 요청
            $.ajax({
                type: "GET",
                url: "/work/json/listWork",
                data: {
                    searchCondition: searchCondition,
                    orderKeyword: orderKeyword,
                    orderCondition: orderCondition
                },
                dataType: "json",
                success: function(response) {
                    // 성공적으로 응답을 받았을 때 처리
                    console.log(response.list);

                    // 작품 목록을 동적으로 생성하여 화면에 추가
                    var workListBody = $("#workListBody");
                    workListBody.empty();  // 기존 목록 제거

                    $.each(response.list, function(index, work) {
                        var row = $("<tr></tr>");

                        row.append("<td>" + work.workNo + "</td>");
                        row.append("<td><a href='../work/getDetailWork?workNo=" + work.workNo + "'>" + work.userId + "</a></td>");
                        if(work.category == '0'){
                            row.append("<td>웹소설</td>");
                        }else if(work.category == '1'){
                            row.append("<td>웹툰</td>");
                        }else if(work.workcategory == '2'){
                            row.append("<td>웹드라마</td>");
                        }
                        var genreText = (work.genre1 || "") + (work.genre2 ? ", " + work.genre2 : "") + (work.genre3 ? ", " + work.genre3 : "");
                        row.append("<td>" + genreText + "</td>");
                        var fap = work.fap == 0 ? "무료" : "유료";
                        row.append("<td>" + fap + "</td>");
                        row.append("<td>" + work.workName + "</td>");
                        row.append("<td>" + work.note + "</td>");
                        row.append("<td>" + work.thumbnail+ "</td>");
                        row.append("<td>" + work.viewCnt+ "</td>");
                        row.append("<td>" + work.workDate+ "</td>");
                        var status = work.status ==0 ? "원작" : "창작";
                        row.append("<td>" + status+ "</td>");
                        row.append("<td>" + work.workDesc+ "</td>");



                        workListBody.append(row);
                    });

                    $("#totalCount").text(response.totalCount);
                },
                error: function(error) {
                    console.error("Error fetching work list: ", error);
                }
            });
        }



    });
</script>

</html>
