<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
  <title>cornstory</title>
  <link rel="stylesheet" href="../ssh/css/setting.css">
  <link rel="stylesheet" href="../ssh/css/plugin.css">
  <link rel="stylesheet" href="../ssh/css/template.css">
  <link rel="stylesheet" href="../ssh/css/common.css">
  <link rel="stylesheet" href="../ssh/css/style.css">

  <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
  <script src="http://localhost:3000/socket.io/socket.io.js"></script>
  <script>

    function redirectToIndex() {
      window.location.href = "/";
    }

    $(function () {
      if ("${sessionScope.user}" !== "") {
        const socket = io.connect('http://localhost:3000');
        socket.emit("connection", {userId: "${sessionScope.user.userId}"});

        socket.on("message", async (data) => {
          console.log(data);
        });
      }


      $("span:contains('나의 채팅방')").on("click", function () {
        $("input[name='userStatus']").val(1);
        $("form[name='form']").attr("method", "post").attr("action", "/chat/listChatSpace").submit();
      });
      $("span:contains('구매 내역')").on("click", function () {
        $("input[name='userStatus']").val(1);
        $("form[name='form']").attr("method", "post").attr("action", "/purchase/listPurchase").submit();
      });
      $("span:contains('판매 내역')").on("click", function () {
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

<!-- [S]thwhole-lNlPW5z3lS -->
<header class="thwhole-lNlPW5z3lS" data-bid="lNlPW5z3lS">

  <!--header-->
  <div class="header-container container-lg">

    <div class="header-left">
      <h1 class="header-title">
        <a href="/">
          <img src="../ssh/images/logo.png" alt="로고">
        </a>
      </h1>
    </div>
    <div class="header-center">
      <ul class="header-gnblist">
        <li class="header-gnbitem">
          <a class="header-gnblink" href="javascript:void(0)">
            <span>작품</span>
          </a>
          <ul class="header-sublist">
            <li class="header-subitem">
              <a class="header-sublink" href="/work/listWork">
                <span>작품 목록</span>
              </a>
            </li>
            <c:if test="${!empty sessionScope.user}">
              <li class="header-subitem">
                <a class="header-sublink" href="/work/listBookmark">
                  <span>찜 목록</span>
                </a>
              </li>
              <li class="header-subitem">
                <a class="header-sublink" href="/work/getWork">
                  <span>나의 작품</span>
                </a>
              </li>
            </c:if>
          </ul>
        </li>
        <li class="header-gnbitem">
          <a class="header-gnblink" href="javascript:void(0)">
            <span>스토리</span>
          </a>
          <ul class="header-sublist">
            <li class="header-subitem">
              <a class="header-sublink" href="/story/listStory">
                <span>스토리 목록</span>
              </a>
            </li>
            <c:if test="${!empty sessionScope.user}">
              <li class="header-subitem">
                <a class="header-sublink" href="/story/getStory">
                  <span>나의 스토리</span>
                </a>
              </li>
            </c:if>
          </ul>
        </li>

        <c:if test="${!empty sessionScope.user}">
          <li class="header-gnbitem">
            <a class="header-gnblink" href="javascript:void(0)">
              <span>채팅</span>
            </a>
            <ul class="header-sublist">
              <li class="header-subitem">
                <a class="header-sublink" href="/chat/listChatSpace">
                  <span>채팅방 목록</span>
                </a>
              </li>
              <li class="header-subitem">
                <a class="header-sublink" href="javascript:void(0)">
                  <span>나의 채팅방</span>
                </a>
              </li>
            </ul>
          </li>
        </c:if>

        <li class="header-gnbitem">
          <a class="header-gnblink" href="javascript:void(0)">
            <span>스토어</span>
          </a>
          <ul class="header-sublist">
            <li class="header-subitem">
              <a class="header-sublink" href="/product/listProduct">
                <span>상품 조회</span>
              </a>
            </li>
            <c:if test="${sessionScope.user.role eq 0}">
              <li class="header-subitem">
                <a class="header-sublink" href="/product/addProduct?prodCategory=2">
                  <span>저작권 등록</span>
                </a>
              </li>
            </c:if>
            <c:if test="${sessionScope.user.role eq 1}">
              <li class="header-subitem">
                <a class="header-sublink" href="/product/addProduct?prodCategory=0">
                  <span>팝콘 등록</span>
                </a>
              </li>
            </c:if>
            <c:if test="${!empty sessionScope.user}">
              <li class="header-subitem">
                <a class="header-sublink" href="javascript:void(0)">
                  <span>구매 내역</span>
                </a>
              </li>
              <li class="header-subitem">
                <a class="header-sublink" href="javascript:void(0)">
                  <span>판매 내역</span>
                </a>
              </li>
            </c:if>
          </ul>
        <li class="header-gnbitem">
          <a class="header-gnblink" href="javascript:void(0)">
            <span>고객센터</span>
          </a>
          <ul class="header-sublist">

            <li class="header-subitem">
              <a class="header-sublink" href="/support/listSupport?category=0">
                <span>공지사항</span>
              </a>
            </li>
            <li class="header-subitem">
              <a class="header-sublink" href="/support/listSupport?category=1">
                <span>Q&amp;A​<br></span>
              </a>
            </li>

            <c:if test="${sessionScope.user.role eq 0}">
              <li class="header-subitem">
                <a class="header-sublink" href="/support/report.jsp">
                  <span>신고센터<br></span>
                </a>
              </li>
            </c:if>
            <c:if test="${sessionScope.user.role eq 1}">
              <li class="header-subitem">
                <a class="header-sublink" href="/support/listSupport?category=2">
                  <span>신고센터<br></span>
                </a>
              </li>

              <li class="header-subitem">
                <a class="header-sublink" href="/user/listUser">
                  <span>회원목록<br></span>
                </a>
              </li>
            </c:if>
          </ul>
        </li>
      </ul>
    </div>


    <div class="header-right">
      <div class="header-utils">

        <c:choose>
          <c:when test="${empty sessionScope.user}">
            <!-- 로그인하지 않은 상태일 때 -->
            <a href="/user/login">
              <button class="btn-user">
                <img src="../ssh/icons/ico_user_white.svg" alt="마이페이지">
                <img src="../ssh/images/login.png" alt="로고">
              </button>
            </a>
          </c:when>
          <c:otherwise>
            <!-- 로그인한 상태일 때 -->
            <div class="btn-user">
              <img src="../file/user/${sessionScope.user.userImage}" width="25"
                   style="border-radius: 50%; max-width: 100%;" alt=""/>
              <a href="/user/getUser?userId=${sessionScope.user.userId}"
                 style="margin-top: 3px; color: white; font-size: 13px;  text-align: center; text-decoration: none;">
                  ${sessionScope.user.nickName}
              </a>
              <!-- 보유한 팝콘수 출력 -->

            </div>
            <span class="popcornCnt" style="margin-left: 5px; font-size: 10px; color: white; margin-top: 5px;">
                            <a href="javascript:void(0)"
                               style="margin-left: 5px; font-size: 10px; color: white; margin-top: 5px; text-decoration: none;">
                                | 보유한 팝콘수: <fmt:formatNumber value="${sessionScope.user.popcornCnt}" pattern="#,##0"/>개
                            </a>

                        </span>
            <form action="/user/logout" method="post">
              <button type="submit"
                      style="border: none; background: none; padding: 0; cursor: pointer; display: inline-block;">
                <img src="../ssh/images/logout.png" alt="로고">
              </button>
            </form>
          </c:otherwise>
        </c:choose>


        <button class="btn-allmenu">
          <img src="../ssh/icons/ico_menu3_white.svg" alt="PC메뉴">
        </button>

        <button class="btn-moclose">
          <img src="../ssh/icons/ico_close_black.svg" alt="닫기">
        </button>
      </div>
    </div>
  </div>
  <!--header-->

  <div class="header-fullmenu fullmenu-top">
    <div class="fullmenu-wrapper">
      <div class="fullmenu-head">
        <h4 class="fullmenu-title">
          <a href="/index.jsp">
            <h1 class="header-title">
              <img src="../ssh/images/logo.png" alt="로고">
            </h1>
          </a>
        </h4>

      </div>
      <ul class="fullmenu-gnblist">
        <li class="fullmenu-gnbitem">
          <a class="fullmenu-gnblink" href="javascript:void(0)">
            <span>작품</span>
          </a>
          <ul class="fullmenu-sublist">
            <li class="fullmenu-subitem">
              <a class="fullmenu-sublink" href="/work/listWork">
                <span>작품 목록</span>
              </a>
            </li>
            <c:if test="${!empty sessionScope.user}">
              <li class="fullmenu-subitem">
                <a class="fullmenu-sublink" href="/work/listBookmark">
                  <span>찜 목록</span>
                </a>
              </li>
              <li class="fullmenu-subitem">
                <a class="fullmenu-sublink" href="/work/getWork">
                  <span>나의 작품</span>
                </a>
              </li>
            </c:if>
          </ul>
        </li>
        <li class="fullmenu-gnbitem">
          <a class="fullmenu-gnblink" href="javascript:void(0)">
            <span>스토리</span>
          </a>
          <ul class="fullmenu-sublist">
            <li class="fullmenu-subitem">
              <a class="fullmenu-sublink" href="/story/listStory">
                <span>스토리 목록</span>
              </a>
            </li>
            <c:if test="${!empty sessionScope.user}">
              <li class="fullmenu-subitem">
                <a class="fullmenu-sublink" href="/story/getStory">
                  <span>나의 스토리</span>
                </a>
              </li>
            </c:if>
          </ul>
        </li>
        <c:if test="${!empty sessionScope.user}">
          <li class="fullmenu-gnbitem">
            <a class="fullmenu-gnblink" href="javascript:void(0)">
              <span>채팅</span>
            </a>
            <ul class="fullmenu-sublist">
              <li class="fullmenu-subitem">
                <a class="fullmenu-sublink" href="/chat/listChatSpace">
                  <span>채팅방 목록</span>
                </a>
              </li>
              <li class="fullmenu-subitem">
                <a class="fullmenu-sublink" href="javascript:void(0)">
                  <span>나의 채팅방</span>
                </a>
              </li>
            </ul>
          </li>
        </c:if>
        <li class="fullmenu-gnbitem">
          <a class="fullmenu-gnblink" href="javascript:void(0)">
            <span>스토어</span>
          </a>
          <ul class="fullmenu-sublist">
            <li class="fullmenu-subitem">
              <a class="fullmenu-sublink" href="/product/listProduct">
                <span>상품 조회</span>
              </a>
            </li>
            <c:if test="${sessionScope.user.role eq 0}">
              <li class="fullmenu-subitem">
                <a class="fullmenu-sublink" href="/product/addProduct?prodCategory=2">
                  <span>저작권 등록</span>
                </a>
              </li>
            </c:if>
            <c:if test="${sessionScope.user.role eq 1}">
              <li class="fullmenu-subitem">
                <a class="fullmenu-sublink" href="/product/addProduct?prodCategory=0">
                  <span>팝콘 등록</span>
                </a>
              </li>
            </c:if>
            <c:if test="${!empty sessionScope.user}">
              <li class="fullmenu-subitem">
                <a class="fullmenu-sublink" href="javascript:void(0)">
                  <span>구매 내역</span>
                </a>
              </li>
              <li class="fullmenu-subitem">
                <a class="fullmenu-sublink" href="javascript:void(0)">
                  <span>판매 내역</span>
                </a>
              </li>
            </c:if>
          </ul>
        </li>
        <li class="fullmenu-gnbitem">
          <a class="fullmenu-gnblink" href="javascript:void(0)">
            <span>고객센터</span>
          </a>
          <ul class="fullmenu-sublist">
            <li class="fullmenu-subitem">
              <a class="fullmenu-sublink" href="/support/listSupport?category=0">
                <span>공지사항</span>
              </a>
            </li>
            <li class="fullmenu-subitem">
              <a class="fullmenu-sublink" href="/support/listSupport?category=1">
                <span>Q&amp;A​<br></span>
              </a>
            </li>
            <c:if test="${sessionScope.user.role eq 0}">
              <li class="fullmenu-subitem">
                <a class="fullmenu-sublink" href="/support/report.jsp">
                  <span>신고센터<br></span>
                </a>
              </li>
            </c:if>
            <c:if test="${sessionScope.user.role eq 1}">
              <li class="fullmenu-subitem">
                <a class="fullmenu-sublink" href="/support/listSupport?category=2">
                  <span>신고센터<br></span>
                </a>
              </li>
              <li class="fullmenu-subitem">
                <a class="fullmenu-sublink" href="/user/listUser">
                  <span>회원목록 조회</span>
                </a>
              </li>
            </c:if>
          </ul>
        </li>
      </ul>
    </div>
    <button class="fullmenu-close">
      <img src="../ssh/icons/ico_close_black.svg" alt="닫기">
    </button>
  </div>
</header>

<script src="../ssh/js/setting.js"></script>
<script src="../ssh/js/plugin.js"></script>
<script src="../ssh/js/template.js"></script>
<script src="../ssh/js/common.js"></script>
<script src="../ssh/js/script.js"></script>
</body>
</html>
