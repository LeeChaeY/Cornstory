<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>

<head>
    <meta charset="EUC-KR">
    <title>회원 목록 조회</title>

    <link rel="stylesheet" href="/css/admin.css" type="text/css">
    <link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
    <link rel="stylesheet" href="/resources/demos/style.css">
    <script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>

    <script type="text/javascript">
        $(function () {
            $("#searchInput").autocomplete({
                source: function (request, response) {
                    $.ajax({
                        url: "/user/json/listUser",
                        method: "POST",
                        dataType: "json",
                        data: { value: request.term },
                        headers: {
                            "Accept": "application/json",
                            "Content-Type": "application/json"
                        },
                        success: function (data) {
                            var userList = data;
                            var result = userList.map(function (user) {
                                return {
                                    label: user,
                                    value: user
                                };
                            });
                            response(results);
                        }
                    });
                },
                minLength: 2,
            });

            function updateTotalCount() {
                $.ajax({
                    url: "/user/json/getTotalCount",
                    method: "GET",
                    dataType: "json",
                    success: function (data) {
                        $("#totalUsers").text("전체 회원 수: " + data.totalCount + " 명");
                    }
                });
            }

            $(document).ready(function () {
                updateTotalCount();
            });

            $("td.ct_btn01:contains('검색')").on("click", function () {
                fncGetUserList(1);
                updateTotalCount();
            });

            $(".ct_list_pop:nth-child(4n+6)").css("background-color", "whitesmoke");
        });
    </script>

</head>

<body bgcolor="#ffffff" text="#000000">
<h2>회원 목록 조회</h2>
<div style="width:98%; margin-left:10px;">
    <table width="100%" border="0" cellspacing="0" cellpadding="0"   style="margin-top:10px;">
        <tr>
            <td align="right" id="totalUsers">
                전체 회원 수: ${totalCount } 명
            </td>
        </tr>
    </table>
    <form name="detailForm">
        <table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
            <tr>
                <td class="ct_list_b" width="100">No</td>
                <td class="ct_line02"></td>
                <td class="ct_list_b" width="150">아이디</td>
                <td class="ct_line02"></td>
                <td class="ct_list_b" width="150">닉네임</td>
                <td class="ct_line02"></td>
                <td class="ct_list_b" width="150">성명</td>
                <td class="ct_line02"></td>
                <td class="ct_list_b" width="150">휴대전화</td>
                <td class="ct_line02"></td>
                <td class="ct_list_b">이메일</td>
                <td class="ct_line02"></td>
                <td class="ct_list_b">회원 가입일</td>
                <td class="ct_line02"></td>
                <td class="ct_list_b">정지 일자</td>
            </tr>
            <tr>
                <td colspan="7" bgcolor="808285" height="1"></td>
            </tr>

            <c:set var="i" value="0" />
            <c:forEach var="user" items="${list}">
                <c:set var="i" value="${ i+1 }" />
                <tr class="ct_list_pop">
                    <td align="center">${ i }</td>
                    <td></td>
                    <td align="left">${user.userId}</td>
                    <td></td>
                    <td align="left">${user.nickName}</td>
                    <td></td>
                    <td align="left">${user.userName}</td>
                    <td></td>
                    <td align="left">${user.phone}</td>
                    <td></td>
                    <td align="left">${user.email}</td>
                    <td></td>
                    <td align="left">${user.rDate}</td>
                    <td></td>
                    <td align="left">${user.banDate}</td>
                </tr>
            </c:forEach>
        </table>
    </form>
</div>
</body>

</html>
