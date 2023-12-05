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

        <script type="text/javascript">

            $(function() {
                $("span").click(function(){
                    fncGetChatList('1');
                });

                $("input[type='button'][value='입장하기']").on("click", function () {
                    $("form[name='enterChatSpace']").attr("method", "post").attr("action", "/chat/enterChatSpace").submit();
                });
            });


            function fncGetChatList(currentPage){
                let genreList = ["학원", "액션", "SF", "판타지", "개그", "로맨스", "스포츠",
                    "일상", "추리", "스릴러", "무협", "기타"];

                $("input[name='currentPage']").val(currentPage);

                if (genreList.indexOf(event.target.innerText) !== -1) $("input[name='genre']").val(event.target.innerText);
                else if (event.target.innerText === "전체") {
                    $("input[name='genre']").val("");
                    $("input[name='searchKeyword']").val("");
                }
                else $("input[name='genre']").val("");

                $("form[name='form']").attr("method", "post").attr("action", "/chat/listChatSpace").submit();
            }

            function deleteChatSpace(chatSpaceNo) {
                alert(chatSpaceNo);
                $.ajax(
                    {
                        url : "/chat/json/deleteChatSpace/"+chatSpaceNo+"",
                        method : "GET",
                        success : function(JSONData , status) {
                            alert(JSONData);
                        },
                        error : function(status) {

                            //Debug...
                            alert("error");
                        }
                    });
            }

            function deleteChatEnter(chatSpaceNo) {
                alert(chatSpaceNo);
                <%--"${user.userId}"--%>
                $.ajax(
                    {
                        url : "/chat/json/deleteChatEnter?userId=user002&chatSpaceNo="+chatSpaceNo,
                        method : "GET",
                        dataType : "text" ,
                        data : {},
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
        <form action="/chat/listChatSpace" name="form">
        <table width="100%" height="37" border="0" cellpadding="0"	cellspacing="0">
            <tr>
                <td width="15" height="37">
                    <img src="/images/ct_ttl_img01.gif" width="15" height="37"/>
                </td>
                <td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left:10px;">
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                            <td width="93%" class="ct_ttl01">
                                채팅방 목록
                            </td>
                        </tr>
                    </table>
                </td>
                <td width="12" height="37">
                    <img src="/images/ct_ttl_img03.gif" width="12" height="37"/>
                </td>
            </tr>
        </table>


        <table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
            <input type="hidden" name="genre" value="">
            <tr><td><div>
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
                                <img src="/images/ct_btnbg01.gif" width="17" height="23">
                            </td>
                            <td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top:3px;"
                                onClick="fncGetChatList('1');">
                                검색
                            </td>
                            <td width="14" height="23">
                                <img src="/images/ct_btnbg03.gif" width="14" height="23">
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
                    <td align="center">${ i }</td>
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
                    <td align="center"><input type="button" value="삭제하기" onClick="deleteChatSpace(${chatSpace.chatSpaceNo});"><br>
                                        <input type="button" value="입장하기"><br>
                                        <input type="button" value="나가기" onClick="deleteChatEnter(${chatSpace.chatSpaceNo});"></td>
                    <form name="enterChatSpace">
                        <input type="hidden" name="userId" value="user002">
                        <input type="hidden" name="chatSpaceNo" value="${chatSpace.chatSpaceNo}">
                    </form>
                </tr>
                <tr>
                    <td colspan="11" bgcolor="D6D7D6" height="1"></td>
                </tr>
            </c:forEach>
        </table>

        </form>

    </body>
</html>