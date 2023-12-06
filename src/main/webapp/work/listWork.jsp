<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원 목록 조회</title>

    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

    <script>
        var page = 1; // 현재 페이지 초기화

        // 스크롤이 맨 아래로 갔을 때 다음 페이지의 데이터를 로드하는 함수
        function loadNextPage() {
            $.ajax({
                url: "/user/listUser", // 데이터를 로드할 서버의 URL
                type: "GET",
                data: {
                    page: page, // 현재 페이지 번호 전달
                    searchCondition: "${search.searchCondition}",
                    searchKeyword: "${search.searchKeyword}"
                },
                success: function (data) {
                    if (data.trim() !== "") {
                        // 서버에서 받은 데이터를 테이블에 추가
                        $("#userTable tbody").append(data);
                        page++; // 페이지 번호 증가
                    }
                },
                error: function (error) {
                    console.error("Error loading next page: ", error);
                }
            });
        }

        // 스크롤 이벤트 리스너
        $(window).scroll(function () {
            if ($(window).scrollTop() + $(window).height() >= $(document).height() - 100) {
                loadNextPage(); // 스크롤이 맨 아래로 갔을 때 다음 페이지 로드
            }
        });

        // 페이지 로드 시 초기 데이터 로딩
        $(document).ready(function () {
            loadNextPage();
        });
    </script>
</head>

<body bgcolor="#ffffff" text="#000000">

<div style="width:98%; margin-left:10px;">

    <table id="userTable" width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
        <!-- 테이블 헤더 및 기타 부분은 동일하게 유지 -->

        <c:set var="i" value="0" />
        <c:forEach var="user" items="${resultPage.list}">
            <tr>
                <!-- 테이블 데이터 부분도 동일하게 유지 -->
            </tr>
            <tr>
                <!-- 각 사용자 정보 출력 부분도 동일하게 유지 -->
            </tr>
            <c:set var="i" value="${i + 1}" />
        </c:forEach>

    </table>

</div>

</body>
</html>
