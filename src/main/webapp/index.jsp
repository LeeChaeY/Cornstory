<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

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
  <link rel="stylesheet" href="/ssh/css/setting.css">
  <link rel="stylesheet" href="/ssh/css/plugin.css">
  <link rel="stylesheet" href="/ssh/css/template.css">
  <link rel="stylesheet" href="/ssh/css/common.css">
  <link rel="stylesheet" href="/ssh/css/style.css">
</head>

<body>
<!--top start-->
<%@ include file="layout/top.jsp" %>
<!--top end-->

<!--center start-->
<main class="th-layout-main ">
  <div class="opilsol-N4" data-bid="muLPW5z3N1">
    <div class="visual-container">
      <div class="visual-swiper">
        <div class="swiper-wrapper">
          <!-- 여기에 반복문 추가 -->
          <script>
            var images = [
              "../ssh/images/main.jpg",
              "../ssh/images/one.jpg",
              "../ssh/images/two.jpg"
            ];

            // 이미지 슬라이드를 복사하여 끝에 추가
            var clonedImages = images.slice();
            images.push(...clonedImages);

            // 이미지 미리 로딩 함수
            function preloadImage(src) {
              var img = new Image();
              img.src = src;
            }

            for (var i = 0; i < images.length; i++) {
              // 이미지 미리 로딩
              preloadImage(images[i]);

              document.write('<div class="swiper-slide">');
              document.write('<img class="visual-bg" src="' + images[i] + '" alt="">');
              document.write('<div class="visual-text-box">');
              document.write('<h2 class="visual-title" data-swiper-parallax="-700">');
              document.write('<span class="br">꿈과 창작을 펼치는</span>플렛폼 <br>');
              document.write('<span class="br">고객 만족도 향상을 위한</span> 솔루션 제공');
              document.write('</h2>');
              document.write('<div class="visual-subtitle" data-swiper-parallax="-1000">');
              document.write('<span class="br">다양한 스타일의 창작물들이 모여, 당신만의 독특한 이야기를 창조할 수 있는 기회를 제공합니다. </span>');
              document.write('</div>');
              document.write('</div>');
              document.write('</div>');
            }
          </script>
          <!-- 반복문 끝 -->
        </div>
      </div>
    </div>
  </div>


  <!-- [E]opilsol-N4 -->
  <!-- [S]opilsol-N29 -->
  <div class="opilsol-N29" data-bid="FBLpwD88jR" >
  </div>
  <!-- [E]opilsol-N29 -->
  <!-- [S]opilsol-N5 -->
  <div class="opilsol-N5" data-bid="KElPW5Z3Nk" >
    <div class="content-container">
      <div class="container-md">
        <div class="textset">
          <h2 class="textset-tit">작품 목록</h2>
          <p class="textset-desc h5">단순한 글쓰기를 넘어, 독자들의 마음을 사로잡기 위해 최상의 플랫폼을 제공합니다. 색다른 장르와 다양한 스타일의 창작물들이 모여, 당신만의 독특한 이야기를 창조할 수 있는 기회를 제공합니다. 독자들과의 소통을 강화하며, 창작자와 독자 모두에게 풍부한 경험을 선사합니다.</p>
        </div>
      </div>
      <div class="container-md">
        <div class="slide-container">
          <div class="swiper-wrapper">
            <div class="swiper-slide">
              <a class="cardset cardset-border" href="javascript:void(0);">
                <figure class="cardset-figure">
                  <img class="cardset-img" src="https://images.pexels.com/photos/5474287/pexels-photo-5474287.jpeg" alt="">
                </figure>
                <div class="cardset-body">
                  <h5 class="cardset-tit">웹소설 제목</h5>
                  <p class="cardset-desc">소설 설명</p>
                  <span class="btnset btnset-text btnset-icon icon-right btnset-sm">자세히 보기</span>
                </div>
              </a>
            </div>
            <div class="swiper-slide">
              <a class="cardset cardset-border" href="javascript:void(0);">
                <figure class="cardset-figure">
                  <img class="cardset-img" src="../ssh/images/onemain.jpg" alt="이미지">
                </figure>
                <div class="cardset-body">
                  <h5 class="cardset-tit">웹툰 제목</h5>
                  <p class="cardset-desc">웹툰 설명</p>
                  <span class="btnset btnset-text btnset-icon icon-right btnset-sm">자세히 보기</span>
                </div>
              </a>
            </div>
            <div class="swiper-slide">
              <a class="cardset cardset-border" href="javascript:void(0);">
                <figure class="cardset-figure">
                  <img class="cardset-img" src="../ssh/images/m-sec1-img-3.jpg" alt="이미지">
                </figure>
                <div class="cardset-body">
                  <h5 class="cardset-tit">웹드라마 제목</h5>
                  <p class="cardset-desc">웹드라마 설명</p>
                  <span class="btnset btnset-text btnset-icon icon-right btnset-sm">자세히 보기</span>
                </div>
              </a>
            </div>
            <div class="swiper-slide">
              <a class="cardset cardset-border" href="javascript:void(0);">
                <figure class="cardset-figure">
                  <img class="cardset-img" src="../ssh/images/m-sec1-img-4.jpg" alt="이미지">
                </figure>
                <div class="cardset-body">
                  <h5 class="cardset-tit">웹소설 제목</h5>
                  <p class="cardset-desc">소설 설명</p>
                  <span class="btnset btnset-text btnset-icon icon-right btnset-sm">자세히 보기</span>
                </div>
              </a>
            </div>
            <div class="swiper-slide">
              <a class="cardset cardset-border" href="javascript:void(0);">
                <figure class="cardset-figure">
                  <img class="cardset-img" src="../ssh/images/m-sec1-img-1.jpg" alt="이미지">
                </figure>
                <div class="cardset-body">
                  <h5 class="cardset-tit">웹소설 제목</h5>
                  <p class="cardset-desc">소설 설명</p>
                  <span class="btnset btnset-text btnset-icon icon-right btnset-sm">자세히 보기</span>
                </div>
              </a>
            </div>
            <div class="swiper-slide">
              <a class="cardset cardset-border" href="javascript:void(0);">
                <figure class="cardset-figure">
                  <img class="cardset-img" src="../ssh/images/m-sec1-img-2.jpg" alt="이미지">
                </figure>
                <div class="cardset-body">
                  <h5 class="cardset-tit">웹소설 제목</h5>
                  <p class="cardset-desc">소설 설명</p>
                  <span class="btnset btnset-text btnset-icon icon-right btnset-sm">자세히 보기</span>
                </div>
              </a>
            </div>
            <div class="swiper-slide">
              <a class="cardset cardset-border" href="javascript:void(0);">
                <figure class="cardset-figure">
                  <img class="cardset-img" src="../ssh/images/m-sec1-img-3.jpg" alt="이미지">
                </figure>
                <div class="cardset-body">
                  <h5 class="cardset-tit">웹소설 제목</h5>
                  <p class="cardset-desc">소설 설명</p>
                  <span class="btnset btnset-text btnset-icon icon-right btnset-sm">자세히 보기</span>
                </div>
              </a>
            </div>
            <div class="swiper-slide">
              <a class="cardset cardset-border" href="javascript:void(0);">
                <figure class="cardset-figure">
                  <img class="cardset-img" src="../ssh/images/m-sec1-img-4.jpg" alt="이미지">
                </figure>
                <div class="cardset-body">
                  <h5 class="cardset-tit">웹소설 제목</h5>
                  <p class="cardset-desc">소설 설명</p>
                  <span class="btnset btnset-text btnset-icon icon-right btnset-sm">자세히 보기</span>
                </div>
              </a>
            </div>
          </div>
        </div>
        <div class="swiper-control">
          <div class="swiper-button-prev"></div>
          <div class="swiper-button-next"></div>
        </div>
      </div>
    </div>
  </div>
  <!-- [E]opilsol-N5 -->
</main>
<!-- [S]thwhole-wfLpW5Z3pJ -->
<%@ include file="layout/bottom.jsp" %>
<!-- [E]thwhole-wfLpW5Z3pJ -->
<script src="../ssh/js/setting.js"></script>
<script src="../ssh/js/plugin.js"></script>
<script src="../ssh/js/template.js"></script>
<script src="../ssh/js/common.js"></script>
<script src="../ssh/js/script.js"></script>
</body>