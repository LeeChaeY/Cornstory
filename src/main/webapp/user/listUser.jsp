<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>

<head>
    <meta charset="EUC-KR">
    <title>ȸ�� ��� ��ȸ</title>

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
                        $("#totalUsers").text("��ü ȸ�� ��: " + data.totalCount + " ��");
                    }
                });
            }

            $(document).ready(function () {
                updateTotalCount();
            });

            $("td.ct_btn01:contains('�˻�')").on("click", function () {
                fncGetUserList(1);
                updateTotalCount();
            });

            $(".ct_list_pop:nth-child(4n+6)").css("background-color", "whitesmoke");
        });
    </script>

</head>

<body bgcolor="#ffffff" text="#000000">
<h2>ȸ�� ��� ��ȸ</h2>
<div style="width:98%; margin-left:10px;">
    <table width="100%" border="0" cellspacing="0" cellpadding="0"   style="margin-top:10px;">
        <tr>
            <td align="right" id="totalUsers">
                ��ü ȸ�� ��: ${totalCount } ��
            </td>
        </tr>
    </table>
    <form name="detailForm">
        <table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
            <tr>
                <td class="ct_list_b" width="100">No</td>
                <td class="ct_line02"></td>
                <td class="ct_list_b" width="150">���̵�</td>
                <td class="ct_line02"></td>
                <td class="ct_list_b" width="150">�г���</td>
                <td class="ct_line02"></td>
                <td class="ct_list_b" width="150">����</td>
                <td class="ct_line02"></td>
                <td class="ct_list_b" width="150">�޴���ȭ</td>
                <td class="ct_line02"></td>
                <td class="ct_list_b">�̸���</td>
                <td class="ct_line02"></td>
                <td class="ct_list_b">ȸ�� ������</td>
                <td class="ct_line02"></td>
                <td class="ct_list_b">���� ����</td>
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
