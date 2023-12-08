<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>updateProduct</title>

        <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
        <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

        <script type="text/css">
            a {
                text-decoration: none;
            }
        </script>

        <script type="text/javascript">

            $(function() {

                $("input[value='수정']").on("click", function(){
                    updateProduct();
                });

                $("span").on("click", function(){
                    fncGetProductList('1');
                });
            });

            function updateProduct() {
                $("form[name='updateProduct']").attr("method", "post").attr("action", "/product/updateProduct").submit();
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
            <input type="hidden" name="prodCategory" value="${product.prodCategory}">
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
            <h2>팝콘 정보 수정하기</h2>
        </c:if>
        <c:if test="${prodCategory == 2}">
            <h2>저작권 정보 수정하기</h2>
        </c:if>
        <form name="updateProduct" enctype="multipart/form-data">
            <input type="hidden" name="prodCategory" value="${product.prodCategory}">
            <input type="hidden" name="prodNo" value="${product.prodNo}">

            <c:if test="${product.prodCategory == 0}">
                <label>팝콘 수량: </label>
                <input type="number" min="1" value="${product.prodCnt}" name="prodCnt" required> 개
                <br><br>

                <label>팝콘 가격: </label><br>
                <input type="number" min="100" value="${product.prodPrice}" name="prodPrice" required> 원<br><br>

                <p>* 파일 용량 1MB 이하</p>
                <p>* JPG만 업로드 가능</p>
                <label>팝콘 이미지: </label>
                <img width="300px" height="300px" src="/file/product/${product.prodImage}"><br>
                <input type="file" name="file" value="${product.prodImage}"><br><br>
            </c:if>

            <c:if test="${product.prodCategory == 2}">
                <input type="file" name="file" style="display: none;">
                <input type="hidden" name="workNo" value="">

                <label>저작권 이름: </label><br>
                <div>${product.prodName}</div><br><br>

                <label>저작권 가격: </label><br>
                <input type="number" min="100" value="100" name="prodPrice" required> 개<br><br>
            </c:if>

            <input type="submit" value="수정">
        </form>

    </body>
</html>