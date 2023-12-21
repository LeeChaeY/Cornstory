<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">

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
  <title>cornstory</title>
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


</head>
<body>
<main class="th-layout-main ">
  <%@ include file="../layout/top.jsp" %>
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
        <c:choose>
          <c:when test="${param.category eq '0'}">
            <input type="text" id="supCategory" name="supCategory" value="0" style="display: none;">
            <h2 class="textset-tit">공지사항</h2><br>
            <c:choose>
              <c:when test="${sessionScope.user != null and sessionScope.user.role eq 1}">
                <a href="addSupport?category=0">작성하기</a>
              </c:when>
            </c:choose>
          </c:when>
          <c:when test="${param.category eq '1'}">
            <input type="text" id="supCategory" name="supCategory" value="1" style="display: none;">
            <h2 class="textset-tit">Q&A</h2><br>

            <a href="addSupport?category=1">
            <c:choose>
              <c:when test="${sessionScope.user != null and sessionScope.user.role eq 0}">
                질문하기
              </c:when>
            </c:choose>
            </a>
          </c:when>
          <c:when test="${param.category eq '2'}">
            <input type="text" id="supCategory" name="supCategory" value="2" style="display: none;">
            <h2 class="textset-tit">신고센터</h2><br>
          </c:when>
        </c:choose>



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
                <c:if test="${param.category eq '0'}">
                  <th scope="col">내용</th>

                </c:if>
                <c:if test="${param.category eq '1'}">
                  <th scope="col">질문 내용</th>
                  <th scope="col">질문자 닉네임</th>
                  <th scope="col">답변 내용</th>
                  <th scope="col">답변 작성자</th>
                </c:if>

                <c:if test="${param.category eq '2'}">
                  <th scope="col">신고 접수한 회원</th>
                  <th scope="col">신고 접수된 회원</th>
                  <th scope="col">신고 접수 내용</th>
                  <th scope="col">신고 URL</th>
                  <th scope="col">추가자료</th>
                  <th scope="col">조치</th>
                </c:if>
                <th class="last-child" scope="col">등록일</th>

              </tr>
              </thead>
              <tbody>
              <c:set var="i" value="0"/>
              <c:forEach var="support" items="${list}">
                <c:choose>

                  <c:when test="${param.category eq '0' and support.supCategory eq '0'}">
                    <c:set var="i" value="${i + 1}"/>
                    <tr class="ct_list_pop" style=" margin: 0 auto; max-width: 500px;">
                      <td class="number">${i}</td>
                      <td>
                        <a href="getSupport?supNo=${support.supNo}">${support.supName}</a>
                      </td>
                      <td class="last-child">${support.supDate}</td>

                    </tr>
                  </c:when>

                  <c:when test="${param.category eq '1' and support.supCategory eq '1'}">
                    <c:set var="i" value="${i + 1}"/>
                    <tr class="ct_list_pop">
                      <td class="number">${i}</td>
                      <td>
                        <a href="getSupport?supNo=${support.supNo}">${support.supName}</a>
                      </td>
                      <td>${support.userId}</td>
                      <td>${support.supPluscon}</td>
                      <td>${support.supId}</td>
                      <td class="last-child">${support.supDate}</td>
                    </tr>
                  </c:when>

                  <c:when test="${param.category eq '2' and support.supCategory eq '2'}">
                    <c:set var="i" value="${i + 1}"/>
                    <tr class="ct_list_pop">
                      <td class="number">${i}</td>
                      <td>${support.userId}</td>
                      <td>${support.supId}</td>
                      <td>${support.supName}</td>
                      <td><a href="${support.supPluscon}">URL</a></td>
                      <td>${support.supImage}</td>
                      <td>${support.supBan}일</td>
                      <td class="last-child">${support.supDate}</td>
                    </tr>
                  </c:when>
                </c:choose>
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
  <script src="../ssh/js/setting.js"></script>
  <script src="../ssh/js/plugin.js"></script>
  <script src="../ssh/js/template.js"></script>
  <script src="../ssh/js/common.js"></script>
  <script src="../ssh/js/script.js"></script>

</body>
<%@ include file="../layout/bottom.jsp" %>

