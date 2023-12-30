<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html>
<head>
    <title>cornstory</title>
    <link rel="stylesheet" href="../common/css/setting.css">
    <link rel="stylesheet" href="../common/css/plugin.css">
    <link rel="stylesheet" href="../common/css/template.css">
    <link rel="stylesheet" href="../common/css/common.css">
    <link rel="stylesheet" href="../common/css/style.css">
    <link rel="stylesheet" href="../common/css/drag.css">
    <link rel="stylesheet" href="../support/css/setting.css">
    <link rel="stylesheet" href="../support/css/plugin.css">
    <link rel="stylesheet" href="../support/css/template.css">
    <link rel="stylesheet" href="../support/css/common.css">
    <link rel="stylesheet" href="../support/css/style.css">
    <link rel="stylesheet" href="../khs/css/style.css">
    <link rel="stylesheet" href="../khs/css/common.css">
    <meta charset="utf-8">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <style>
            /* 모달 스타일 */
            .modal {
                display: none; /* 초기에는 모달 창을 숨깁니다. */
                position: fixed;
                z-index: 1;
                left: 0;
                top: 0;
                width: 100%;
                height: 100%;
                overflow: auto;
                background-color: rgba(0, 0, 0, 0.4);
            }

            .modal-content {
                background-color: #fefefe;
                margin: 15% auto;
                padding: 20px;
                border: 1px solid #888;
                width: 300px;
                text-align: center;
            }

            /* 버튼 스타일 */
            #confirmBtn, #cancelBtn {
                margin-top: 10px;
                padding: 8px 15px;
                background-color: #0056b3;
                color: #fff;
                border: none;
                border-radius: 4px;
                cursor: pointer;
            }

            #confirmBtn:hover, #cancelBtn:hover {
                background-color: #004494;
            }
        </style>
</head>
<%@ include file="../layout/top.jsp" %>
<body>

<main class="th-layout-main">
    <div class="thpart-HmlqLtFlNZ" data-bid="HmlqLtFlNZ">
        <div class="contents-container">
            <img class="contents-backimg" src="../khs/images/work.jpg" alt="">
            <div class="contents-body container-md">
                <h2 class="contents-title"> Work </h2>
                <h7 class="contents-sub">작품</h7>
            </div>
        </div>
    </div>

    <!-- [S]hooms-N40 -->
    <div class="hooms-N40" data-bid="faLQKnzUHs">
        <div class="contents-inner">
            <div class="contents-container container-md">
                <div class="contents-left">
                    <div class="contents-thumbnail">
                        <img src="${work.thumbnail}" alt="${work.workName}">
                    </div>
                </div>
                <div class="contents-right">
                    <div class="textset textset-h2">
                        <span class="textset-name">
                        <c:choose>
                            <c:when test="${work.category eq '0'}">웹소설</c:when>
                            <c:when test="${work.category eq '1'}">웹툰</c:when>
                            <c:when test="${work.category eq '2'}">웹드라마</c:when>
                        </c:choose>
                        </span>
                        <h2 class="textset-tit"> ${work.workName}</h2>
                    </div>
                    <p class="contents-desc"> ${work.workDesc} </p>
<%--                    <div class="selectset selectset-lg">--%>
<%--                        <button class="selectset-toggle btn" type="button">--%>
<%--                            <span>[필수] 사이즈를 선택해주세요.</span>--%>
<%--                        </button>--%>
<%--                        <ul class="selectset-list">--%>
<%--                            <li class="selectset-item">--%>
<%--                                <button class="selectset-link btn" type="button" data-value="슈퍼싱글">--%>
<%--                                    <span>슈퍼싱글</span>--%>
<%--                                </button>--%>
<%--                            </li>--%>
<%--                        </ul>--%>
<%--                    </div>--%>
                    <div class="contents-sum"> ${work.fap == 0 ? '무료' : '유료 : '}
                            <c:if test="${work.fap == 1}">
                                팝콘
<%--                                <span>2개</span>--%>
                                <c:choose>
                                    <c:when test="${work.category eq '0'}">2개</c:when>
                                    <c:when test="${work.category eq '1'}">3개</c:when>
                                    <c:when test="${work.category eq '2'}">5개</c:when>
                                </c:choose>
                            </c:if>
                    </div>
                    <div class="contents-btn">
                        <c:choose>
                            <c:when test="${not empty bookmark and fn:contains(bookmark, work.workNo)}">
                                <span>찜한 작품입니다.</span>
                            </c:when>
                            <c:otherwise>
                            <div class="contents-btn">
                                <a href="../work/addBookmark?workNo=${work.workNo}">찜하기</a>
                            </div>
                            </c:otherwise>
                        </c:choose>
                    </div>
                    <p class="textset-desc">조회수 : ${work.viewCnt}</p>
                    <c:if test="${user.userId eq work.userId}">
                    <div class="contents-btn">
                            <a href="../episode/addEpisode?workNo=${work.workNo}">작품 회차 추가</a>
                    </div>
                    </c:if>
                </div>
            </div>
        </div>
    </div>
    <!-- [E]hooms-N40 -->



    <div class="hooms-N41" data-bid="uilQko01D3">
        <div class="contents-inner">
            <div class="contents-container container-md">
                <div class="contents-search">
                    <p class="contents-result"> 작품 회차수:<span> ${totalCount}</span>개 </p>
                    <!--            <div class="selectset selectset-lg">-->
                    <!--              <button class="selectset-toggle btn" type="button">-->
                    <!--                <span>최근 등록순</span>-->
                    <!--              </button>-->
                    <!--              <ul class="selectset-list">-->
                    <!--                <li class="selectset-item">-->
                    <!--                  <button class="selectset-link btn" type="button" data-value="최근 등록순">-->
                    <!--                    <span>최근 등록순</span>-->
                    <!--                  </button>-->
                    <!--                </li>-->
                    <!--              </ul>-->
                    <!--            </div>-->
                </div>
                <c:forEach var="episode" items="${list}">
                    <c:set var="purchased" value="false" />
                    <c:forEach var="purchaseEpisode" items="${purchase}">
                        <c:if test="${purchaseEpisode.episodeNo == episode.episodeNo}">
                            <c:set var="purchased" value="true" />
                        </c:if>
                    </c:forEach>
                    <div class="contents-group">
                        <div class="contents-cardlist contents-cardlist-active">
                            <a href="javascript:void(0)" onclick="handleEpisodeClick('${work.workName}', '${episode.episodeOrder}', '${episode.episodeName}', '${episode.episodeNo}', ${purchased})" class="cardset cardset-hor">
                                <figure class="cardset-figure">
                                    <img class="cardset-img" src="${episode.thumbnail}" alt="${episode.episodeOrder}화:${episode.episodeName}">
                                </figure>
                                <div class="cardset-body">
                                    <div class="contents-info">

                                        <c:if test="${work.fap == 1}">
                                            <c:choose>
                                                <c:when test="${purchased}">
                                                    <p class="cardset-desc" id="purchase">구매 되었습니다.</p>
                                                </c:when>
                                                <c:otherwise>
                        <span onclick="openModalWithInfo('${work.workName}', '${episode.episodeOrder}', '${episode.episodeName}', '${episode.episodeNo}')" style="cursor: pointer; text-decoration: underline;">
                            팝콘
                            <c:choose>
                                <c:when test="${work.category eq '0'}">2</c:when>
                                <c:when test="${work.category eq '1'}">3</c:when>
                                <c:when test="${work.category eq '2'}">5</c:when>
                            </c:choose>
                            소비하고 시청하기
                        </span>
                                                </c:otherwise>
                                            </c:choose>
                                        </c:if>
                                    </div>
                                    <div class="contents-info">
                                        <div class="contents-name"> ${work.workName}&nbsp;${episode.episodeOrder}화 <span class="contents-date"><fmt:formatDate value="${episode.episodeDate}" pattern="yyyy-MM-dd" /></span>
                                        </div>
                                    </div>
                                    <div class="cardset-tit-group">
                                        <h5 class="cardset-tit"> ${episode.episodeName} </h5>
                                    </div>
                                </div>
                                <c:if test="${user.userId eq work.userId}"><a href="../episode/updateEpisode?episodeNo=${episode.episodeNo}" class="btnset btnset-lg">수정</a>
                                    <form method="post" action="../episode/deleteEpisode">
                                        <input type="hidden" name="episodeNo" value="${episode.episodeNo}" />
                                        <button type="submit" class="btnset btnset-lg">삭제</button>
                                    </form>
                                </c:if>
                            </a>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
</main>

<!-- 모달 창 -->
<div id="myModal" class="modal">
    <div class="modal-content">
        <h3> <div id="modalContent"></div></h3>
        <button id="confirmBtn">팝콘
            <c:choose>
                <c:when test="${work.category eq '0'}">2</c:when>
                <c:when test="${work.category eq '1'}">3</c:when>
                <c:when test="${work.category eq '2'}">5</c:when>
            </c:choose>소비하기</button>
        <button id="cancelBtn">취소하기</button>
    </div>
</div>

<%@ include file="../layout/bottom.jsp" %>

</body>
<script>


    function handleEpisodeClick(workName, episodeOrder, episodeName, episodeNo, purchased) {
        if (purchased) {
            // 구매한 경우, 해당 회차로 이동
            window.location.href = '../episode/getEpisode?episodeNo=' + episodeNo;
        } else {
            // 구매하지 않은 경우, 모달 창을 띄움
            openModalWithInfo(workName, episodeOrder, episodeName, episodeNo);
        }
    }

    // 모달 창을 열기 위한 함수
    function openModal(workName, episodeOrder, episodeName) {
        console.log("Function called with:", workName, episodeOrder, episodeName);
        var modal = document.getElementById("myModal");
        modal.style.display = "block";

        var modalContent = document.getElementById("modalContent");
        modalContent.innerHTML = workName+' : '+episodeOrder+'회 '+episodeName+'를 시청하시겠습니까?'
    }

    // 모달 창을 닫기 위한 함수
    function closeModal() {
        var modal = document.getElementById("myModal");
        modal.style.display = "none";
    }

    // 모달 창 열기 버튼을 클릭했을 때 해당 정보를 전달하고 모달 창을 열도록 설정
    function openModalWithInfo(workName, episodeOrder, episodeName, episodeNo) {
        console.log("Function called with:", workName, episodeOrder, episodeName, episodeNo);

        openModal(workName, episodeOrder, episodeName);

        // "소비하기" 버튼에 이벤트 리스너를 등록하여 페이지 이동 로직을 처리
        var confirmBtn = document.getElementById("confirmBtn");
        confirmBtn.onclick = function() {
            consumeAndWatch(episodeNo);
        };
    }

    // "소비하기" 버튼을 클릭했을 때 페이지로 이동하는 함수
    function consumeAndWatch(episodeNo) {
        // 여기에서 원하는 페이지 URL로 이동하도록 설정합니다.
        var url = '/purchase/addPurchase?episodeNo=' + episodeNo; // 예시 URL
        window.location.href = url; // 페이지 이동
    }

    // "취소하기" 버튼을 클릭했을 때 모달 창을 닫기 위한 이벤트 리스너 등록
    document.getElementById("cancelBtn").addEventListener("click", function() {
        closeModal();
    });
</script>
</html>

<script src="../common/js/setting.js"></script>
<script src="../common/js/plugin.js"></script>
<script src="../common/js/template.js"></script>
<script src="../common/js/common.js"></script>
<script src="../common/js/script.js"></script>
<script src="../support/js/support.js"></script>
<script src="/common/js/drag.js"></script>
<%@ include file="../layout/bottom.jsp" %>