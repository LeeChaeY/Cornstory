<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <title>회원 정보 조회</title>
    <link rel="stylesheet" href="../user/css/setting.css">
    <link rel="stylesheet" href="../user/css/plugin.css">
    <link rel="stylesheet" href="../user/css/template.css">
    <link rel="stylesheet" href="../user/css/common.css">
    <link rel="stylesheet" href="../user/css/style.css">
    <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
   
</head>
<body>
<%@ include file="../layout/top.jsp" %>
<main class="th-layout-main ">

    <div class="thpart-HmlqLtFlNZ" data-bid="HmlqLtFlNZ" id="">
        <div class="contents-container">
            <img class="contents-backimg" src="https://images.unsplash.com/photo-1532276269954-64188308dcb3?crop=entropy&amp;cs=tinysrgb&amp;fit=max&amp;fm=jpg&amp;ixid=M3w0OTE2MDd8MHwxfHNlYXJjaHw0fHwlRUIlQTElOUMlRUElQjclQjglRUMlOUQlQjh8a298MHx8fGJsYWNrfDE3MDM1NjQ1NDB8MA&amp;ixlib=rb-4.0.3&amp;q=80&amp;w=1080" alt="">
            <div class="contents-body container-md">
                <h2 class="contents-title" contenteditable="true">UserPage</h2>
                <h7 class="contents-sub">회원</h7>
            </div>
        </div>
    </div>

    <div class="hooms-N46" data-bid="gvLQlsUZ0g" id="">
        <div class="contents-inner">
            <div class="contents-container container-md">
                <div class="textset textset-h2">
                    <h2 class="textset-tit">My Page</h2>
                </div>
                <div class="contents-top">
                    <div class="contents-tit">
                        <c:choose>
                            <c:when test="${user.role eq 0}">
                                <span class="contents-membership">회원</span>

                            </c:when>
                            <c:when test="${user.role eq 1}">
                                <span class="contents-membership">관리자</span>
                            </c:when>
                            <c:otherwise>
                                <!-- 기본값 처리 또는 특정 뱃지가 없을 경우의 처리 -->
                            </c:otherwise>
                        </c:choose>
                        <h3> <img class="textset-tit" src="../file/user/${sessionScope.user.userImage}" width="50" style="border-radius: 100%; max-width: 100%;" alt=""/>
                            <strong>${user.nickName}</strong>님 안녕하세요! </h3>
                    </div>
                    <c:choose>
                        <c:when test="${user.social eq 0}">
                            <span class="badgeset">일반회원</span>
                        </c:when>
                        <c:when test="${user.role eq 1}">
                            <span class="badgeset badgeset-active">소셜회원</span>
                        </c:when>
                        <c:otherwise>
                            <!-- 기본값 처리 또는 특정 뱃지가 없을 경우의 처리 -->
                        </c:otherwise>
                    </c:choose>
                </div>
                <div class="contents-bottom">
                    <ul class="contents-list">
                        <li class="contents-item">
                            <strong>아이디<br></strong>
                            <span>${user.userId}</span>
                        </li>
                        <li class="contents-item">
                            <strong>주소​<br></strong>
                            <span>${user.addr}</span>
                        </li>
                        <li class="contents-item">
                            <strong>상세주소</strong>
                            <span>${user.address}</span>
                        </li>
                        <li class="contents-item">
                            <strong>이메일</strong>
                            <span>${user.email}</span>
                        </li>
                        <li class="contents-item">
                            <strong>회원명</strong>
                            <span>${user.userName}</span>
                        </li>
                        <li class="contents-item">
                            <strong>휴대전화</strong>
                            <span>${user.phone}</span>
                        </li>
                        <li class="contents-item">
                            <strong>생년월일</strong>
                            <span>${user.birthday}</span>
                        </li>
                        <li class="contents-item">
                            <strong>가입일</strong>
                            <span>${user.rDate}</span>
                        </li>
                    </ul>
                    <div class="contents-btn">
                        <a class="btnset" href="updateUser?userId=${sessionScope.user.userId}">정보수정</a>

                        <a id="withdrawLink" href="#"><button class="btnset btnset-ghost" >회원탈퇴</button></a>
                    </div>
                </div>
                <c:if test="${param.deleted eq 'true'}">
                    <p style="color: green;">회원 탈퇴가 완료되었습니다.</p>
                </c:if>
            </div>
        </div>
    </div>
</main>


<script src="../user/js/setting.js"></script>
<script src="../user/js/plugin.js"></script>
<script src="../user/js/template.js"></script>
<script src="../user/js/common.js"></script>
<script src="../user/js/script.js"></script>
<script src="../user/js/getUser.js"></script>
<%@ include file="../layout/bottom.jsp" %>
</body>
</html>
