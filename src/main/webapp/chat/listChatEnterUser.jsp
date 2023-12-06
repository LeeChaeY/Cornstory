<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>listChatEnterUser</title>
    </head>
    <body>

        <table width="100%" height="37" border="0" cellpadding="0"	cellspacing="0">
            <tr>
                <td width="15" height="37">
                    <img src="/images/ct_ttl_img01.gif" width="15" height="37"/>
                </td>
                <td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left:10px;">
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                            <td width="93%" class="ct_ttl01">
                                채팅방 회원 목록
                            </td>
                        </tr>
                    </table>
                </td>
                <td width="12" height="37">
                    <img src="/images/ct_ttl_img03.gif" width="12" height="37"/>
                </td>
            </tr>
        </table>

        <h2>채팅방 회원 목록</h2>


            <table width="90%">
                <tr height="30px">
                    <td colspan="11" >
                        전체  ${ resultPage.totalCount } 건수,	현재 ${ resultPage.currentPage } 페이지
                    </td>
                </tr>
                <tr>
                    <td class="ct_list_b" align="center" width="20">No</td>
                    <td class="ct_line02"></td>
                    <td class="ct_list_b" align="center" width="150">회원 아이디</td>
                    <td class="ct_line02"></td>
                    <td class="ct_list_b" align="center" width="100">회원 닉네임</td>
                    <td class="ct_line02"></td>
                    <td class="ct_list_b" align="center" width="50">회원 사진</td>
                    <td class="ct_line02"></td>
                    <td class="ct_list_b" align="center" width="50">회원 입장시간</td>
                </tr>
                <tr>
                    <td colspan="11" bgcolor="808285" height="1" width="90%"></td>
                </tr>

                <c:set var="i" value="0"/>
                <c:forEach var="chatSpace" items="${ list }">
                    <c:set var="i" value="${i+1}"/>
                    <tr class="ct_list_pop">
                        <td align="center">${ i }</td>
                        <td></td>
                        <td align="center">${chatSpace.userId}</td>
                        <td></td>
                        <td align="center">${chatSpace.nickname}</td>
                        <td></td>
                        <td align="center"><img src="/file/chat/${chatSpace.userImage}"></td>
                        <td></td>
                        <td align="center">${chatSpace.chatEnterDate}</td>
                    </tr>
                    <tr>
                        <td colspan="11" bgcolor="D6D7D6" height="1"></td>
                    </tr>
                </c:forEach>
        </table>
    </body>
</html>