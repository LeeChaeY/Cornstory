<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

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
  <link rel="stylesheet" href="../common/css/setting.css">
  <link rel="stylesheet" href="../common/css/plugin.css">
  <link rel="stylesheet" href="../common/css/template.css">
  <link rel="stylesheet" href="../common/css/common.css">
  <link rel="stylesheet" href="../common/css/style.css">

  <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
  <script src="http://localhost:3000/socket.io/socket.io.js"></script>
  <script>
    function redirectToIndex() {
      window.location.href = "../index.jsp";
    }

    $(function () {
      if ("${sessionScope.user}" !== "") {
        const socket = io.connect('http://localhost:3000');
        socket.emit("connection", {userId: "${sessionScope.user.userId}"});

        socket.on("message", async (data) => {
          console.log(data);
        });
      }


      $("span:contains('마이 채팅방')").on("click", function () {
        $("input[name='userStatus']").val(1);
        $("form[name='form']").attr("method", "post").attr("action", "/chat/listChatSpace").submit();
      });
      $("span:contains('구매내역')").on("click", function () {
        $("input[name='userStatus']").val(1);
        $("form[name='form']").attr("method", "post").attr("action", "/purchase/listPurchase").submit();
      });
      $("span:contains('판매내역')").on("click", function () {
        $("input[name='userStatus']").val(1);
        $("form[name='form']").attr("method", "post").attr("action", "/purchase/listSale").submit();
      });
      $(".popcornCnt").on("click", function () {
        $("input[name='userStatus']").val(1);
        $("form[name='form']").attr("method", "post").attr("action", "/purchase/listPurchase").submit();
      });
    });
  </script>

</head>

<body>
<form name="form">
  <input type="hidden" name="userStatus" value="">
</form>

<!-- [S]hooms-N56 -->
<div class="hooms-N56" data-bid="vdlqGbmgl8" id="">
  <div class="header-inner">

    <div class="header-container container-lg">

      <div class="header-left">
        <h1 class="header-title">
          <a class="header-logo" href="../index.jsp" title="main Page">
            <img src="../common/images/logo.png" style="margin-bottom: 50px" alt="로고">
          </a>
        </h1>

        <ul class="header-gnblist">
          <li class="header-gnbitem">
            <a class="header-gnblink" href="javascript:void(0)">
              <span>Work</span>
            </a>
            <ul class="header-sublist">
              <li class="header-subitem">
                <a class="header-sublink" href="/work/listWork">
                  <span>작품 리스트</span>
                </a>
              </li>
              <c:if test="${!empty sessionScope.user}">
                <li class="header-subitem">
                  <a class="header-sublink" href="/work/listBookmark">
                    <span>북마크</span>
                  </a>
                </li>
                <li class="header-subitem">
                  <a class="header-sublink" href="/work/getWork">
                    <span>작품관리</span>
                  </a>
                </li>
              </c:if>
            </ul>
          </li>
          <li class="header-gnbitem">
            <a class="header-gnblink" href="javascript:void(0)">
              <span>Story</span>
            </a>
            <ul class="header-sublist">
              <li class="header-subitem">
                <a class="header-sublink" href="/story/listStory">
                  <span>스토리 리스트</span>
                </a>
              </li>
              <c:if test="${!empty sessionScope.user}">
                <li class="header-subitem">
                  <a class="header-sublink" href="/story/getStory">
                    <span>마이 스토리</span>
                  </a>
                </li>
              </c:if>
            </ul>
          </li>
          <c:if test="${!empty sessionScope.user}">
            <li class="header-gnbitem">
              <a class="header-gnblink" href="javascript:void(0)">
                <span>Chat</span>
              </a>
              <ul class="header-sublist">
                <li class="header-subitem">
                  <a class="header-sublink" href="/chat/listChatSpace">
                    <span>채팅방 리스트</span>
                  </a>
                </li>
                <li class="header-subitem">
                  <a class="header-sublink" href="javascript:void(0)">
                    <span>마이 채팅방</span>
                  </a>
                </li>
              </ul>
            </li>
          </c:if>
          <li class="header-gnbitem">
            <a class="header-gnblink" href="javascript:void(0)">
              <span>Shop</span>
            </a>
            <ul class="header-sublist">
              <li class="header-subitem">
                <a class="header-sublink" href="/product/listProduct">
                  <span>상품 조회</span>
                </a>
              </li>
              <c:if test="${!empty sessionScope.user}">
                <li class="header-subitem">
                  <a class="header-sublink" href="/product/listProduct?prodCategory=2">
                    <span>저작권 등록</span>
                  </a>
                </li>
                <li class="header-subitem">
                  <c:if test="${sessionScope.user.role eq 1}">
                    <a class="header-sublink" href="/product/listProduct?prodCategory=0">
                      <span>팝콘 등록</span>
                    </a>
                  </c:if>
                </li>
                <li class="header-subitem">
                  <a class="header-sublink" href="javascript:void(0)">
                    <span>판매내역</span>
                  </a>
                </li>
                <li class="header-subitem">
                  <a class="header-sublink" href="javascript:void(0)">
                    <span>구매내역</span>
                  </a>
                </li>
              </c:if>
            </ul>
          </li>
          <li class="header-gnbitem">
            <a class="header-gnblink" href="javascript:void(0)">
              <span>Support</span>
            </a>
            <ul class="header-sublist">
              <li class="header-subitem">
                <a class="header-sublink" href="/support/listSupport?category=0">
                  <span>공지사항</span>
                </a>
              </li>
              <li class="header-subitem">

                <a class="header-sublink" href="/support/listSupport?category=1">
                  <span>Q&amp;A</span>
                </a>
              </li>
              <li class="header-subitem">
                <c:if test="${sessionScope.user.role eq 0}">
                  <a class="header-sublink" href="/support/report.jsp">
                    <span>신고</span>
                  </a>
                </c:if>
                <c:if test="${sessionScope.user.role eq 1}">
                  <a class="header-sublink" href="/support/listSupport?category=2">
                    <span>신고 관리</span>
                  </a>
                </c:if>
              </li>
              <li class="header-subitem">
                <c:if test="${sessionScope.user.role eq 1}">
                  <a class="header-sublink" href="/user/listUser">
                    <span>회원 리스트</span>
                  </a>
                </c:if>
              </li>

            </ul>
          </li>
        </ul>
      </div>
      <div class="header-right">
        <div class="header-utils">
          <c:choose>
            <c:when test="${empty sessionScope.user}">
              <a href="/user/login" class="btn-profile header-utils-btn" title="Login">
                <img src="../ssh/images/login.png" alt="로고">
              </a>
            </c:when>
            <c:otherwise>
              <li class="header-gnbitem">
                <a class="header-gnblink" href="javascript:void(0)">
                  <span><img src="../file/user/${sessionScope.user.userImage}" width="100" style="border-radius: 100%; max-width: 20%; margin-left:20px" alt=""/></span>
                    ${sessionScope.user.nickName}
                </a>
                <ul class="header-sublist">
                  <li class="header-subitem">
                    <a class="header-sublink" href="/user/getUser?userId=${sessionScope.user.userId}">
                      <span>마이페이지</span>
                    </a>
                  </li>
                  <li class="header-subitem">
                    <a class="header-sublink" href="javascript:void(0)">
                      <span>팝콘수: <fmt:formatNumber value="${sessionScope.user.popcornCnt}" pattern="#,##0"/>개</span>
                    </a>
                  </li>
                  <li class="header-subitem">
                    <c:choose>
                      <c:when test="${sessionScope.user.social eq 0}">
                        <form action="/user/logout" method="post">
                          <a  class="header-sublink" title="Logout" onclick="this.parentNode.submit(); return false;">
                            로그아웃
                          </a>
                        </form>
                      </c:when>
                      <c:when test="${sessionScope.user.social eq 1}">
                        <form action="/user/slogout" method="post">
                          <a  class="header-sublink" title="Logout" onclick="this.parentNode.submit(); return false;">
                            소셜 로그아웃
                          </a>
                        </form>
                      </c:when>
                    </c:choose>
                  </li>
                </ul>
              </li>
            </c:otherwise>
          </c:choose>
          <button class="btn-menu header-utils-btn" title="menu"></button>
          <button class="btn-close header-utils-btn" title="close"></button>
        </div>
      </div>

    </div>
  </div>

  <div class="header-fullmenu-photo fullmenu-top">
    <div class="fullmenu-head container-lg">
      <h4 class="fullmenu-title">
      </h4>
      <button class="fullmenu-close"></button>
    </div>
    <div class="fullmenu-wrapper container-lg">
      <ul class="fullmenu-gnblist">
        <li class="fullmenu-gnbitem fullmenu-item-active">
          <a class="fullmenu-gnblink" href="javascript:void(0)">
            <span>Work</span>
          </a>
          <ul class="fullmenu-sublist">
            <li class="fullmenu-subitem">
              <a class="fullmenu-sublink" href="/work/listWork">
                <span>작품 리스트</span>
              </a>
            </li>
            <c:if test="${!empty sessionScope.user}">
              <li class="fullmenu-subitem">
                <a class="fullmenu-sublink" href="/work/listBookmark">
                  <span>북마크</span>
                </a>
              </li>
              <li class="fullmenu-subitem">
                <a class="fullmenu-sublink" href="/work/getWork">
                  <span>작품 관리</span>
                </a>
              </li>
            </c:if>
          </ul>
        </li>
        <li class="fullmenu-gnbitem">
          <a class="fullmenu-gnblink" href="javascript:void(0)">
            <span>Story</span>
          </a>
          <ul class="fullmenu-sublist">
            <li class="fullmenu-subitem">
              <a class="fullmenu-sublink" href="/story/listStory">
                <span>스토리 리스트</span>
              </a>
            </li>
            <c:if test="${!empty sessionScope.user}">
              <li class="fullmenu-subitem">
                <a class="fullmenu-sublink" href="/story/getStory">
                  <span>마이 스토리</span>
                </a>
              </li>
            </c:if>
          </ul>
        </li>
        <c:if test="${!empty sessionScope.user}">
          <li class="fullmenu-gnbitem">
            <a class="fullmenu-gnblink" href="javascript:void(0)">
              <span>Chat</span>
            </a>
            <ul class="fullmenu-sublist">
              <li class="fullmenu-subitem">
                <a class="fullmenu-sublink" href="/chat/listChatSpace">
                  <span>채팅방 리스트</span>
                </a>
              </li>
              <li class="fullmenu-subitem">
                <a class="fullmenu-sublink" href="javascript:void(0)">
                  <span>마이 채팅방</span>
                </a>
              </li>
            </ul>
          </li>
        </c:if>
        <li class="fullmenu-gnbitem">
          <a class="fullmenu-gnblink" href="javascript:void(0)">
            <span>Shop</span>
          </a>
          <ul class="fullmenu-sublist">
            <li class="fullmenu-subitem">
              <a class="fullmenu-sublink" href="/product/listProduct">
                <span>상품조회</span>
              </a>
            </li>
            <c:if test="${!empty sessionScope.user}">
              <li class="fullmenu-subitem">
                <a class="fullmenu-sublink" href="/product/listProduct?prodCategory=2">
                  <span>저작권 등록</span>
                </a>
              </li>
              <li class="fullmenu-subitem">
                <c:if test="${sessionScope.user.role eq 1}">
                  <a class="fullmenu-sublink" href="/product/listProduct?prodCategory=0">
                    <span>팝콘 등록</span>
                  </a>
                </c:if>
              </li>
              <li class="fullmenu-subitem">
                <a class="fullmenu-sublink" href="javascript:void(0)">
                  <span>판매내역</span>
                </a>
              </li>
              <li class="fullmenu-subitem">
                <a class="fullmenu-sublink" href="javascript:void(0)">
                  <span>구매내역</span>
                </a>
              </li>
            </c:if>
          </ul>
        </li>
        <li class="fullmenu-gnbitem">
          <a class="fullmenu-gnblink" href="javascript:void(0)">
            <span>Support</span>
          </a>
          <ul class="fullmenu-sublist">
            <li class="fullmenu-subitem">
              <a class="fullmenu-sublink" href="/support/listSupport?category=0">
                <span>공지사항</span>
              </a>
            </li>
            <li class="fullmenu-subitem">
              <a class="fullmenu-sublink" href="/support/listSupport?category=1">
                <span>Q&amp;A</span>
              </a>
            </li>
            <li class="fullmenu-subitem">
              <c:if test="${sessionScope.user.role eq 0}">
                <a class="fullmenu-sublink" href="/support/report.jsp">
                  <span>신고</span>
                </a>
              </c:if>
              <c:if test="${sessionScope.user.role eq 1}">
                <a class="fullmenu-sublink" href="/support/listSupport?category=2">
                  <span>신고 관리</span>
                </a>
              </c:if>
            </li>
            <li class="fullmenu-subitem">
              <c:if test="${sessionScope.user.role eq 1}">
                <a class="fullmenu-sublink" href="/user/listUser">
                  <span>회원 리스트</span>
                </a>
              </c:if>
            </li>
          </ul>
        </li>
      </ul>
    </div>
  </div>
  <div class="header-dim"></div>
</div>