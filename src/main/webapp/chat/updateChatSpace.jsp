<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>updateChatSpace</title>

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

                $("input[type='button'][value='채팅방 수정']").on("click", function () {
                    // form이 실제로 submit되는 것을 막음
                    event.preventDefault();

                    // $("form[name='updateForm']").attr("method", "POST").attr("enctype", "multipart/form-data").attr("action", "/chat/updateChatSpace");

                    // form 데이터를 가져오기 (만약 FormData 객체를 사용하려면 적절히 변경)
                    let formData = new FormData(this);

                    // 서버로 POST 요청 보내기
                    fetch(this.action, {
                        method: "post",
                        body: formData
                    })
                    .then(response => response.text())
                    .then(responseText => {
                        let popWin = window.open("/chat/enterChatSpace?chatSpaceNo="+"${chatSpace.chatSpaceNo}","popWin","scrollbars=yes");

                        $(self.location).attr("href", "/chat/listChatSpace");
                    })
                    .catch(error => {
                        console.error('Error:', error);
                    });

                    // $("form[name='updateForm']").attr("method", "POST").attr("enctype", "multipart/form-data").attr("action", "/chat/updateChatSpace").submit();
                    // popWin = window.open("/chat/enterChatSpace?chatSpaceNo="+chatSpaceNo,"popWin","scrollbars=yes");
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

        <h2>채팅방 수정</h2>
        <form name="updateForm" method="post" enctype="multipart/form-data" target="popWin">
            <input type="hidden" name="chatSpaceNo" value="${chatSpace.chatSpaceNo}">

            <label>개설자 닉네임: </label>
            <div>${sessionScope.user.nickName}</div><br><br>

            <label>제목: </label>
            <input type="text" name="cSpaceName" value="${chatSpace.cSpaceName}" maxlength="30" style="width: 400px" required><br><br>

            <label>장르:</label><br>
            <div>${chatSpace.genre}</div><br>

            <label>썸네일: </label>
            <div><img width="300px" height="300px" src="/file/chat/${chatSpace.cSpaceImage}"></div>
            <input type="file" name="file" value="${chatSpace.cSpaceImage}"><br><br>

            <input type="submit" value="채팅방 수정">
        </form>

    </body>
</html>