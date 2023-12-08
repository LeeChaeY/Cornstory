<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>listStore</title>

        <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
        <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

        <script type="text/css">
            a {
                text-decoration: none;
            }
        </script>

        <script type="text/javascript">

            $(function() {

                $("span").click(function(){
                    fncGetProductList('1');
                });

                $("input[name='tranCnt']").on("change", function(){
                    if ($(this).val() < 1) {
                        $(this).val(1);
                    }
                });
            });


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
                else if (spanText === "검색") {
                    <%--$("input[name='userId']").val("${sessionScope.user.userId}");--%>
                    $("form[name='form']").attr("method", "post").attr("action", "/product/listProduct").submit();
                }
            }

            function addPurchase(prodNo) {
                let tranCnt = $("input[name='tranCnt']").val();
                $(self.location).attr("href", "/purchase/addPurchase?prodNo=" + prodNo + "&tranCnt=" + tranCnt);
            }

            function viewWork(workNo) {
                $(self.location).attr("href", "/work/getDetailWork?workNo=" + workNo);
            }

            function updateProduct(prodNo) {
                $(self.location).attr("href", "/product/updateProduct?prodNo=" + prodNo);
            }

            function deleteProduct(prodNo) {
                $.ajax(
                    {
                        url : "/product/json/deleteProduct?prodNo="+prodNo,
                        method : "GET",
                        dataType : "text",
                        data : {},
                        success : function(returnMessage, status) {
                            // alert(returnMessage);
                            $("input[value='"+prodNo+"']").parents("tr").children("td").remove();
                        },
                        error : function(status) {

                            //Debug...
                            alert("error");
                        }
                    });
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
            <input type="hidden" name="prodCategory" value="">
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

        <table width="90%">
            <tr height="30px">
                <td colspan="11" >
                    <h3>팝콘</h3> 전체 ${totalCountPopcorn} 개
                </td>
            </tr>
            <tr>
                <td colspan="11" bgcolor="808285" height="1" width="90%"></td>
            </tr>

            <tr>
                <td class="ct_list_b" align="center" width="20">No</td>
                <td class="ct_line02"></td>
                <td class="ct_list_b" align="center" width="150">팝콘 이미지</td>
                <td class="ct_line02"></td>
                <td class="ct_list_b" align="center" width="100">팝콘 이름</td>
                <td class="ct_line02"></td>
                <td class="ct_list_b" align="center" width="50">팝콘 가격</td>
                <td class="ct_line02"></td>
                <td class="ct_list_b" align="center" width="50">팝콘 개수</td>
                <td class="ct_line02"></td>
                <td class="ct_list_b" align="center" width="50">팝콘 등록일</td>
                <td class="ct_line02"></td>
                <td class="ct_list_b" align="center" width="250"></td>
            </tr>
            <tr>
                <td colspan="11" bgcolor="808285" height="1" width="90%"></td>
            </tr>

            <c:set var="i" value="0"/>
            <c:forEach var="popcorn" items="${ popcornList }">
                <c:set var="i" value="${i+1}"/>
                <tr class="ct_list_pop" style="height: 30px;">
                    <td align="center"><input type="hidden" name="prodNo" value="${popcorn.prodNo}">${ i }</td>
                    <td></td>
                    <td align="center"><img width="30px" height="30px" src="/file/product/${popcorn.prodImage}"></td>
                    <td></td>
                    <td align="center">${popcorn.prodName}</td>
                    <td></td>
                    <td align="center">${popcorn.prodPrice}</td>
                    <td></td>
                    <td align="center">${popcorn.prodCnt}</td>
                    <td></td>
                    <td align="center">${popcorn.prodDate}</td>
                    <td></td>
                    <td align="center">
                        <c:if test="${sessionScope.user.role == 0}">
                            <input type="number" min="1" value="1" name="tranCnt" style="width: 50px;"> 개
                            <input type="button" value="충전하기" onClick="addPurchase(${popcorn.prodNo});">
                        </c:if>
                        <c:if test="${sessionScope.user.role == 1}">
                            <input type="button" value="수정하기" onclick="updateProduct(${popcorn.prodNo});"><br>
                            <input type="button" value="삭제하기" onclick="deleteProduct(${popcorn.prodNo});"><br>
                        </c:if>
                    </td>
                </tr>
                <tr>
                    <td colspan="11" height="1"></td>
                </tr>
            </c:forEach>
        </table>




        <hr width="5">

        <table width="90%">
            <tr height="30px">
                <td colspan="11" >
                    <h3>저작권</h3> 전체 ${totalCountCopyright} 개
                </td>
            </tr>
            <tr>
                <td colspan="11" bgcolor="808285" height="1" width="90%"></td>
            </tr>

            <tr>
                <td class="ct_list_b" align="center" width="20">No</td>
                <td class="ct_line02"></td>
                <td class="ct_list_b" align="center" width="150">저작권 이미지</td>
                <td class="ct_line02"></td>
                <td class="ct_list_b" align="center" width="100">저작권 이름</td>
                <td class="ct_line02"></td>
                <td class="ct_list_b" align="center" width="100">작품명</td>
                <td class="ct_line02"></td>
                <td class="ct_list_b" align="center" width="50">저작권 가격</td>
                <td class="ct_line02"></td>
                <td class="ct_list_b" align="center" width="50">완결 회차</td>
                <td class="ct_line02"></td>
                <td class="ct_list_b" align="center" width="200">등록일</td>
                <td class="ct_line02"></td>
                <td class="ct_list_b" align="center" width="200">작가명</td>
                <td class="ct_line02"></td>
                <td class="ct_list_b" align="center" width="100"></td>
                <td class="ct_line02"></td>
                <td class="ct_list_b" align="center" width="100"></td>
            </tr>
            <tr>
                <td colspan="11" bgcolor="808285" height="1" width="90%"></td>
            </tr>
            
            <c:set var="i" value="0"/>
            <c:forEach var="copyright" items="${ copyrightList }">
                <c:set var="i" value="${i+1}"/>
                <tr class="ct_list_pop">
                    <td align="center"><input type="hidden" name="prodNo" value="${copyright.prodNo}">${ i }</td>
                    <td></td>
                    <td align="center"><img width="300px" height="300px" src="/file/work/${copyright.prodImage}"></td>
                    <td></td>
                    <td align="center">${copyright.prodName}</td>
                    <td></td>
                    <td align="center">${copyright.workName}</td>
                    <td></td>
                    <td align="center">${popcorn.prodPrice}</td>
                    <td></td>
                    <td align="center">${popcorn.episodeOrder}</td>
                    <td></td>
                    <td align="center">${popcorn.prodDate}</td>
                    <td></td>
                    <td align="center">${popcorn.nickname}</td>
                    <td></td>
                    <td align="center">
                        <input type="button" name="viewWork" value="작품 보러가기">
                    </td>
                    <td></td>
                    <td align="center">
                        <c:if test="${sessionScope.user.role == 0}">
                            <input type="button" value="구매하기" onClick="addPurchase(${copyright.prodNo});">
                        </c:if>
                        <c:if test="${sessionScope.user.role == 1}">
                            <input type="button" value="수정하기" onclick="updateProduct(${copyright.prodNo});"><br>
                            <input type="button" value="삭제하기" onclick="deleteProduct(${copyright.prodNo});"><br>
                        </c:if>
                    </td>
                </tr>
                <tr>
                    <td colspan="11" height="1"></td>
                </tr>
            </c:forEach>
        </table>


    </body>
</html>