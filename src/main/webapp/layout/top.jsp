<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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

  <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
  <script>
    function redirectToIndex() {
      window.location.href = "../index.jsp";
    }
  </script>
</head>

<body>
<!-- [S]thwhole-lNlPW5z3lS -->
<header class="thwhole-lNlPW5z3lS" data-bid="lNlPW5z3lS" >

  <!--header-->
  <div class="header-container container-lg">

    <div class="header-left">
      <h1 class="header-title">
        <a href="../index.jsp">
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
            <li class="header-subitem">
              <a class="header-sublink" href="/work/bookmark">
                <span>찜 목록</span>
              </a>
            </li>
            <li class="header-subitem">
              <a class="header-sublink" href="/work/listWork">
                <span>나의 작품</span>
              </a>
            </li>
          </ul>
        </li>
        <li class="header-gnbitem">
          <a class="header-gnblink" href="javascript:void(0)">
            <span>스토리</span>
          </a>
          <ul class="header-sublist">
            <li class="header-subitem">
              <a class="header-sublink" href="javascript:void(0)">
                <span>스토리 목록</span>
              </a>
            </li>
            <li class="header-subitem">
              <a class="header-sublink" href="javascript:void(0)">
                <span>나의 스토리</span>
              </a>
            </li>
          </ul>
        </li>
        <li class="header-gnbitem">
          <a class="header-gnblink" href="/chat/listChatSpace">
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
        <li class="header-gnbitem">
          <a class="header-gnblink" href="/product/listProduct">
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
                <a class="header-sublink" href="/product/listProduct?prodCategory=2">
                  <span>저작권 등록</span>
                </a>
              </li>
            </c:if>
            <c:if test="${sessionScope.user.role eq 1}">
              <li class="header-subitem">
                <a class="header-sublink" href="/product/listProduct?prodCategory=0">
                  <span>팝콘 등록</span>
                </a>
              </li>
            </c:if>
          </ul>
        </li>



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

          </ul>
        </li>
      </ul>
    </div>
    <div class="header-right">
      <div class="header-utils">
        <button class="btn-search" >
          <img src="../ssh/icons/ico_search_white.svg" alt="검색">
        </button>
        <c:choose>
          <c:when test="${empty sessionScope.user}">
            <!-- 로그인하지 않은 상태일 때 -->
            <a href="/user/login" >
              <button class="btn-user">
                <img src="../ssh/icons/ico_user_white.svg" alt="마이페이지">
                 <img src="../ssh/images/login.png" alt="로고">
              </button>
            </a>
          </c:when>
          <c:otherwise>
            <!-- 로그인한 상태일 때 -->

            <div class="btn-user" style="display: flex; align-items: center;">
              <a href="/user/getUser?userId=${sessionScope.user.userId}" style="color: white; font-size: 15px; margin-left: 10px; display: inline-block; text-align: center;">
                <img src="../file/user/${sessionScope.user.userImage}" width="30" style="border-radius: 50%; max-width: 100%;" alt=""/>
                  ${sessionScope.user.nickName}
              </a>
              <form action="/user/logout" method="post">
                <button type="submit" style="border: none; background: none; padding: 0; cursor: pointer;">
                  <img src="../ssh/images/logout.png" alt="로고">
                </button>
              </form>
            </div>







          </c:otherwise>
        </c:choose>



        <button class="btn-allmenu">
          <img src="../ssh/icons/ico_menu3_white.svg" alt="PC메뉴">
        </button>
        <button class="btn-momenu">
          <img src="../ssh/icons/ico_menu3_white.svg" alt="모바일메뉴">
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
          <a href="javascript:void(0)">
            <h1 class="header-title">
              <form>
                <button type="button" onclick="redirectToIndex()">
                  <img src="../ssh/images/logo.png" alt="로고">
                </button>
              </form>

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
              <a class="fullmenu-sublink" href="javascript:void(0)">
                <span>작품 목록</span>
              </a>
            </li>
            <li class="fullmenu-subitem">
              <a class="fullmenu-sublink" href="javascript:void(0)">
                <span>찜 목록</span>
              </a>
            </li>
            <li class="fullmenu-subitem">
              <a class="fullmenu-sublink" href="javascript:void(0)">
                <span>나의 작품</span>
              </a>
            </li>
          </ul>
        </li>
        <li class="fullmenu-gnbitem">
          <a class="fullmenu-gnblink" href="javascript:void(0)">
            <span>스토리</span>
          </a>
          <ul class="fullmenu-sublist">
            <li class="fullmenu-subitem">
              <a class="fullmenu-sublink" href="javascript:void(0)">
                <span>스토리 목록</span>
              </a>
            </li>
            <c:if test="${sessionScope.user != null}">
            <li class="fullmenu-subitem">
              <a class="fullmenu-sublink" href="javascript:void(0)">
                <span>나의 스토리</span>
              </a>
            </li>
            </c:if>
          </ul>
        </li>
        <li class="fullmenu-gnbitem">
          <a class="fullmenu-gnblink" href="/chat/listChatSpace">
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
        <li class="fullmenu-gnbitem">
          <a class="fullmenu-gnblink" href="/product/listProduct">
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
                <a class="fullmenu-sublink" href="/product/listProduct?prodCategory=2">
                  <span>저작권 등록</span>
                </a>
              </li>
            </c:if>
            <c:if test="${sessionScope.user.role eq 1}">
              <li class="fullmenu-subitem">
                <a class="fullmenu-sublink" href="/product/listProduct?prodCategory=0">
                  <span>팝콘 등록</span>
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
              <a class="fullmenu-sublink" href="javascript:void(0)">
                <span>공지사항</span>
              </a>
            </li>
            <li class="fullmenu-subitem">
              <a class="fullmenu-sublink" href="javascript:void(0)">
                <span>Q&amp;A</span>
              </a>
            </li>
            <c:if test="${sessionScope.user.role eq 0}">
            <li class="fullmenu-subitem">
              <a class="fullmenu-sublink" href="javascript:void(0)">
                <span>신고센​터</span>
              </a>
            </li>
            </c:if>
            <c:if test="${sessionScope.user.role eq 1}">
              <li class="fullmenu-subitem">
                <a class="fullmenu-sublink" href="user/listUser">
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
  <div class="header-search fullmenu-top">
    <div class="fullmenu-wrapper">
      <div class="fullmenu-head">
        <h4 class="fullmenu-title">
          <a href="javascript:void(0)"> CornStory </a>
        </h4>
      </div>
      <div class="header-search-wrap">
        <div class="container-md">
          <div class="header-search-form">
            <div class="inputset inputset-line">
              <button class="icon-right icon-search btn" type="button" aria-label="아이콘">
              </button>
              <input type="text" class="inputset-input form-control" placeholder="검색어를 입력해주세요." aria-label="내용">
            </div>
          </div>
          <div class="recom-list">
            <h5 class="recom-tit">추천 검색어</h5>
            <ul>
              <li class="on">
                <a href="#n">작품등록</a>
              </li>
              <li>
                <a href="#n">플랫폼</a>
              </li>
            </ul>
          </div>
        </div>
      </div>
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