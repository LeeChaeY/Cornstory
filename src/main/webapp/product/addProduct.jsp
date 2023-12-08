<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>addProduct</title>

        <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
        <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

        <script type="text/css">
            a {
                text-decoration: none;
            }
        </script>

        <script type="text/javascript">

            $(function() {
                $("input[name='prodCnt']").on("input", function(){
                    fncProdNameCheck();
                });

                $("input[value='등록']").on("click", function(){
                    addProduct();
                });

                $("span").on("click", function(){
                    fncGetProductList('1');
                });

                $("select[name='workSelect']").on("change", function(){
                    $("input[name='prodPrice']").val(100);
                    $("input[name='prodPrice']").attr("type", "number");
                    $(".free").css("display", "none");
                    $(".freeCheck").css("display", "none");

                    if ($("select[name='workSelect']").val() !== "작품 선택") {
                        if ($("input[name='"+event.target.value+"']").val() === "1") {
                            $("input[name='prodPrice']").val(0);
                            $("input[name='prodPrice']").attr("type", "hidden");
                            $(".free").css("display", "inline");
                            $(".freeCheck").css("display", "block");
                        }
                    }
                });
            });

            function addProduct() {
                if ((${prodCategory == 2}) && ($("select[name='workSelect']").val() === "작품 선택")) {
                    alert("작품을 선택해주세요.");
                    return false;
                }
                if (${prodCategory == 0}) {
                    if ($("input[name='prodCnt']").val() === "") {
                        alert("1개 이상의 팝콘 수량을 입력해주세요.");
                        return false;
                    }
                }
                if ($("input[name='prodPrice']").val() === "") {
                    alert("가격을 입력해주세요.");
                    return false;
                }
                if (${prodCategory == 2}) {
                    $("input[name='workNo']").val($("select[name='workSelect']").val());
                }
                $("form[name='addProduct']").attr("method", "post").attr("action", "/product/addProduct").submit();
            }

            function fncProdNameCheck() {
                if ($(".prodNameCheck").css("display") === "block") {
                    $(".prodNameCheck").css("display", "none");
                }
                if ($(".check").css("display") === "block") {
                    $(".check").css("display", "none");
                }

                if ($("input[name='prodCnt']").val() === "0") {
                    $("input[name='prodCnt']").val("");
                    $(".check").css("display", "block");
                }

                if ($("input[name='prodCnt']").val() !== "") {
                    $.ajax(
                        {
                            url: "/product/json/prodNameCheck?prodCnt=" + $("input[name='prodCnt']").val(),
                            method: "GET",
                            dataType: "text",
                            success: function (data, status) {
                                if (data === "1") {
                                    $(".prodNameCheck").css("display", "block");
                                }
                            },
                            error: function (status) {
                                //Debug...
                                alert("error");
                            }
                        });
                }
            }


            function fncGetProductList(currentPage) {
                $("input[name='currentPage']").val(currentPage);

                let spanText = event.target.innerText;
                if (spanText === "목록") {
                    // $(self.location).attr("href", "/product/listProduct");
                    $("form[name='form']").attr("method", "post").attr("action", "/product/listProduct").submit();
                }
                else if (spanText === "나의 저작권") {
                    $("input[name='userId']").val("${sessionScope.user.userId}");
                    $("form[name='form']").attr("method", "post").attr("action", "/product/listProduct").submit();
                }
                else if (spanText === "저작권 등록") {
                    $("input[name='prodCategory']").val(2);
                    $("form[name='form']").attr("method", "get").attr("action", "/product/addProduct").submit();
                }
                else if (spanText === "팝콘 등록") {
                    $("input[name='prodCategory']").val(0);
                    $("form[name='form']").attr("method", "get").attr("action", "/product/addProduct").submit();
                }
                else if (spanText === "팝콘 소비 내역") {
                    <%--$("input[name='userId']").val("${sessionScope.user.userId}");--%>
                    $("form[name='form']").attr("method", "post").attr("action", "/product/listProduct").submit();
                }
                else if (spanText === "팝콘 충전 내역") {
                    <%--$("input[name='userId']").val("${sessionScope.user.userId}");--%>
                    $("form[name='form']").attr("method", "post").attr("action", "/product/listProduct").submit();
                }
                else if (spanText === "팝콘 총 매출") {
                    <%--$("input[name='userId']").val("${sessionScope.user.userId}");--%>
                    $("form[name='form']").attr("method", "post").attr("action", "/product/listProduct").submit();
                }
            }
        </script>
    </head>
    <body>

        <table height="37" >
            <tr>
                <td height="37">
                    <img width="15" height="37"/>
                </td>
                <td style="padding-left:10px;">
                    <table >
                        <tr>
                            <td class="ct_ttl01">
                                <a href="/"><h2>메인</h2></a>
                            </td>
                            <td class="ct_ttl01">
                                스토어
                            </td>
                        </tr>
                    </table>
                </td>
                <td height="37">
                    <img src="" width="12" height="37"/>
                </td>
            </tr>
        </table>

        <form name="form">
            <input type="hidden" name="userId" value="">
            <input type="hidden" name="prodCategory" value="${prodCategory}">
        </form>
        <table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
            <tr>
                <td>
                    <div align="center">
                        <strong><span>목록</span></strong> |
                        <c:if test="${sessionScope.user.role == 0}">
                            <span><strong>나의 저작권</strong></span> |
                            <span><strong>저작권 등록</strong></span> |
                        </c:if>
                        <c:if test="${sessionScope.user.role == 1}">
                            <span><strong>팝콘 등록</strong></span> |
                        </c:if>
                        <span><strong>팝콘 소비 내역</strong></span> |
                        <span><strong>팝콘 충전 내역</strong></span> |
                        <c:if test="${sessionScope.user.role == 1}">
                            <span><strong>팝콘 총 매출</strong></span>
                        </c:if>
                    </div>
                    <br>
                </td>
            </tr>
            <tr>
                <td colspan="11" height="1"></td>
            </tr>

            <tr>
                <td align="right">
                    <select name="searchCondition" class="ct_input_g" style="width:100px">
                        <option value="0"
                        ${!empty search.searchCondition && search.searchCondition.equals("0") ? "selected" : ""}>
                            저작권 이름
                        </option>
                    </select>
                    <input type="text" name="searchKeyword"
                           value="${!empty search.searchCondition && search.searchCondition.equals('1') ? search.searchKeyword : ''}"
                           class="ct_input_g" style="width:200px; height:19px" />
                </td>

                <td align="right" width="70">
                    <table border="0" cellspacing="0" cellpadding="0">
                        <tr>
                            <td width="17" height="23">
                            </td>
                            <td class="ct_btn01" style="padding-top:3px;"
                                onClick="fncGetProductList('1');">
                                검색
                            </td>
                            <td width="14" height="23">
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>




        <c:if test="${prodCategory == 0}">
            <h2>팝콘 등록하기</h2>
        </c:if>
        <c:if test="${prodCategory == 2}">
            <h2>저작권 등록하기</h2>
        </c:if>
        <form name="addProduct" enctype="multipart/form-data">
            <input type="hidden" name="prodCategory" value="${prodCategory}">

            <c:if test="${prodCategory == 0}">
                <label>팝콘 수량: </label>
                <input type="number" min="1" value="1" name="prodCnt" required> 개
                <p class="prodNameCheck" style="color: red; display: none;">
                    해당 수량의 팝콘이 등록되어있습니다.
                </p>
                <p class="check" style="color: red; display: none;">
                    팝콘 수량은 1개 이상부터 가능합니다.
                </p>
                <br><br>

                <label>팝콘 가격: </label><br>
                <input type="number" min="100" value="100" name="prodPrice" required> 원<br><br>

                <p>* 파일 용량 1MB 이하</p>
                <p>* JPG만 업로드 가능</p>
                <label>팝콘 이미지: </label>
                <input type="file" name="file"><br><br>
            </c:if>

            <c:if test="${prodCategory == 2}">
                <input type="file" name="file" style="display: none;">
                <input type="hidden" name="workNo" value="">

                <label>작품 이름: </label><br>
                <select name="workSelect">
                    <option>작품 선택</option>
                    <c:set var="i" value="0"/>
                    <c:forEach var="work" items="${ workList }">
                        <c:set var="i" value="${i+1}"/>
                        <option value="${work.workNo}" name="workNo">
                                ${work.workName}
                                <input type="hidden" name="${work.workNo}" value="${work.fap}">
                        </option>
                    </c:forEach>
                </select><br><br>

                <label>저작권 가격: </label><br>
                <input type="number" min="0" value="100" name="prodPrice" required>
                <span class="free" style="display: none;">0</span> 개<br>
                <p class="freeCheck" style="color: red; display: none;">
                    무료인 작품의 저작권 가격은 팝콘 0개입니다.
                </p>
                <br>
            </c:if>

            <input type="submit" value="등록">
        </form>

    </body>
</html>