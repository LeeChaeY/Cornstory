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
    <link rel="stylesheet" href="../ssh/css/setting.css">
    <link rel="stylesheet" href="../ssh/css/plugin.css">
    <link rel="stylesheet" href="../ssh/css/template.css">
    <link rel="stylesheet" href="../ssh/css/common.css">
    <link rel="stylesheet" href="../ssh/css/style.css">
</head>

<%@ include file="../layout/top.jsp" %>
<main class="th-layout-main ">
    <body>
    <div class="opilsol-N24" data-bid="raLq4sT3lu">
        <div class="content-container">
            <div class="contents-form container-md">
                <div class="contents-form-top d-flex justify-content-between">
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
                            <h2 class="textset-tit">신고 등록</h2>
                        </c:when>
                    </c:choose>
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
                                <c:choose>
                                    <c:when test="${param.category eq '0' and sessionScope.user.role eq 1}">
                                        <div class="sup-content">
                                            <tr>
                                                <th>
                                                    <label class="req label" for="supContent">제목</label>
                                                </th>
                                                <td colspan="3">
                                                    <div class="inputset">
                                                        <input type="text" class="inputset-input form-control" id="supContent" name="supContent" >
                                                    </div>
                                                </td>
                                            </tr>
                                            <input type="text" id="supCategory" name="supCategory" value="0" style="display: none;">
                                            <tr>
                                                <th>
                                                    <div class="inputset">
                                                        <label for="supPluscon">내용 등록:</label>
                                                    </div>
                                                </th>
                                                <td colspan="3">
                                                    <textarea class="inputset-input form-control textarea" id="supPluscon" name="supPluscon" rows="4" required style="height: 286px;"></textarea>
                                                </td>
                                            </tr>
                                        </div>

                                    </c:when>
                                    <c:when test="${param.category eq '1' and sessionScope.user.role eq 0}">
                                        <div class="sup-content">
                                            <input type="text" id="supCategory" name="supCategory" value="1" style="display: none;">
                                            <tr>
                                                <th>
                                                    <label for="supContent">질문 등록:</label>
                                                </th>
                                                <td colspan="30">
                                                    <div class="inputset">
                                                    <textarea id="supContent" name="supContent" rows="4" required></textarea>
                                                        </div>
                                                </td>
                                            </tr>
                                        </div>
                                    </c:when>
                                    <c:when test="${param.category eq '1' and sessionScope.user.role eq 1}">
                                        <div class="sup-content">
                                            <input type="text" id="supCategory" name="supCategory" value="1" style="display: none;">
                                            <tr>
                                                <th>
                                                    <label for="supPluscon">질문 내용:</label>
                                                </th>
                                                <td colspan="3">
                                                        ${param.supContent}
                                                </td>
                                            </tr>
                                            <tr>
                                                <th>
                                                    <label for="supPluscon">답변 내용:</label>
                                                </th>
                                                <td colspan="3">
                                                    <textarea id="supPluscon" name="supPluscon" rows="4"></textarea>
                                                </td>
                                            </tr>
                                        </div>
                                    </c:when>
                                    <c:when test="${param.category eq '2' and sessionScope.user.role eq 0}">
                                        <div class="sup-content">
                                            <input type="text" id="supCategory" name="supCategory" value="2" style="display: none;">
                                            <tr>
                                                <th>
                                                    <label for="supContent">신고할 회원닉네임</label>
                                                </th>
                                                <td colspan="3">
                                                    <textarea id="supContent" name="supContent" rows="1" required></textarea>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th>
                                                    <label for="supContent">신고 내용:</label>
                                                </th>
                                                <td colspan="3">
                                                    <textarea id="supContent" name="supContent" rows="4" required></textarea>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th>
                                                    <label for="supPluscon">신고URL:</label>
                                                </th>
                                                <td colspan="3">
                                                    <textarea id="supPluscon" name="supPluscon" rows="1"></textarea>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th>
                                                    <label for="supImage">이미지 업로드:</label>
                                                </th>
                                                <td colspan="3">
                                                    <input type="file" id="supImage" name="supImage">
                                                </td>
                                            </tr>
                                        </div>
                                    </c:when>
                                </c:choose>
                                </tbody>

                            </table>
                        </div>
                    </div>
                    <button type="submit">등록하기</button>
                </form>
            </div>
        </div>
    </div>


</body>
</main>
</html>
<script src="../ssh/js/setting.js"></script>
<script src="../ssh/js/plugin.js"></script>
<script src="../ssh/js/template.js"></script>
<script src="../ssh/js/common.js"></script>
<script src="../ssh/js/script.js"></script>
<%@ include file="../layout/bottom.jsp" %>
