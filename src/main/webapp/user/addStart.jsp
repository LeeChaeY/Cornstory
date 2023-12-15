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
  <title>회원 가입</title>
  <link rel="stylesheet" href="../ssh/css/setting.css">
  <link rel="stylesheet" href="../ssh/css/plugin.css">
  <link rel="stylesheet" href="../ssh/css/template.css">
  <link rel="stylesheet" href="../ssh/css/common.css">
  <link rel="stylesheet" href="../ssh/css/style.css">

</head>

<body>
<!-- [S]opilsol-N2 -->
<%@ include file="../layout/top.jsp" %>
<!-- [E]opilsol-N2 -->
<main class="th-layout-main ">
  <!-- [S]opilsol-N30 -->
  <div class="opilsol-N30" data-bid="vzLpwCWK7e">
    <div class="content-container">
      <div class="textset content-top">
        <div class="container-md">
          <h2 class="textset-tit">회원가입</h2>
          <ul class="step-list">
            <li class="active">약관동의</li>
            <li>정보입력</li>
            <li>가입완료</li>
          </ul>
        </div>
      </div>
      <div class="contents-form">
        <div class="container-md">
          <div class="contents-form-top">
            <h3 class="inputset-tit">약관동의</h3>
            <div class="checkset">
              <input id="checkset-a-1" class="checkset-input input-round" type="checkbox" value="">
              <label class="checkset-label" for="checkset-a-1"></label>
              <span class="checkset-text">모두 동의합니다</span>
            </div>
          </div>
          <div class="accordset">
            <div class="accordset-item">
              <div class="accordset-header">
                <div class="checkset">
                  <input id="checkset-b-2-1" class="checkset-input input-round required-checkbox" type="checkbox" value="">
                  <label class="checkset-label" for="checkset-b-2-1"></label>
                  <span class="checkset-text">[필수] 이용약관에 동의합니다</span>
                </div>
                <button class="accordset-button btn" type="button" onclick="toggleAccordion(this)"> 보기 </button>
              </div>
              <div class="accordset-body">
                <div class="accordset-content"> 템플릿 하우스는 ​별도의 설치 없이 ​어디서든 가장 쉽고 빠르게 HTML 코딩이 가능합니다. <br>HTML, CSS, JavaScript 기반으로 제공되는 블록과 ​다양한 테마를 활용하여 사용자가 직접 블록을 <br> 드래그, 편집, 드래그하여 멋진 웹 사이트를 가장 쉽고, 빠르게 만들 수 있습니다. </div>
              </div>
            </div>
            <div class="accordset-item">
              <div class="accordset-header">
                <div class="checkset">
                  <input id="checkset-b-2-2" class="checkset-input input-round required-checkbox" type="checkbox" value="">
                  <label class="checkset-label" for="checkset-b-2-2"></label>
                  <span class="checkset-text">[필수] 개인정보 취급방침에 동의합니다</span>
                </div>
                <button class="accordset-button btn" type="button" onclick="toggleAccordion(this)"> 보기 </button>
              </div>
              <div class="accordset-body">
                <div class="accordset-content"> 템플릿 하우스는 ​별도의 설치 없이 ​어디서든 가장 쉽고 빠르게 HTML 코딩이 가능합니다. <br>HTML, CSS, JavaScript 기반으로 제공되는 블록과 ​다양한 테마를 활용하여 사용자가 직접 블록을 <br> 드래그, 편집, 드래그하여 멋진 웹 사이트를 가장 쉽고, 빠르게 만들 수 있습니다. </div>
              </div>
            </div>
            <div class="accordset-item">
              <div class="accordset-header">
                <div class="checkset">
                  <input id="checkset-b-2-3" class="checkset-input input-round required-checkbox" type="checkbox" value="">
                  <label class="checkset-label" for="checkset-b-2-3"></label>
                  <span class="checkset-text">[필수] 개인정보 제3자 제공에 동의합니다</span>
                </div>
                <button class="accordset-button btn" type="button" onclick="toggleAccordion(this)"> 보기 </button>
              </div>
              <div class="accordset-body">
                <div class="accordset-content"> 템플릿 하우스는 ​별도의 설치 없이 ​어디서든 가장 쉽고 빠르게 HTML 코딩이 가능합니다. <br>HTML, CSS, JavaScript 기반으로 제공되는 블록과 ​다양한 테마를 활용하여 사용자가 직접 블록을 <br> 드래그, 편집, 드래그하여 멋진 웹 사이트를 가장 쉽고, 빠르게 만들 수 있습니다. </div>
              </div>
            </div>
            <div class="accordset-item">
              <div class="accordset-header">
                <div class="checkset">
                  <input id="checkset-b-2-4" class="checkset-input input-round" type="checkbox" value="">
                  <label class="checkset-label" for="checkset-b-2-4"></label>
                  <span class="checkset-text">[선택] 광고성 정보 수신에 동의합니다</span>
                </div>
                <button class="accordset-button btn" type="button" onclick="toggleAccordion(this)"> 보기 </button>
              </div>
              <div class="accordset-body">
                <div class="accordset-content"> 템플릿 하우스는 ​별도의 설치 없이 ​어디서든 가장 쉽고 빠르게 HTML 코딩이 가능합니다. <br>HTML, CSS, JavaScript 기반으로 제공되는 블록과 ​다양한 테마를 활용하여 사용자가 직접 블록을 <br> 드래그, 편집, 드래그하여 멋진 웹 사이트를 가장 쉽고, 빠르게 만들 수 있습니다. </div>
              </div>
            </div>
          </div>
          <div class="bottom-btn">
            <a class="btnset btnset-lg btnset-rect" href="javascript:void(0);" onclick="proceedToNextPage()">일반 회원가입</a>
          </div>
        </div>
      </div>
    </div>
  </div>
  <!-- [E]opilsol-N30 -->
</main>

<!-- [E]thwhole-wfLpW5Z3pJ -->
<script src="../ssh/js/setting.js"></script>
<script src="../ssh/js/plugin.js"></script>
<script src="../ssh/js/template.js"></script>
<script src="../ssh/js/common.js"></script>
<script src="../ssh/js/script.js"></script>

<%@ include file="../layout/bottom.jsp" %>

<script>
  document.addEventListener("DOMContentLoaded", function () {
    // 필수 항목 체크 및 이벤트 리스너 등록
    var requiredCheckboxes = document.querySelectorAll('.checkset-input[checked]');
    requiredCheckboxes.forEach(function (checkbox) {
      checkbox.addEventListener('change', function () {
        if (checkbox.checked) {
          // 필수 항목이 체크되면 다른 필수 항목도 자동으로 체크
          var allRequiredCheckboxes = document.querySelectorAll('.checkset-input[checked]');
          allRequiredCheckboxes.forEach(function (requiredCheckbox) {
            requiredCheckbox.checked = true;
          });
        }
      });
    });

    // 모두 동의 체크 및 이벤트 리스너 등록
    var allAgreeCheckbox = document.getElementById('checkset-a-1');
    allAgreeCheckbox.addEventListener('change', function () {
      var allCheckboxes = document.querySelectorAll('.checkset-input');
      allCheckboxes.forEach(function (checkbox) {
        checkbox.checked = allAgreeCheckbox.checked;
      });
    });
  });
  // 필수 항목 체크 여부 확인
  function proceedToNextPage() {
    const requiredCheckboxes = document.querySelectorAll(".required-checkbox");
    let allChecked = true;

    requiredCheckboxes.forEach((checkbox) => {
      if (!checkbox.checked) {
        allChecked = false;
      }
    });

    if (allChecked) {
      // 필수 항목 모두 체크되었을 때 다음 페이지로 이동
      window.location.href = "addUser";
    } else {
      alert("필수 항목에 모두 동의해야 합니다.");
    }
  }

  // 아코디언 토글
  function toggleAccordion(button) {
    const accordsetContent = button.parentElement.nextElementSibling;
    accordsetContent.classList.toggle("show");
  }
</script>
</body>
</html>


