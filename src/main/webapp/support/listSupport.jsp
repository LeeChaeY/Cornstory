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
  <title>Contact_ContactUs_자주묻는질문 | main_복제본_복제본</title>
  <link rel="stylesheet" href="../support/css/setting.css">
  <link rel="stylesheet" href="../support/css/plugin.css">
  <link rel="stylesheet" href="../support/css/template.css">
  <link rel="stylesheet" href="../support/css/common.css">
  <link rel="stylesheet" href="../support/css/style.css">
  <link rel="stylesheet" href="../user/css/setting.css">
  <link rel="stylesheet" href="../user/css/plugin.css">
  <link rel="stylesheet" href="../user/css/template.css">
  <link rel="stylesheet" href="../user/css/common.css">
  <link rel="stylesheet" href="../user/css/style.css">

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
  <div class="thpart-HmlqLtFlNZ" data-bid="HmlqLtFlNZ" id="">
    <div class="contents-container">
      <img class="contents-backimg" src="https://images.unsplash.com/photo-1624007435086-7e236df42151?crop=entropy&amp;cs=tinysrgb&amp;fit=max&amp;fm=jpg&amp;ixid=M3w0OTE2MDd8MHwxfHNlYXJjaHwxOTh8fCVFRCU5RCU5MSVFQiVCMCVCMXxrb3wwfHx8YmxhY2tfYW5kX3doaXRlfDE3MDM1ODMzNjB8MA&amp;ixlib=rb-4.0.3&amp;q=80&amp;w=1080" alt="">
      <div class="contents-body container-md">
        <h2 class="contents-title"> Support </h2>
        <h7 class="contents-sub">고객센터</h7>
      </div>
    </div>
  </div>
  <!-- [S]hooms-N36 -->
  <div class="hooms-N36" data-bid="iSLqLSg68L" id="">
    <div class="contents-inner">
      <div class="contents-container container-md">
        <div class="textset textset-h2">
          <c:choose>
            <c:when test="${param.category eq '0'}">
              <input type="text" id="supCategory" name="supCategory" value="0" style="display: none;">
              <h2 class="textset-tit">공지사항</h2><br>
            </c:when>
            <c:when test="${param.category eq '1'}">
              <input type="text" id="supCategory" name="supCategory" value="1" style="display: none;">
              <h2 class="textset-tit">Q&A</h2><br>
            </c:when>
            <c:when test="${param.category eq '2'}">
              <input type="text" id="supCategory" name="supCategory" value="2" style="display: none;">
              <h2 class="textset-tit">신고센터</h2>
            </c:when>
          </c:choose>
        </div>

        <div class="contents-search">

          <c:choose>
            <c:when test="${param.category eq '0'}">
              <c:choose>
                <c:when test="${sessionScope.user != null and sessionScope.user.role eq 1}">
                  <p class="contents-result">
                    <a href="addSupport?category=0">
                      <img class="icon-sm" src="../common/icons/ico_plus_circle.svg" alt="아이콘">작성하기
                    </a>
                  </p>
                </c:when>
              </c:choose>
            </c:when>
            <c:when test="${param.category eq '1'}">
              <c:choose>
                <c:when test="${sessionScope.user != null and sessionScope.user.role eq 0}">
                  <p class="contents-result">
                    <a href="addSupport?category=1">
                      <img class="icon-sm" src="../common/icons/ico_plus_circle.svg" alt="아이콘">질문하기
                    </a>
                  </p>
                </c:when>
              </c:choose>
            </c:when>
          </c:choose>

        </div>



        <div class="tableset">
          <table class="tableset-table table">
            <colgroup>
              <col>
              <col>
              <col>
              <col>
              <col>
              <col>
              <col>
            </colgroup>
            <thead class="thead-light thead-border-top">
            <tr>

              <c:if test="${param.category eq '0'}">
                <th class="number" scope="col">NO</th>
                <th scope="col">내용</th>
                <th class="last-child" scope="col">등록일</th>

              </c:if>
              <c:if test="${param.category eq '1'}">

              </c:if>

              <c:if test="${param.category eq '2'}">
                <th class="number" scope="col">NO</th>
                <th scope="col">신고자</th>
                <th scope="col">피신고자</th>
                <th scope="col">신고 내용</th>
                <th scope="col">신고 URL</th>
                <th scope="col">추가자료</th>
                <th scope="col">조치</th>
                <th class="last-child" scope="col">등록일</th>
              </c:if>


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


                      <div class="contents-container container-md">
                        <div class="accordset accordset-arrow accent-body">
                          <div class="accordset-item">
                            <div class="accordset-header">
                              <button class="accordset-button btn" type="button">
                                <span class="accordset-q">Q</span> ${support.supContent} </button>
                              <c:choose>
                                <c:when test="${empty support.supPluscon}">
                                  <div class="badgeset">대기</div>
                                  <div class="accordset-body">
                                    <div class="accordset-content">
                                        <c:if test="${support.supCategory eq '1' and sessionScope.user.role eq 0}">
                                              <span class="accordset-a">A</span>등록된 답변이 없습니다.
                                        </c:if>
                                        <c:if test="${support.supCategory eq '1' and sessionScope.user.role eq 1}">
                                              <textarea class="inputset-textarea"  name="supContent" placeholder="공지 내용을 입력해주세요." required=""></textarea>
                                        </c:if>
                                    </div>
                                  </div>
                                </c:when>
                                <c:otherwise>
                                  <div class="badgeset badgeset-active">답변완료</div>
                                  <div class="accordset-body">
                                    <div class="accordset-content">
                                      <span class="accordset-a">A</span>${support.supPluscon}
                                    </div>
                                  </div>
                                </c:otherwise>
                              </c:choose>
                            </div>

                          </div>
                        </div>
                      </div>
                </c:when>

                <c:when test="${param.category eq '2' and support.supCategory eq '2'}">
                  <c:set var="i" value="${i + 1}"/>
                  <tr class="ct_list_pop">
                    <td class="number">${i}</td>
                    <td>${support.userId}</td>
                    <td>${support.supId}</td>
                    <td><a href="getSupport?supNo=${support.supNo}"> ${support.supContent}</a></td>
                      <c:choose>
                        <c:when test="${empty support.supPluscon}">
                          <td> 미등록</td>
                        </c:when>
                        <c:otherwise>
                          <td><a href="${support.supPluscon}">URL</a></td>
                        </c:otherwise>
                      </c:choose>
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
</main>
</body>
<script src="../user/js/setting.js"></script>
<script src="../user/js/plugin.js"></script>
<script src="../user/js/template.js"></script>
<script src="../user/js/common.js"></script>
<script src="../user/js/script.js"></script>
<script src="../support/js/setting.js"></script>
<script src="../support/js/plugin.js"></script>
<script src="../support/js/template.js"></script>
<script src="../support/js/common.js"></script>
<script src="../support/js/script.js"></script>

<%@ include file="../layout/bottom.jsp" %>



</html>
