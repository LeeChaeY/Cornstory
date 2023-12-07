<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>User 정보</title>
    <!-- jQuery 추가 -->
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <script>
        $(document).ready(function () {
            // "탈퇴하기" 링크 클릭 시 실행
            $("#withdrawLink").click(function () {
                var userId = "${sessionScope.user.userId}"; // 세션에서 현재 사용자의 아이디 가져오기

                // Ajax를 통한 서버 요청
                $.ajax({
                    type: "GET",
                    url: "json/deleteUser",
                    data: { userId: userId },
                    success: function (response) {
                        console.log(response); // 응답을 콘솔에 출력
                        if (response === "valid") {
                            alert("회원 탈퇴가 완료되었습니다.");
                            window.location.href = "../index.jsp";
                        } else {
                            alert("회원 탈퇴에 실패했습니다.");
                        }
                    },

                    error: function (xhr, status, error) {
                        console.log(xhr.status); // HTTP 응답 코드를 콘솔에 출력
                        alert("서버 오류가 발생했습니다.");
                    }

                });
            });
        });
    </script>
</head>
<body>

<c:if test="${user ne null}">
    <h2>User 정보</h2>
    <img src="<c:out value='${user.userImage}'/>" alt="User Image"><br>
    <strong>닉네임:</strong> <c:out value="${user.nickName}"/><br>
    <strong>아이디:</strong> <c:out value="${user.userId}"/><br>
    <strong>이름:</strong> <c:out value="${user.userName}"/><br>
    <strong>생년월일:</strong> <c:out value="${user.birthday}"/><br>
    <strong>이메일:</strong> <c:out value="${user.email}"/><br>
    <strong>주소:</strong> <c:out value="${user.addr}"/><br>
    <strong>상세주소:</strong> <c:out value="${user.address}"/><br>
    <strong>전화번호:</strong> <c:out value="${user.phone}"/><br>
    <strong>소셜 연동:</strong> <c:out value="${user.social}"/><br>
</c:if>
<br>
<a href="../index.jsp">확인</a>&nbsp;<br>
<a href="updateUser?userId=${sessionScope.user.userId}">수정 하러가기</a><br>
<!-- "탈퇴하기" 링크에 id 추가 -->
<a id="withdrawLink" href="#">탈퇴하기</a><br>

<!-- 탈퇴가 완료되면 표시할 메시지 -->
<c:if test="${param.deleted eq 'true'}">
    <p style="color: green;">회원 탈퇴가 완료되었습니다.</p>
</c:if>

</body>
</html>
