<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>enterChatSpace</title>

        <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
        <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

        <script type="text/javascript">

            $(function() {
                $("input[type='submit'][value='전송']").on("click", function () {
                    addChat();
                });
            });


            function addChat() {
                let userId = $("input[name='userId']").val();
                let chatSpaceNo = $("input[name='chatSpaceNo']").val();
                let chatContent = $("textarea[name='chatContent']").val();

                $.ajax(
                    {
                        url : "/chat/json/addChat",
                        method : "POST",
                        dataType : "json" ,
                        data : JSON.stringify(
                                    {"chat": {"chatSpaceNo":chatSpaceNo,
                                            "userId": userId, "chatContent": chatContent}}),
                        contentType: "application/json; charset=utf-8",
                        headers : {
                            "Accept" : "application/json",
                            "Content-Type" : "application/json"
                        },
                        success : function(returnMessage, status) {
                            alert(returnMessage);
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

        <table width="100%" height="37" border="0" cellpadding="0"	cellspacing="0">
            <tr>
                <td width="15" height="37">
                    <img src="/images/ct_ttl_img01.gif" width="15" height="37"/>
                </td>
                <td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left:10px;">
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                            <td width="93%" class="ct_ttl01">
                                채팅방
                            </td>
                        </tr>
                    </table>
                </td>
                <td width="12" height="37">
                    <img src="/images/ct_ttl_img03.gif" width="12" height="37"/>
                </td>
            </tr>
        </table>

        <table width="90%">
            <tr>
                <td class="ct_list_b" align="center" width="150">채팅방 이미지</td>
                <td class="ct_line02"></td>
                <td class="ct_list_b" align="center" width="100">채팅방 제목</td>
                <td class="ct_line02"></td>
                <td class="ct_list_b" align="center" width="50">채팅방 개설일</td>
                <td class="ct_line02"></td>
                <td class="ct_list_b" align="center" width="50">채팅방 개설자</td>
                <td class="ct_line02"></td>
                <td class="ct_list_b" align="center" width="50">채팅방 인원수</td>
                <td class="ct_line02"></td>
                <td class="ct_list_b" align="center" width="50">장르</td>
            </tr>
            <tr>
                <td colspan="11" bgcolor="808285" height="1" width="90%"></td>
            </tr>

            <c:set var="i" value="0"/>
            <c:forEach var="chatSpace" items="${ list }">
                <c:set var="i" value="${i+1}"/>
                <tr class="ct_list_pop">
                    <td align="center"><img width="300px" height="300px" src="/file/chat/${chatSpace.cSpaceImage}"></td>
                    <td></td>
                    <td align="center">${chatSpace.cSpaceName}</td>
                    <td></td>
                    <td align="center">${chatSpace.cSpaceDate}</td>
                    <td></td>
                    <td align="center"><img src="/file/chat/${chatSpace.userImage}">  ${chatSpace.nickname}</td>
                    <td></td>
                    <td align="center">${chatSpace.cSpaceUserCnt}</td>
                    <td></td>
                    <td align="center">${chatSpace.genre}</td>
                </tr>
                <tr>
                    <td colspan="11" bgcolor="D6D7D6" height="1"></td>
                </tr>
            </c:forEach>
        </table>


        <br><br><br>
        <input type="hidden" name="userId" value="user001">
        <input type="hidden" name="chatSpaceNo" value="${chatSpace.chatSpaceNo}">

        <textarea name="chatContent" cols="50" rows="10"></textarea>
        <input type="submit" value="전송">
    </body>
</html>