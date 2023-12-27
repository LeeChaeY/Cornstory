<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <title>updateProduct</title>

    <link rel="stylesheet" href="/lcy/css/style.css">
    <link rel="stylesheet" href="/common/css/drag.css">

    <!-- [E]thwhole-wfLpW5Z3pJ -->
    <script src="/ssh/js/setting.js"></script>
    <script src="/ssh/js/plugin.js"></script>
    <script src="/ssh/js/template.js"></script>
    <script src="/ssh/js/common.js"></script>
    <script src="/ssh/js/script.js"></script>

    <script src="/lcy/js/addProduct.js"></script>
    <script src="/common/js/drag.js"></script>
</head>

<body>

<%@ include file="../layout/top.jsp" %>

<!-- [E]opilsol-N26 -->
<main class="th-layout-main ">
    <div class="thpart-HmlqLtFlNZ" data-bid="HmlqLtFlNZ" id="">
        <div class="contents-container">
            <img class="contents-backimg"
                 src="https://images.unsplash.com/photo-1582567257180-eff71017288d?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0OTE2MDd8MHwxfHNlYXJjaHwzMjJ8fCVFQSVCMiU4MCVFQyU5RCU4MHxrb3wwfHx8fDE3MDM2MDk4NDZ8MA&ixlib=rb-4.0.3&q=80&w=200"
                 alt="">
            <div class="contents-body container-md">
                <h2 class="contents-title">
                    Store
                </h2>
                <h7 class="contents-sub">스토어</h7>
            </div>
        </div>
    </div>


    <div class="hooms-N53" data-bid="lYlQluvFkB">
        <div class="contents-inner">
            <div class="contents-form container-md">
                <div class="textset textset-h2">
                    <c:if test="${prodCategory == 0}">
                        <h2 class="textset-tit">팝콘 수정하기</h2>
                    </c:if>
                    <c:if test="${prodCategory == 2}">
                        <h2 class="textset-tit">저작권 수정하기</h2>
                    </c:if>
                </div>

                <form name="form" method="post">
                    <input type="hidden" name="userStatus" value="${userStatus}">
                    <input type="hidden" name="tranCategory" value="">
                    <input type="hidden" name="condition" value="${condition}">
                </form>

                <c:if test="${product.prodCategory == 0}">

                    <form name="updateProduct" enctype="multipart/form-data">
                        <div class="contents-form">
                            <div class="contents-form-top"></div>
                            <label class="labelset">
                                <strong class="labelset-vital">
                                    <span>*</span>필수입력
                                </strong>
                            </label>
                            <div class="contents-form tableset">
                                <div class="tableset-inner">
                                    <input type="hidden" name="prodCategory" value="${product.prodCategory}">
                                    <input type="hidden" name="prodNo" value="${product.prodNo}">
                                    <table class="tableset-table table">
                                        <colgroup>
                                            <col>
                                            <col>
                                            <col>
                                        </colgroup>
                                        <tbody>
                                        <tr>
                                            <th>
                                                <label class="req label">팝콘 수량</label>
                                            </th>
                                            <td>
                                                <div class="inputset">
                                                    <input type="text" min="1" value="<fmt:formatNumber value='${product.prodCnt}' pattern='#,##0'/>"
                                                           name="prodCnt" class="inputset-input form-control" required=""> 개
                                                    <input type="hidden" name="prodCnt2" value="${product.prodCnt}">
                                                </div>
                                                <p class="prodNameCheck" style="color: red; display: none;">
                                                    해당 수량의 팝콘이 등록되어있습니다.
                                                </p>
                                                <p class="check" style="color: red; display: none;">
                                                    팝콘 수량은 1개 이상부터 가능합니다.
                                                </p>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>
                                                <label class="req label">팝콘 가격</label>
                                            </th>
                                            <td>
                                                <div class="inputset">
                                                    <input type="text" min="100" value="<fmt:formatNumber value='${product.prodPrice}' pattern='#,##0'/>"
                                                           name="prodPrice" required="" class="inputset-input form-control">
                                                    원<br><br>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>
                                                <span class="label">팝콘 이미지 첨부</span>
                                            </th>
                                            <td colspan="2">
                                                <div id="dropArea" class="drop-area">
                                                    <span class="drop-text">Drag and drop files here or click to upload</span>
                                                    <input class="check-image" type="file" name="file" accept=".jpg"/>
                                                    <ul id="fileList" class="file-list"></ul>
                                                </div>
                                                <br>
                                                <p class="p1 co-text3">이미지 형식의 jpg만 첨부 가능합니다.</p>
                                                <p class="p1 co-text3">첨부파일은 10MB를 초과할 수 없으며, 최대 1개까지 가능합니다.</p>
                                                <p class="fileCheck" style="color: red; display:none;">
                                                </p>
                                            </td>
                                            <td colspan="1">
                                                * 기존 팝콘 이미지<br><br>
                                                <img width="100px" height="100px" src="/file/product/${product.prodImage}">
                                            </td>
                                        </tr>
                                        </tbody>
                                    </table>
                                    <br>
                                    <div class="bottom-btn">
                                        <input type="button" class="btnset btnset-lg btnset-dark btnset-rect"
                                               value="취소"/>
                                        <input type="button" class="btnset btnset-lg btnset-rect" value="수정"/>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>
                </c:if>

                <c:if test="${product.prodCategory == 2}">
                        <form name="updateProduct" enctype="multipart/form-data">
                            <div class="contents-form">
                                <div class="contents-form-top"></div>
                                <label class="labelset">
                                    <strong class="labelset-vital">
                                        <span>*</span>필수입력
                                    </strong>
                                </label>
                                <div class="contents-form tableset">
                                    <div class="tableset-inner">
                                        <input type="hidden" name="prodCategory" value="${product.prodCategory}">
                                        <input type="hidden" name="prodNo" value="${product.prodNo}">
                                        <table class="tableset-table table">
                                            <colgroup>
                                                <col>
                                                <col>
                                                <col>
                                            </colgroup>
                                            <tbody>
                                            <tr>
                                                <th>
                                                    <input type="file" name="file" style="display: none;">
                                                    <input type="hidden" name="workNo" value="${product.workNo}">
                                                    <label class="req label">작품 이름</label>
                                                </th>
                                                <td>
                                                    <div class="inputset">
                                                            ${product.prodName}
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th>
                                                    <label class="req label">저작권 가격</label>
                                                </th>
                                                <td>
                                                    <div class="inputset">
                                                        <input type="text" min="0" value="<fmt:formatNumber value='${product.prodPrice}' pattern='#,##0'/>"
                                                               name="prodPrice" required="" class="inputset-input form-control">
                                                        <span class="free" style="display: none;">0</span> 개<br>
                                                    </div>
                                                    <p class="freeCheck" style="color: red; display: none;">
                                                        무료인 작품의 저작권 가격은 팝콘 0개입니다.
                                                    </p>
                                                </td>
                                            </tr>
                                            </tbody>
                                        </table>
                                        <br>
                                        <div class="bottom-btn">
                                            <input type="button" class="btnset btnset-lg btnset-dark btnset-rect"
                                                   value="취소"/>
                                            <input type="button" class="btnset btnset-lg btnset-rect" value="수정"/>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form>
                </c:if>

            </div>
        </div>
    </div>
    <!-- [E]opilsol-N27 -->
</main>

<%@ include file="../layout/bottom.jsp" %>

</body>

</html>