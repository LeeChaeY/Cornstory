<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="imagetoolbar" content="no">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="format-detection" content="telephone=no">
    <meta name="title" content="웹사이트">
    <meta name="description" content="웹사이트입니다.">
    <meta name="keywords" content="키워드,키워드,키워드">
    <meta property="og:title" content="웹사이트">
    <meta property="og:description" content="웹사이트입니다">
    <meta property="og:image" content="https://웹사이트/images/opengraph.png">
    <meta property="og:url" content="https://웹사이트">
    <title>회원 목록</title>
    <link rel="stylesheet" href="../ssh/css/setting.css">
    <link rel="stylesheet" href="../ssh/css/plugin.css">
    <link rel="stylesheet" href="../ssh/css/template.css">
    <link rel="stylesheet" href="../ssh/css/common.css">
    <link rel="stylesheet" href="../ssh/css/style.css">
    <link rel="stylesheet" href="../common/css/setting.css">
    <link rel="stylesheet" href="../common/css/plugin.css">
    <link rel="stylesheet" href="../common/css/template.css">
    <link rel="stylesheet" href="../common/css/common.css">
    <link rel="stylesheet" href="../common/css/style.css">

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
<div class="opilsol-N9" data-bid="jelQc7ixx3" >
    <div class="visual-container">
        <img class="visual-bg pc-img" src="../common/images/about-visual.jpg" alt="서브 비주얼 이미지">
        <img class="visual-bg mobile-img" src="../common/images/about-m-visual.jpg" alt="서브 비주얼 이미지">
        <div class="visual-txt-box container-md">
            <h2 class="visual-title"> 고객센터</h2>
            <p class="visual-description">회원과 관리자의 의사소통을 위한 공간</p>
        </div>
    </div>
</div>
<div class="opilsol-N33" data-bid="rzlQc7ixYC">
    <div class="content-container sub-menu">
    </div>
</div>
<div class="opilsol-N34" data-bid="mWLqC7iXyY">
    <div class="content-container container-md">
        <div class="textset content-tit">
            <p class="textset-eu">Support</p>
            <h2 class="textset-tit">회원목록</h2><br>
            <h5 class="textset-eu" id="totalUsers">전체 회원 수: ${totalCount} 명</h5>

                <form action="../user/listUser">
                    <div class="inputset inputset-line inputset-lg" style="display: flex; justify-content: flex-end;">

                        <div class="dropset-wrap" style="margin-top: 15px; margin-right: 15px;">
                            <div class="dropset dropset-solid"></div>
                            <div class="dropset dropset-solid">
                                <div class="selectset selectset-sm">
                                    <select class="selectset-toggle btn" name="searchCondition">
                                        <option value="0" ${!empty search.searchCondition && search.searchCondition == 0 ? "selected" : ""}>닉네임</option>
                                        <option value="1" ${!empty search.searchCondition && search.searchCondition == 1 ? "selected" : ""}>회원명</option>
                                    </select>
                                </div>
                            </div>
                        </div>

                        <input class="inputset-input form-control" type="text" id="searchKeyword" name="searchKeyword"
                               value="${! empty search.searchKeyword ? search.searchKeyword : ''}"
                               placeholder="검색어를 입력하세요" style="width: 600px;">

                        <button class="inputset-icon icon-right icon-search btn" type="button" aria-label="아이콘"></button>
                        <div class="inputset inputset-lg inputset-group"></div>
                    </div>
                    <a href="listUser">전체목록보기</a>
                </form>

        </div>
    </div>
</div>

    <div class="opilsol-N24" data-bid="EWLQc7iXZf" id="">
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
                                <th class="number" scope="col">NO</th>
                                <th scope="col">아이디</th>
                                <th scope="col">닉네임</th>
                                <th scope="col">성명</th>
                                <th scope="col">휴대전화</th>
                                <th scope="col">이메일</th>
                                <th scope="col">가입일</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:set var="i" value="0"/>
                            <c:forEach var="user" items="${list}">
                                <c:set var="i" value="${i + 1}"/>
                                <tr class="ct_list_pop">
                                    <td>${i}</td>
                                    <td><img src="../file/user/${user.userImage}" width="25" style="border-radius: 50%; max-width: 100%;" alt=""/>&nbsp;${user.userId}</td>
                                    <td>${user.nickName}</td>
                                    <td>${user.userName}</td>
                                    <td>${user.phone}</td>
                                    <td>${user.email}</td>
                                    <td>${user.rDate}</td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
                <nav class="pagiset pagiset-line">
                    <div class="pagiset-list">
                    </div>
                </nav>
            </div>
        </div>
    </div>

</main>
</body>
    <script src="../ssh/js/setting.js"></script>
    <script src="../ssh/js/plugin.js"></script>
    <script src="../ssh/js/template.js"></script>
    <script src="../ssh/js/common.js"></script>
    <script src="../ssh/js/script.js"></script>

    <%@ include file="../layout/bottom.jsp" %>



</html>
