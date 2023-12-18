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

  <link rel="stylesheet" href="/lcy/css/style.css">
</head>
<body>
<main class="th-layout-main ">
  <%@ include file="../layout/top.jsp" %>
  <!-- [S]opilsol-N24 -->
  <div class="opilsol-N26" data-bid="dL11fYz8S6T" id="">
    <div class="content-container">
      <div class="container-md">
        <div class="tableset">
          <div class="tableset-inner">
            <div class="textset content-tit">
              <p class="textset-eu">고객센터</p>
              <c:choose>
                <c:when test="${param.category eq '0'}">
                  <input type="text" id="supCategory" name="supCategory" value="0" style="display: none;">
                  <h4 class="h4">공지사항</h4>

                  <a href="addSupport?category=0">작성하기</a>
                </c:when>
                <c:when test="${param.category eq '1'}">
                  <input type="text" id="supCategory" name="supCategory" value="1" style="display: none;">
                  <h4 class="h4">Q&A</h4>
                  <a href="addSupport?category=1">작성하기</a>
                </c:when>
                <c:when test="${param.category eq '2'}">
                  <input type="text" id="supCategory" name="supCategory" value="2" style="display: none;">
                  <h4 class="h4">신고센터</h4>
                  <p class="textset-eu">작성하기</p>
                </c:when>
              </c:choose>

            </div>
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
                    <tr class="ct_list_pop">
                      <td class="number">${i}</td>
                      <td>
                        <a href="getSupport?supNo=${support.supNo}">${support.supContent}</a>
                      </td>
                      <td class="last-child">${support.supDate}</td>
                    </tr>
                  </c:when>

                  <c:when test="${param.category eq '1' and support.supCategory eq '1'}">
                    <c:set var="i" value="${i + 1}"/>
                    <tr class="ct_list_pop">
                      <td class="number">${i}</td>
                      <td>
                        <a href="javascript:void(0)">${support.supContent}</a>
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
                      <td>${support.supContent}</td>
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
      </div>

    </div>
  </div>
  <!-- [E]opilsol-N24 -->

</main>
  <script src="../ssh/js/setting.js"></script>
  <script src="../ssh/js/plugin.js"></script>
  <script src="../ssh/js/template.js"></script>
  <script src="../ssh/js/common.js"></script>
  <script src="../ssh/js/script.js"></script>

</body>
<%@ include file="../layout/bottom.jsp" %>

