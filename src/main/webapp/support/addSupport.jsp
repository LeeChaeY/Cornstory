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
    <link rel="stylesheet" href="../common/css/setting.css">
    <link rel="stylesheet" href="../common/css/plugin.css">
    <link rel="stylesheet" href="../common/css/template.css">
    <link rel="stylesheet" href="../common/css/common.css">
    <link rel="stylesheet" href="../common/css/style.css">
</head>
<%@ include file="../layout/top.jsp" %>
<main class="th-layout-main ">
    <div class="opilsol-N9" data-bid="pzlq69LM4F" >
    </div>
    <div class="opilsol-N33" data-bid="MNLq69lM53" >
        <div class="content-container sub-menu">
        </div>
    </div>
    <div class="opilsol-N34" data-bid="ghLQ69LM5n" id="">
        <div class="content-container container-md">
            <div class="textset content-tit">
                <p class="textset-eu">고객센터</p>
                <c:choose>
                    <c:when test="${param.category eq '0'}">
                        <input type="text" id="supCategory" name="supCategory" value="0" style="display: none;">
                        <h2 class="textset-tit">공지사항</h2>
                    </c:when>
                    <c:when test="${param.category eq '1'}">
                        <input type="text" id="supCategory" name="supCategory" value="1" style="display: none;">
                        <h2 class="textset-tit">Q&A</h2>
                    </c:when>
                    <c:when test="${param.category eq '2'}">
                        <input type="text" id="supCategory" name="supCategory" value="2" style="display: none;">
                        <h2 class="textset-tit">신고</h2>
                    </c:when>
                </c:choose>
            </div>
        </div>
    </div>
    <div class="opilsol-N27" data-bid="yRLq69LM6s">
        <div class="content-container">
            <div class="contents-form container-md">
                <div class="contents-form-top d-flex justify-content-between">
                    <c:choose>
                        <c:when test="${param.category eq '0'}">
                            <input type="text" id="supCategory" name="supCategory" value="0" style="display: none;">
                            <h3 class="inputset-tit">공지사항 등록</h3>
                        </c:when>
                        <c:when test="${param.category eq '1'}">
                            <input type="text" id="supCategory" name="supCategory" value="1" style="display: none;">
                            <h3 class="inputset-tit">Q&A 등록</h3>
                        </c:when>
                        <c:when test="${param.category eq '2'}">
                            <input type="text" id="supCategory" name="supCategory" value="2" style="display: none;">
                            <h3 class="inputset-tit">신고 등록</h3>
                        </c:when>
                    </c:choose>

                    <span class="req">필수 선택입니다.</span>
                </div>
                <form action="${pageContext.request.contextPath}/support/addSupport" method="post" enctype="multipart/form-data">
                    <input type="hidden" name="userId" value="${sessionScope.user.userId}">
                    <div class="contents-form tableset">
                        <div class="tableset-inner">
                            <table class="tableset-table table">
                                <colgroup>
                                    <col>
                                    <col>
                                    <col>
                                    <col>
                                </colgroup>
                                <tbody>
                                <tr>
                                    <th>
                                        <label class="req label">닉네임</label>
                                    </th>
                                    <td>
                                        <div class="inputset">
                                            ${sessionScope.user.nickName}
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th>
                                        <label class="req label" for="supName">제목</label>
                                    </th>
                                    <td colspan="3">
                                        <div class="inputset">
                                            <input type="text" class="inputset-input form-control" name="supName" aria-label="제목">
                                        </div>
                                    </td>
                                </tr>

                                <c:choose>
                                    <c:when test="${param.category eq '0' and sessionScope.user.role eq 1}">
                                        <div class="sup-content">
                                            <tr>
                                                <th>
                                                    <label class="req label" for="supContent">문의내용</label>
                                                </th>
                                                <td colspan="3">
                                                    <div class="inputset">
                                                        <textarea class="inputset-input form-control textarea" name="supContent" aria-label="문의내용" required></textarea>
                                                    </div>
                                                </td>
                                            </tr>
                                        </div>
                                    </c:when>
                                    <c:when test="${param.category eq '1' and sessionScope.user.role eq 0}">
                                        <div class="sup-content">
                                            <input type="text"  name="supCategory" value="1" style="display: none;">
                                            <tr>
                                                <th>
                                                    <label class="req label" for="supContent">질문내용</label>
                                                </th>
                                                <td colspan="3">
                                                    <div class="inputset">
                                                        <textarea class="inputset-input form-control textarea" name="supContent" aria-label="문의내용" required></textarea>
                                                    </div>
                                                </td>
                                            </tr>
                                        </div>
                                    </c:when>
                                    <c:when test="${param.category eq '2' and sessionScope.user.role eq 0}">
                                        <div class="sup-content">
                                            <tr>
                                                <th>
                                                    <label class="req label" for="supId">신고 할 회원 닉네임</label>
                                                </th>
                                                <td colspan="3">
                                                    <div class="inputset">
                                                        <input class="inputset-input form-control" name="supId"  required/>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th>
                                                    <label class="req label" for="supContent">신고내용</label>
                                                </th>
                                                <td colspan="3">
                                                    <div class="inputset">
                                                        <textarea class="inputset-input form-control textarea" name="supContent" aria-label="신고내용" required></textarea>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th>
                                                    <label class="label" for="supPluscon">신고할 URL</label>
                                                </th>
                                                <td colspan="3">
                                                <div class="inputset">
                                                    <input class="inputset-input form-control" name="supPluscon"  required/>
                                                </div>

                                                </td>
                                            </tr>
                                        </div>
                                    </c:when>
                                </c:choose>
                                <tr>
                                    <th>
                                        <span class="label">파일첨부</span>
                                    </th>
                                    <td colspan="3">

                                        <div id="dropArea" class="drop-area">
                                            <span class="drop-text">
                                                JPG 이미지를 올려 주세요
                                            </span>
                                            <input class="check-image" type="file"  name="supfile" accept=".jpg"/>
                                            <ul id="fileList" class="file-list" style="list-style-type: none; padding: 0; margin-top: 10px;"></ul>

                                        </div>


                                        <p class="p1 co-text3">이미지 형식의 jpg(jpeg) 만 첨부 가능합니다.</p>
                                        <p class="p1 co-text3">첨부파일은 20MB를 초과할 수 없으며, 최대 1개까지 가능합니다.</p>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="opilsol-N28" data-bid="NNlq69lM7V">
                        <div class="content-container">
                            <div class="contents-agree container-md">
                                <div class="inputset inputset-lg inputset-label">
                                    <h6 class="inputset-tit">개인정보수집 및 이용동의</h6>
                                    <div class="inputset-board">
                                        <p class="subj-txt"> 1. 개인정보의 수집 및 이용목적</p>
                                        <p>콘스토리는 개인정보보호법을 준수하며, 관련 법령에 의거한 개인정보처리방침을 정하여 이용자 권익 보호에 최선을 다하고 있습니다. <br> 회사의 개인정보처리방침은 다음과 같은 내용을 담고 있습니다. </p>
                                        <p>2. 개인정보의 처리 목적 '회사'는 개인정보를 다음의 목적을 위해 처리합니다. 처리한 개인정보는 다음의 목적이외의 용도로는 사용되지 않으며 이용 목적이 변경될 시에는 사전동의를 구할 예정입니다.</p>
                                    </div>
                                </div>
                                <div class="checkset checkset-sm">
                                    <input id="checkset-c-6-1" class="checkset-input input-round" type="checkbox" value="" checked="">
                                    <label class="checkset-label" for="checkset-c-6-1"></label>
                                    <span class="checkset-text">[필수] 개인정보처리방침 및 이용동의에 동의합니다</span>
                                </div>
                                <div class="bottom-btn">
                                    <button class="btnset btnset-lg btnset-dark btnset-rect">등록 하기</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</main>
</html>

<script src="../common/js/setting.js"></script>
<script src="../common/js/plugin.js"></script>
<script src="../common/js/template.js"></script>
<script src="../common/js/common.js"></script>
<script src="../common/js/script.js"></script>
<script src="../ssh/js/support.js"></script>
<%@ include file="../layout/bottom.jsp" %>
