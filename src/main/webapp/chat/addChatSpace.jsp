<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>addChatSpace</title>

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
                    if (event.target.innerText === '채팅방 추가하기') {
                        $(self.location).attr("href", "/chat/addChatSpace");
                        return false;
                    }
                    fncGetChatList('1');
                });
            });


            function fncGetChatList(currentPage) {
                $("input[name='currentPage']").val(currentPage);

                let spanText = event.target.innerText;
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

        <form name="form">
            <input type="hidden" name="genre" value="">
            <input type="hidden" name="userId" value="">
            <input type="hidden" name="enterUserId" value="">
        </form>
        <table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
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
        </table>

        <h2>채팅방 만들기</h2>
        <form action="/chat/addChatSpace" method="post" enctype="multipart/form-data">
            <label>개설자 닉네임: </label>
            ${sessionScope.user.nickName} <br><br>

            <label>제목: </label>
            <input type="text" name="cSpaceName" maxlength="30" style="width: 400px" required><br><br>

            <label>장르: </label><br>
                <label>
                    <input type="radio" name="genre" value="학원" required>
                    학원
                </label>
                <label>
                    <input type="radio" name="genre" value="액션">
                    액션
                </label>
                <label>
                    <input type="radio" name="genre" value="SF">
                    SF
                </label>
                <label>
                    <input type="radio" name="genre" value="판타지">
                    판타지
                </label>
                <label>
                    <input type="radio" name="genre" value="개그">
                    개그
                </label>
                <label>
                    <input type="radio" name="genre" value="로맨스">
                    로맨스
                </label>
                <label>
                    <input type="radio" name="genre" value="스포츠">
                    스포츠
                </label>
                <label>
                    <input type="radio" name="genre" value="일상">
                    일상
                </label>
                <label>
                    <input type="radio" name="genre" value="추리">
                    추리
                </label>
                <label>
                    <input type="radio" name="genre" value="스릴러">
                    스릴러
                </label>
                <label>
                    <input type="radio" name="genre" value="무협">
                    무협
                </label>
                <label>
                    <input type="radio" name="genre" value="기타">
                    기타
                </label>
            <br><br>

            <label>썸네일: </label>
            <input type="file" name="file"><br><br>

            <input type="submit" value="채팅방 만들기">
        </form>

    </body>
</html>