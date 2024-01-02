<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<head>
    <title>회원 목록</title>
    <link rel="stylesheet" href="../user/css/setting.css">
    <link rel="stylesheet" href="../user/css/plugin.css">
    <link rel="stylesheet" href="../user/css/template.css">
    <link rel="stylesheet" href="../user/css/common.css">
    <link rel="stylesheet" href="../user/css/style.css">
    
    <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <script>
        // JavaScript에서 JSP 변수를 사용하기 위한 설정
        var list = ${list};
        var search = ${search};

        // JavaScript를 사용하여 브라우저 콘솔에 로그 출력
        console.log("리스트 list&count map를 출력해보자 :::::", list);
        console.log("리스트 search 출력해보자 :::::", search);

    </script>

</head>

<body>
<%@ include file="../layout/top.jsp" %>
<main class="th-layout-main ">
    <div class="thpart-HmlqLtFlNZ" data-bid="HmlqLtFlNZ" id="">
        <div class="contents-container">
            <img class="contents-backimg" src="https://images.unsplash.com/photo-1624007435086-7e236df42151?crop=entropy&amp;cs=tinysrgb&amp;fit=max&amp;fm=jpg&amp;ixid=M3w0OTE2MDd8MHwxfHNlYXJjaHwxOTh8fCVFRCU5RCU5MSVFQiVCMCVCMXxrb3wwfHx8YmxhY2tfYW5kX3doaXRlfDE3MDM1ODMzNjB8MA&amp;ixlib=rb-4.0.3&amp;q=80&amp;w=1080" alt="">
            <div class="contents-body container-md">
                <h2 class="contents-title"> Support </h2>
                <h7 class="contents-sub">고객센터</h7>
            </div>
        </div>
    </div>
    <!-- [S]hooms-N36 -->
    <div class="hooms-N36" data-bid="iSLqLSg68L" id="">
        <div class="contents-inner">
            <div class="contents-container container-md">
                <div class="textset textset-h2">
                    <h2 class="textset-tit">회원 리스트</h2>
                </div>

                    <div class="contents-search">
                        <p class="contents-result"> 전체 회원수 : <span> ${totalCount}</span> 명 </p>
                        <form action="../user/listUser">
                            <div class="contents-form">
                                    <div class="selectset selectset-lg">
                                        <select class="selectset-toggle btn" name="searchCondition">
                                            <option value="0" ${!empty search.searchCondition && search.searchCondition == 0 ? "selected" : ""}>닉네임</option>
                                            <option value="1" ${!empty search.searchCondition && search.searchCondition == 1 ? "selected" : ""}>회원명</option>
                                        </select>
                                    </div>
                                    <div class="inputset inputset-lg">
                                        <button class="inputset-icon icon-right icon-search btn" type="button" aria-label="아이콘"></button>
                                        <input type="text" class="inputset-input form-control" name="searchKeyword"
                                               value="${! empty search.searchKeyword ? search.searchKeyword : ''}" placeholder="검색어를 입력해주세요." aria-label="내용">
                                    </div>
                            </div>
                        </form>
                    </div>
                    <a href="listUser">전체목록보기</a>

                <div class="tableset">
                    <table class="tableset-table table">
                        <colgroup>
                            <col>
                            <col>
                            <col>
                            <col>
                            <col>
                            <col>
                            <col>
                        </colgroup>
                        <thead class="thead-light thead-border-top">
                        <tr>
                            <th scope="col">No.</th>
                            <th scope="col">닉네임</th>
                            <th scope="col">성명</th>
                            <th scope="col">휴대번호</th>
                            <th scope="col">이메일</th>
                            <th scope="col">정지현황</th>
                            <th scope="col">가입일</th>
                        </tr>
                        </thead>
                        <tbody>
                        <fmt:parseDate value="201701292359" pattern="yyyyMMddHHmm" var="endDate" />
                        <jsp:useBean id="now" class="java.util.Date"/>
                        <fmt:formatDate var="today" value="${now}" pattern="yyyy-MM-dd"/>

                        <c:set var="i" value="0"/>
                        <c:forEach var="user" items="${list}">
                            <c:set var="i" value="${i + 1}"/>
                            <fmt:formatDate var="banDate" value="${user.banDate}" pattern="yyyy-MM-dd"/>
                            <tr class="ct_list_pop">
                            <td class="tableset-mobile">${i}</td>
                            <td class="tableset-category tableset-order03" style=" text-align: left;">
                                <img src="../file/user/${user.userImage}" width="20" style="border-radius: 100%; max-width: 20%; " alt=""/>
                                    ${user.nickName}</td>
                            <td class="tableset-tit tableset-order02">
                              ${user.userName}
                            </td>
                            <td class="tableset-order05" >${user.phone}</td>
                            <td class="tableset-order04">${user.email}</td>
                            <td class="tableset-order01">
                                <c:choose>
                                    <c:when test="${today lt banDate}">
                                    <div class="badgeset badgeset-active">정지</div>
                                    </c:when>
                                    <c:otherwise>
                                    <div class="badgeset">미정지</div>
                                    </c:otherwise>
                                </c:choose>

                                <!--div class="badgeset badgeset-active">${user.banDate}</div-->
                            </td>
                            <td class="tableset-mobile">${user.rDate}</td>
                        </tr>
                                <!--div class="badgeset">대기</div-->
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</main>
</body>
    <script src="../user/js/setting.js"></script>
    <script src="../user/js/plugin.js"></script>
    <script src="../user/js/template.js"></script>
    <script src="../user/js/common.js"></script>
    <script src="../user/js/script.js"></script>

    <%@ include file="../layout/bottom.jsp" %>



</html>
