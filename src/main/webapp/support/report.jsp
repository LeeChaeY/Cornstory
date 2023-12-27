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
      <img class="contents-backimg" src="https://images.unsplash.com/photo-1624007435086-7e236df42151?crop=entropy&amp;cs=tinysrgb&amp;fit=max&amp;fm=jpg&amp;ixid=M3w0OTE2MDd8MHwxfHNlYXJjaHwxOTh8fCVFRCU5RCU5MSVFQiVCMCVCMXxrb3wwfHx8YmxhY2tfYW5kX3doaXRlfDE3MDM1ODMzNjB8MA&amp;ixlib=rb-4.0.3&amp;q=80&amp;w=1080" alt="">
      <div class="contents-body container-md">
        <h2 class="contents-title"> Support </h2>
        <h7 class="contents-sub">고객센터</h7>
      </div>
    </div>
  </div>

  <div class="hooms-N46" data-bid="gvLQlsUZ0g" id="">
    <div class="contents-inner">
      <div class="contents-container container-md">
        <div class="textset textset-h2">
          <h2 class="textset-tit">신고센터</h2>
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
        </div>
        <div class="contents-bottom">
          <ul class="contents-list">
            <li class="contents-item">
              <strong>

                저희 [콘스토리 신고센터]에 오신 것을 환영합니다.<br>

                본 안내문을 통해 저희 신고센터의 목적, 운영 절차, 그리고 신고 시 유의해야 할 사항에 대해 안내해 드리겠습니다.<br><br>

                1. 신고센터 목적<br>

                [콘스토리 신고센터]는 플랫폼 내에서 벌어지는 부적절한 행동이나 위반 사항에 대한 신고를 접수하고, 해당 문제를 조사·해결하는 데 그 목적이 있습니다.<br><br>

                2. 신고 대상<br>

                신고의 대상은 다음과 같습니다:<br>

                1. 불법 활동 : 저작권, 상표권 등 권리를 침해하는 행위<br>
                2. 욕설 및 혐오 발언 : 다른 사용자에 대한 욕설 , 모욕, 혐오 발언<br>
                3. 스팸 및 광고 활동 : 스펨 메시지 전송 또는 부적절한 광고 활동<br><br>

                3. 신고 방법<br>

                신고는 다음 방법으로 접수됩니다:<br>
                - 신고 양식 작성<br><br>

                4. 신고 접수 및 처리 절차<br>

                - 신고가 접수되면, 담당자가 신속하게 조사를 진행합니다.<br>
                - 조사 결과, 필요에 따라 적절한 조치가 취해집니다.<br>
                - 신고자에게는 처리 결과가 통보됩니다.<br><br>

                5. 유의사항<br>

                - 거짓된 신고는 엄격하게 처리됩니다.<br>
                - 타인의 개인 정보를 제공하지 마십시오.<br><br>

                감사합니다.<br></strong>
            </li>
          </ul>
          <div class="contents-btn">
            <a class="btnset" href="addSupport?category=2">신고접수</a>
          </div>
        </div>
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
