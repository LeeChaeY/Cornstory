<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>enterChatSpace</title>

        <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
        <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

<%--        https://velog.io/@bami/%EC%8A%AC%EB%9D%BC%EC%9D%B4%EB%93%9C-%EB%A9%94%EB%89%B4--%>
<%--        https://muzi-muzi.tistory.com/10--%>
        <style type="text/css">
            body{
                position: relative;
                overflow-x: hidden;
            }

            #closeSlideMenu {
                padding-top: 1.2rem;
                padding-left: 1.2rem;
                cursor: pointer;
            }

            #slideMenu {
                width: 40%;
                height: 80%;
                position: absolute;
                right: -100%;
                top: 0;
                background-color: #808080;
                cursor: default;
                z-index: 1;

                -webkit-transition: right .3s;
                -moz-transition: right .3s;
                -ms-transition: right .3s;
                -o-transition: right .3s;
                transition: right .3s;
            }

            #slideMenu table tr {
                text-align: center;
            }

            #slideMenu.on {
                right: 0;
            }
        </style>

        <script type="text/javascript">

            $(function() {
                $("input[type='submit'][value='전송']").on("click", function () {
                    addChat();
                });
                $("textarea[name='chatContent']").on("keyPress", function () {
                    if (e.keyCode && e.keyCode === 13) addChat();
                });
                $("input[type='button'][value='인원보기']").on("click", function () {
                    $("#slideMenu").addClass('on');     //슬라이드 메뉴 감춤
                    <%--$(self.location).attr("href", "/chat/listChatEnterUser?chatSpaceNo="+${chatSpace.chatSpaceNo});--%>
                });
                $("#closeSlideMenu").on("click", function () {
                    $("#slideMenu").removeClass('on');     //슬라이드 메뉴 감춤
                });

            });


            function addChat() {
                let chatSpaceNo = $("input[name='chatSpaceNo']").val();
                let chatContent = $("textarea[name='chatContent']").val();

                $.ajax(
                    {
                        url : "/chat/json/addChat",
                        method : "POST",
                        dataType : "json" ,
                        data : JSON.stringify(
                                    {"chatSpaceNo":chatSpaceNo, "chatContent": chatContent}),
                        contentType: "application/json; charset=utf-8",
                        headers : {
                            "Accept" : "application/json",
                            "Content-Type" : "application/json"
                        },
                        success : function(JSONData, status) {

                            let chat = "<div align='right'> <p class='ct_list_pop' align='left' " +
                                "style='min-height: 100px; width: 40%; background-color: lightgray; padding : 5px; position: relative;'>" +
                                "<span style='display: block; padding-bottom: 10px'>" +
                                "<img src='/file/user/"+JSONData.userImage+"'> "+JSONData.nickname+"</span>" +
                                JSONData.chatContent +
                                "<span style='display: block; padding: 5px; position: absolute; bottom: 0; right: 0;'>" +
                                JSONData.chatDate + "</span></p></div>";

                            $(".chatList").append(chat);
                            $("textarea[name='chatContent']").val("");
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
                            <td class="ct_ttl01">
                                <a href="/"><h2>메인</h2></a>
                            </td>
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

        <table width="90%" style="margin: 10px">
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
                <td class="ct_line02"></td>
                <td class="ct_list_b" align="center" width="50"></td>
            </tr>
            <tr>
                <td colspan="11" bgcolor="808285" height="1" width="90%"></td>
            </tr>

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
                <td></td>
                <td align="center"><input type="button" id="slide-open" value="인원보기"></td>
            </tr>
            <tr>
                <td colspan="11" bgcolor="D6D7D6" height="1"></td>
            </tr>
        </table>

        <div id="slideMenu" class="slide">
            <div id='closeSlideMenu'>닫기</div><br><br>
            <div>전체  ${ totalCount } 명</div>
            <table>
                <tr>
                    <td width="50">No</td>
                    <td width="100">회원 사진</td>
                    <td width="200">회원 닉네임</td>
                    <td width="150">회원 입장시간</td>
                </tr>
                <c:set var="j" value="0"/>
                <c:forEach var="chatSpace" items="${ userList }">
                <c:set var="j" value="${j+1}"/>
                    <tr>
                        <td>${j}</td>
                        <td><img src="/file/chat/${chatSpace.userImage}"></td>
                        <td>${chatSpace.nickname} <c:if test="${j == 1}"><개설자></c:if></td>
                        <td>${chatSpace.chatEnterDate}</td>
                    </tr>
                </c:forEach>
            </table>
        </div>


        <br><br><br>


        <div width="90%" style="margin: 10px" class="chatList">
            <c:set var="i" value="0"/>
            <c:forEach var="chat" items="${ list }">
                <c:set var="i" value="${i+1}"/>
                <div align="right">
                    <p class="ct_list_pop" align="left" style="min-height: 100px; width: 40%;
                        background-color: lightgray; padding : 5px; position: relative;">
                        <span style="display: block; padding-bottom: 10px">
                                <img src="/file/user/${chat.userImage}"> ${chat.nickname}</span>
                        ${chat.chatContent}
                        <span style="display: block; padding: 5px; position: absolute; bottom: 0; right: 0;">
                                ${chat.chatDate}</span>
                    </p>
                </div>
            </c:forEach>
        </div>

        <div align="right" style="margin: 10px">
            <input type="hidden" name="chatSpaceNo" value="${chatSpace.chatSpaceNo}">

            <textarea name="chatContent" cols="50" rows="10"></textarea>
            <input type="submit" value="전송">
        </div>
    </body>
</html>