<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <link rel="stylesheet" href="../common/css/setting.css">
    <link rel="stylesheet" href="../common/css/plugin.css">
    <link rel="stylesheet" href="../common/css/template.css">
    <link rel="stylesheet" href="../common/css/common.css">
    <link rel="stylesheet" href="../common/css/style.css">
    <link rel="stylesheet" href="../support/css/setting.css">
    <link rel="stylesheet" href="../support/css/plugin.css">
    <link rel="stylesheet" href="../support/css/template.css">
    <link rel="stylesheet" href="../support/css/common.css">
    <link rel="stylesheet" href="../support/css/style.css">
    <link rel="stylesheet" href="/common/css/drag.css">
    <style>
        .drop-area {
            border: 2px dashed #ccc;
            padding: 20px;
            text-align: center;
            width: 5000px;
            cursor: pointer;
        }
    </style>
</head>
<%@ include file="../layout/top.jsp" %>
<main class="th-layout-main ">
    <!-- [S]thpart-HmlqLtFlNZ -->
    <div class="thpart-HmlqLtFlNZ" data-bid="HmlqLtFlNZ" id="">
        <div class="contents-container">
            <img class="contents-backimg" src="https://images.unsplash.com/photo-1624007435086-7e236df42151?crop=entropy&amp;cs=tinysrgb&amp;fit=max&amp;fm=jpg&amp;ixid=M3w0OTE2MDd8MHwxfHNlYXJjaHwxOTh8fCVFRCU5RCU5MSVFQiVCMCVCMXxrb3wwfHx8YmxhY2tfYW5kX3doaXRlfDE3MDM1ODMzNjB8MA&amp;ixlib=rb-4.0.3&amp;q=80&amp;w=1080" alt="">
            <div class="contents-body container-md">
                <h2 class="contents-title"> Support </h2>
                <h7 class="contents-sub">고객센터</h7>
            </div>
        </div>
    </div>
    <!-- [E]thpart-HmlqLtFlNZ -->
    <div class="hooms-N39" data-bid="CtlqM6s29L">
        <div class="contents-inner">
            <div class="contents-container container-md">
                <form action="${pageContext.request.contextPath}/support/addSupport" method="post" enctype="multipart/form-data">
                <div class="textset textset-h2">
                    <c:choose>
                        <c:when test="${param.category eq '0'}">
                            <input type="text" id="supCategory" name="supCategory" value="0" style="display: none;">
                            <h2 class="textset-tit">공지사항 등록</h2>
                        </c:when>
                        <c:when test="${param.category eq '1'}">
                            <input type="text" id="supCategory" name="supCategory" value="1" style="display: none;">
                            <h2 class="textset-tit">Q&A 등록</h2>
                        </c:when>
                        <c:when test="${param.category eq '2'}">
                            <input type="text" id="supCategory" name="supCategory" value="2" style="display: none;">
                            <h2 class="textset-tit">신고 접수</h2>
                        </c:when>
                    </c:choose>
                </div>
                <div class="contents-form">
                    <div class="contents-form-top">
                        <label class="labelset">
                            <strong class="labelset-vital">
                                <span>*</span>필수입력 </strong>
                        </label>
                    </div>
                    <div class="contents-form-middle">
                        <div class="inputset inputset-lg inputset-label">
                            <label>
                                <h6 class="inputset-tit"> 신고자 </h6>  ${sessionScope.user.nickName}
                            </label>
                        </div>
                        <div class="inputset inputset-lg inputset-label">
                            <label>
                                <h6 class="inputset-tit"> 피신고자 </h6>
                                <input type="text" class="inputset-input form-control" placeholder="신고할 회원 아이디." name="sup_id" id="sup_id" aria-label="내용" required="">
                            </label>
                            <p>사용자 ID: <span id="userIdOutput"></span></p>
                        </div>
                        <div class="contents-form-middle">
                            <div class="inputset inputset-lg inputset-label">
                                <label>
                                <c:choose>
                                    <c:when test="${param.category eq '1'}">
                                    </c:when>
                                    <c:when test="${param.category eq '2'}">
                                        <h6 class="inputset-tit"> 신고 URL </h6>
                                        <input type="text" class="inputset-input form-control" placeholder="URL을 입력해주세요." name="supName" aria-label="내용" required="">
                                    </c:when>
                                    <c:otherwise>
                                        <h6 class="inputset-tit"> 제목 </h6>
                                        <input type="text" class="inputset-input form-control" placeholder="제목을 입력해주세요." name="supName" aria-label="내용" required="">
                                    </c:otherwise>
                                </c:choose>

                                </label>
                            </div>
                            <div class="inputset inputset-lg inputset-label">
                                <label>
                                <c:choose>
                                    <c:when test="${param.category eq '0'}">
                                        <h6 class="inputset-tit"> 공지내용<span>*</span> </h6>
                                    </c:when>
                                    <c:when test="${param.category eq '1'}">
                                            <h6 class="inputset-tit"> 질문내용<span>*</span> </h6>
                                    </c:when>
                                    <c:when test="${param.category eq '2'}">
                                        <h6 class="inputset-tit"> 신고내용<span>*</span> </h6>
                                    </c:when>
                                </c:choose>

                                    <c:choose>
                                        <c:when test="${param.category eq '0'}">
                                            <h6 class="inputset-tit"> 공지내용<span>*</span> </h6>
                                            <textarea class="inputset-textarea"  name="supContent" placeholder="공지 내용을 입력해주세요." required=""></textarea>
                                            <div class="inputset-langth">
                                                <span class="inputset-count">0</span>
                                                <span class="inputset-total">/4000</span>
                                            </div>
                                        </c:when>
                                        <c:when test="${param.category eq '1'}">
                                            <h6 class="inputset-tit"> 질문내용<span>*</span> </h6>
                                            <textarea class="inputset-textarea"  name="supContent" placeholder="질문 내용을 입력해주세요." required=""></textarea>
                                            <div class="inputset-langth">
                                                <span class="inputset-count">0</span>
                                                <span class="inputset-total">/4000</span>
                                            </div>
                                        </c:when>
                                        <c:when test="${param.category eq '2'}">
                                            <select class="selectset-toggle btn"  name="supName" required="">
                                                <option selected disabled hidden="">선택해주세요</option>
                                                <option value="불법 활동">불법 활동</option>
                                                <option value="욕설 및 혐오 발언">욕설 및 혐오 발언</option>
                                                <option value="스팸 및 광고 활동">스팸 및 광고 활동</option>
                                            </select>
                                        </c:when>
                                    </c:choose>
                                </label>
                            </div>
                            <div class="fileset fileset-lg fileset-label">
                                <label>
                                    <c:choose>
                                        <c:when test="${param.category eq '1'}">

                                        </c:when>
                                    <c:otherwise>
                                        <h6 class="fileset-tit"> 첨부파일<span>(선택사항)</span>
                                        </h6>

                                        <div class="inputset inputset-lg inputset-label"  for="supImage">
                                            <div id="dropArea" class="drop-area">
                                                <span class="drop-text">JPG 이미지를 올려 주세요</span>
                                                <input class="check-image" type="file" id="supfile" name="supfile" accept=".jpg"/>
                                                    <ul id="fileList" class="file-list"></ul>
                                            </div>
                                        </div>
                                    </c:otherwise>
                                    </c:choose>
                                </label>
                            </div>
                        </div>
                        <div class="contents-form-bottom">
                            <div class="inputset inputset-lg inputset-label">
                                <label>
                                    <h6 class="inputset-tit">개인정보수집 및 이용동의</h6>
                                    <div class="inputset-board"> - 수집하는 개인정보 항목 : 이메일 주소 <br>
                                        <br> 작성해주시는 개인 정보는 문의 접수 및 고객 불만 해결을 위해 5년간 보관됩니다. 이용자는 본 동의를 거부할 수 있으나, 미동의시 문의 접수가 불가능합니다.
                                    </div>
                                </label>
                            </div>
                            <div class="checkset">
                                <input id="checkset-a-1-1" class="checkset-input input-fill" type="checkbox" value="">
                                <label class="checkset-label" for="checkset-a-1-1"></label>
                                <span class="checkset-text">위 내용을 읽었으며, 내용에 동의합니다. (필수)</span>
                            </div>
                        </div>
                        <div class="contents-sign">
                            <button class="btnset modalset-btn">등록하기</button>
                        </div>
                    </div>
                </div>
                </form>
            </div>
        </div>
    </div>
</main>
</html>
<script>
    $(document).ready(function() {
        $('#sup_id').on('change', function() {
            var nickName = $(this).val();
            checkNickName(nickName);
        });

        // userIdOutput 클릭 이벤트 리스너 추가
        $('#userIdOutput').on('click', function() {
            var userId = $(this).text();
            if(userId && userId !== "해당 닉네임을 가진 사용자가 없습니다." && userId !== "오류가 발생했습니다") {
                $('#sup_id').val(userId);
            }
        });
    });

    function checkNickName(nickName) {
        $.ajax({
            type: "GET",
            url: "/support/json/getUserIdByNickname",
            data: { nickName: nickName },
            success: function(userId) {
                if(userId) {
                    $('#userIdOutput').text(userId);
                } else {
                    $('#userIdOutput').text("해당 닉네임을 가진 사용자가 없습니다.");
                }
            },
            error: function(xhr, status, error) {
                $('#userIdOutput').text("오류가 발생했습니다: " + error);
            }
        });
    }

</script>

<script src="../common/js/setting.js"></script>
<script src="../common/js/plugin.js"></script>
<script src="../common/js/template.js"></script>
<script src="../common/js/common.js"></script>
<script src="../common/js/script.js"></script>
<script src="../support/js/support.js"></script>
<script src="/common/js/drag.js"></script>
<%@ include file="../layout/bottom.jsp" %>
