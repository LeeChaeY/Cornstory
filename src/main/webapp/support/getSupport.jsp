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
            <div class="textset content-tit">
                <p class="textset-eu">고객센터</p>
                <c:choose>
                    <c:when test="${support.supCategory eq '0'}">
                        <input type="text" id="supCategory" name="supCategory" value="0" style="display: none;">
                        <h2 class="textset-tit">공지사항</h2>
                    </c:when>
                    <c:when test="${support.supCategory eq '1'}">
                        <input type="text" id="supCategory" name="supCategory" value="1" style="display: none;">
                        <h2 class="textset-tit">Q&A</h2>
                    </c:when>
                    <c:when test="${support.supCategory eq '2'}">
                        <input type="text" id="supCategory" name="supCategory" value="2" style="display: none;">
                        <h2 class="textset-tit">신고</h2>
                    </c:when>
                </c:choose>
                <br><h5 class="textset-eu" id="totalUsers">작성일 : ${support.supDate}</h5>

            </div>
        </div>
    </div>
    <div class="opilsol-N27" data-bid="yRLq69LM6s">
        <div class="content-container">
            <div class="contant-body">
                <div class="contents-form-top d-flex justify-content-between">
                </div>

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
                                        <label class="label">작성자 닉네임</label>
                                    </th>
                                    <td>
                                        <div class="inputset">
                                            ${support.userId}
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th>
                                        <label class="label" for="supName">제목</label>
                                    </th>
                                    <td colspan="3">
                                        <div class="inputset">
                                           ${support.supName}
                                        </div>
                                    </td>
                                </tr>

                                <c:choose>
                                    <c:when test="${support.supCategory eq '0'}">
                                        <div class="sup-content">
                                            <tr>
                                                <th>
                                                    <label class=" label" for="supContent">공지내용</label>
                                                </th>
                                                <td colspan="3">
                                                    <div class="inputset">
                                                        <img class="textset-tit" src="../file/support/${support.supImage}" width="500" style=" max-width: 100%;" alt=""/>
                                                            ${support.supContent}
                                                    </div>
                                                </td>
                                            </tr>
                                        </div>
                                    </c:when>

                                    <c:when test="${support.supCategory eq '1' and sessionScope.user.role eq 0}">
                                        <div class="sup-content">
                                            <tr>
                                                <th>
                                                    <label class=" label">질문</label>
                                                </th>
                                                <td colspan="3">
                                                    <div class="inputset">
                                                            ${support.supContent}
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th>
                                                    <label class=" label">답변</label>
                                                </th>
                                                <td colspan="3">
                                                    <div class="inputset">
                                                        <c:choose>
                                                            <c:when test="${not empty support.supPluscon}">
                                                                ${support.supPluscon}
                                                            </c:when>
                                                            <c:otherwise>
                                                                등록된 답변이 없습니다.
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </div>
                                                </td>

                                            </tr>
                                        </div>
                                    </c:when>
                                    <c:when test="${support.supCategory eq '1' and sessionScope.user.role eq 1}">
                                        <div class="sup-content">
                                            <tr>
                                                <th>
                                                    <label class=" label">질문</label>
                                                </th>
                                                <td colspan="3">
                                                    <div class="inputset">
                                                            ${support.supContent}
                                                    </div>
                                                </td>
                                            </tr>
                                            <input type="text"  name="supPluscon" value="1" style="display: none;">
                                            <tr>
                                                <th>
                                                    <label class="req label" for="supPluscon">답변</label>
                                                </th>
                                                <td colspan="3">
                                                    <div class="inputset">
                                                        <c:choose>
                                                            <c:when test="${not empty support.supPluscon}">
                                                                ${support.supPluscon}<a href="updateSupport">[수정하기]</a>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <textarea class="inputset-input form-control textarea" name="supContent" aria-label="문의내용" required></textarea>
                                                            </c:otherwise>
                                                        </c:choose>

                                                    </div>
                                                </td>
                                            </tr>
                                        </div>
                                    </c:when>
                                    <c:when test="${support.supCategory eq '2' and sessionScope.user.role eq 0}">
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

                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="opilsol-N28" data-bid="NNlq69lM7V">
                        <div class="content-container">
                            <div class="contents-agree container-md">
                                <div class="bottom-btn">

                                    <a href="listSupport?category=${support.supCategory}"><button class="btnset btnset-lg btnset-dark btnset-rect">확인</button></a>

                                    <c:choose>
                                        <c:when test="${support.supCategory eq '0' and sessionScope.user.role eq 1}">
                                            <span class="button-gap"></span>

                                            <a href="updateSupport?supNo=${support.supNo}"><button class="btnset btnset-lg btnset-rect">수정하기</button></a>


                                            <span class="button-gap"></span>

                                            <a id="withdrawLink" href="#"><button class="btnset btnset-lg btnset-dark btnset-rect">삭제하기</button></a>
                                        </c:when>
                                        <c:when test="${support.supCategory eq '1' and sessionScope.user.role eq 0 and support.userId eq sessionScope.user.userId}">
                                            <span class="button-gap"></span>

                                            <a href="updateSupport?supNo=${support.supNo}"><button class="btnset btnset-lg btnset-rect">수정하기</button></a>


                                            <span class="button-gap"></span>

                                            <a id="withdrawLink" href="#"><button class="btnset btnset-lg btnset-dark btnset-rect">삭제하기</button></a>
                                        </c:when>
                                        <c:when test="${support.supCategory eq '1' and sessionScope.user.role eq 1}">

                                            <span class="button-gap"></span>



                                            <c:choose>
                                                <c:when test="${not empty support.supPluscon}">
                                                    <span class="button-gap"></span>

                                                    <a id="withdrawLink" href="#"><button class="btnset btnset-lg btnset-rect">수정하기</button></a>

                                                    <span class="button-gap"></span>

                                                    <a id="withdrawLink" href="#"><button class="btnset btnset-lg btnset-dark btnset-rect">삭제하기</button></a>
                                                </c:when>
                                                <c:otherwise>
                                                    <a href="updateSupport?supNo=${support.supNo}"><button class="btnset btnset-lg btnset-rect">등록하기</button></a>

                                                </c:otherwise>
                                            </c:choose>


                                        </c:when>
                                    </c:choose>

                                    <c:if test="${param.deleted eq 'true'}">
                                        <p style="color: green;">회원 탈퇴가 완료되었습니다.</p>
                                    </c:if>


                                </div>
                            </div>
                        </div>
                    </div>

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
<script src="../ssh/js/deleteSupport.js"></script>
<%@ include file="../layout/bottom.jsp" %>
