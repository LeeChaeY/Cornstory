<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>listChatSpace</title>
        <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
        <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

        <style type="text/css">
            a {
                text-decoration: none;
                color: #111111;
                cursor: default;
            }
        </style>

        <script type="text/javascript">

            $(function() {
                $("span").click(function(){
                    if (event.target.innerText === '채팅방 추가하기') {
                        $(self.location).attr("href", "/chat/addChatSpace");
                        return false;
                    }
                    fncGetChatList('1');
                });

                $("input[type='button'][value='입장하기']").on("click", function (${chatSpace.chatSpcaeNo}) {
                    //enterChatSpace(${chatSpace.chatSpaceNo});
                });

                $("input[type='button'][value='삭제하기']").on("click", function (${chatSpace.chatSpaceNo}) {
                    // deleteChatSpace(chatSpaceNo);
                });

                $("input[type='button'][value='나가기']").on("click", function (chatSpaceNo) {
                    // deleteChatEnter(chatSpaceNo);
                });
            });


            function fncGetChatList(currentPage){
                let genreList = ["학원", "액션", "SF", "판타지", "개그", "로맨스", "스포츠",
                    "일상", "추리", "스릴러", "무협", "기타"];

                $("input[name='currentPage']").val(currentPage);

                let spanText = event.target.innerText;

                if (genreList.indexOf(spanText) !== -1) $("input[name='genre']").val(spanText);
                else if (spanText === "전체" || spanText === "채팅방 목록") {
                    $("input[name='genre']").val("");
                    $("input[name='searchKeyword']").val("");
                }
                else $("input[name='genre']").val("");


                if (spanText === "개설한 채팅방") {
                    $("input[name='userId']").val("${sessionScope.user.userId}");
                    $("form[name='form']").attr("method", "post").attr("action", "/chat/listChatSpace").submit();
                }
                else if (spanText === "입장한 채팅방") {
                    $("input[name='enterUserId']").val("${sessionScope.user.userId}");
                    $("form[name='form']").attr("method", "post").attr("action", "/chat/listChatSpace").submit();
                }
                else {
                    $("input[name='userId']").val("");
                    $("input[name='enterUserId']").val("");
                    $("form[name='form']").attr("method", "post").attr("action", "/chat/listChatSpace").submit();
                }
            }

            function enterChatSpace(chatSpaceNo) {
                // $(self.location).attr("href", "/chat/enterChatSpace?chatSpaceNo="+chatSpaceNo);
                popWin = window.open("/chat/enterChatSpace?chatSpaceNo="+chatSpaceNo,"popWin","scrollbars=yes");
            }

            function updateChatSpace(chatSpaceNo) {

                $(self.location).attr("href", "/chat/updateChatSpace?chatSpaceNo="+chatSpaceNo);
            }

            function deleteChatSpace(chatSpaceNo) {
                $.ajax(
                    {
                        url : "/chat/json/deleteChatSpace/"+chatSpaceNo+"",
                        method : "GET",
                        success : function(JSONData , status) {
                            $("input[value='"+chatSpaceNo+"']").parents("tr").children("td").remove();
                        },
                        error : function(status) {

                            //Debug...
                            alert("error");
                        }
                    });
            }

            function deleteChatEnter(chatSpaceNo) {
                $.ajax(
                    {
                        url : "/chat/json/deleteChatEnter?chatSpaceNo="+chatSpaceNo,
                        method : "GET",
                        dataType : "text",
                        data : {},
                        success : function(returnMessage, status) {
                            // alert(returnMessage);
                            let cnt = $("input[value='"+chatSpaceNo+"']").parents("tr").children("td").eq(10).text() - 1;
                            $("input[value='"+chatSpaceNo+"']").parents("tr").children("td").eq(10).text(cnt);
                            $("input[value='"+chatSpaceNo+"']").parents("tr").children("td").eq(14).children("input").eq(1).remove();
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
        <form action="/chat/listChatSpace" name="form">
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
                                채팅방 목록
                            </td>
                        </tr>
                    </table>
                </td>
                <td height="37">
                    <img src="" width="12" height="37"/>
                </td>
            </tr>
        </table>


        <table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
            <input type="hidden" name="genre" value="">
            <input type="hidden" name="userId" value="">
            <input type="hidden" name="enterUserId" value="">
            <tr>
                <td>
                    <div align="center">
                        <strong><span>채팅방 목록</span></strong> |
                        <span><strong>개설한 채팅방</strong></span> |
                        <span><strong>입장한 채팅방</strong></span> |
                        <a href="#"><span><strong>채팅방 추가하기</strong></span></a>
                    </div>
                    <br>
                </td>
            </tr>
            <tr>
                <td colspan="11" height="1"></td>
            </tr>
            <tr><td><div class="genre"><br>
                <span>전체</span> |
                <span>학원</span> |
                <span>액션</span> |
                <span>SF</span> |
                <span>판타지</span> |
                <span>개그</span> |
                <span>로맨스</span> |
                <span>스포츠</span> |
                <span>일상</span> |
                <span>추리</span> |
                <span>스릴러</span> |
                <span>무협</span> |
                <span>기타</span>
            </div></td></tr>
            <tr>
                <td align="right">
                    <select name="searchCondition" class="ct_input_g" style="width:100px">
                        <option value="1"
                        ${!empty search.searchCondition && search.searchCondition.equals("1") ? "selected" : ""}>
                            채팅방 이름
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
                                onClick="fncGetChatList('1');">
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
                    전체  ${ resultPage.totalCount } 건수,	현재 ${ resultPage.currentPage } 페이지
                </td>
            </tr>
            <tr>
                <td class="ct_list_b" align="center" width="20">No</td>
                <td class="ct_line02"></td>
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
                <td class="ct_list_b" align="center" width="100"></td>
            </tr>
            <tr>
                <td colspan="11" bgcolor="808285" height="1" width="90%"></td>
            </tr>

            <c:set var="i" value="0"/>
            <c:forEach var="chatSpace" items="${ list }">
                <c:set var="i" value="${i+1}"/>
                <tr class="ct_list_pop">
                    <td align="center"><input type="hidden" name="chatSpaceNo" value="${chatSpace.chatSpaceNo}">${ i }</td>
                    <td></td>
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
                    <td align="center">
                        <input type="button" value="입장하기" onclick="enterChatSpace(${chatSpace.chatSpaceNo});"><br>
                        <c:if test="${chatSpace.userId != sessionScope.user.userId && chatSpace.chatEnterCheck == 1}">
                            <input type="button" value="나가기" onClick="deleteChatEnter(${chatSpace.chatSpaceNo});">
                        </c:if>
                        <c:if test="${chatSpace.userId == sessionScope.user.userId}">
                            <input type="button" value="수정하기" onclick="updateChatSpace(${chatSpace.chatSpaceNo});"><br>
                            <input type="button" value="삭제하기" onclick="deleteChatSpace(${chatSpace.chatSpaceNo});"><br>
                        </c:if>
                    </td>
                </tr>
                <tr>
                    <td colspan="11" height="1"></td>
                </tr>
            </c:forEach>
        </table>

        </form>

    </body>
</html>