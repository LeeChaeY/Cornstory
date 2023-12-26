<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>회원 가입</title>
    <link rel="stylesheet" href="../user/css/setting.css">
    <link rel="stylesheet" href="../user/css/plugin.css">
    <link rel="stylesheet" href="../user/css/template.css">
    <link rel="stylesheet" href="../user/css/common.css">
    <link rel="stylesheet" href="../user/css/style.css">
    <link rel="stylesheet" href="common/css/drag.css">
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

</head>
<body>
<%@ include file="../layout/top.jsp" %>
<!-- [E]thwhole-vdlqGbmgl8 -->
<main class="th-layout-main ">
    <!-- [S]thpart-HmlqLtFlNZ -->
    <div class="thpart-HmlqLtFlNZ" data-bid="HmlqLtFlNZ" id="">
        <div class="contents-container">
            <img class="contents-backimg" src="https://images.unsplash.com/photo-1532276269954-64188308dcb3?crop=entropy&amp;cs=tinysrgb&amp;fit=max&amp;fm=jpg&amp;ixid=M3w0OTE2MDd8MHwxfHNlYXJjaHw0fHwlRUIlQTElOUMlRUElQjclQjglRUMlOUQlQjh8a298MHx8fGJsYWNrfDE3MDM1NjQ1NDB8MA&amp;ixlib=rb-4.0.3&amp;q=80&amp;w=1080" alt="">
            <div class="contents-body container-md">
                <h2 class="contents-title">
                </h2>
                <h2 class="contents-title" style="font-family: var(--ff-ko2);">UserPage</h2>
                <h7 class="contents-sub" contenteditable="true">회원</h7>
            </div>
        </div>
    </div>
    <!-- [E]thpart-HmlqLtFlNZ -->
<form action="../user/addUser" method="post" enctype="multipart/form-data" >
    <!-- [S]hooms-N53 -->
    <div class="hooms-N53" data-bid="lYlQluvFkB">
        <div class="contents-inner">
            <div class="contents-container">
                <div class="textset textset-h2">
                    <h2 class="textset-tit">회원가입</h2>
                </div>
                <div class="contents-form">
                    <div class="contents-form-top">
                    </div>
                    <label class="labelset">
                        <strong class="labelset-vital">
                            <span>*</span>필수입력 </strong>
                    </label>
                    <div class="contents-form-bottom">
                        <!--로그인-->
                        <div class="inputset inputset-lg inputset-label" >
                            <label for="userId">
                                <h6 class="inputset-tit" > 아이디<span>*</span></h6>
                                <input type="text" class="inputset-input form-control" placeholder="사용하실 아이디를 입력해 주세요."  id="userId" name="userId"
                                       pattern="[a-zA-Z0-9]+" maxlength="8" title="영문 또는 숫자만 입력 가능"
                                       oninput="updateCharCount('userId', 'userIdLength')" minlength="4" value="${kakaoUserInfo.id}" required>
                            </label>
                            <span class="checkset-text" id="userIdLength">0/8</span>
                        </div>
                        <span class="check-text">영문 숫자를 등록 가능하여 최소 4자 최대 8자 등록 가능합니다.</span>
                        <span class="check-text" id="userIdMessage" style="padding: 10px;"></span>

                        <!--비밀번호-->
                        <div class="inputset inputset-lg inputset-label">
                            <label  for="password">
                                <h6 class="inputset-tit"> 비밀번호<span>*</span>
                                </h6>
                                <input type="password" class="inputset-input form-control" placeholder="사용하실 비밀번호를 입력해 주세요." id="password" name="password"
                                       pattern="^(?=.*[A-Za-z])(?=.*\d)(?=.*[!@#$%^&*()])[A-Za-z\d!@#$%^&*()]{8,16}$"
                                       title="# 영문, 숫자, 특수문자를 혼합하여 8자 이상 16자 이하로 입력하세요" maxlength="16"
                                       oninput="updateCharCount('password', 'passwordLength')" minlength="8" required>
                            </label>
                            <span id="passwordLength">0/16</span>
                        </div>
                        <span class="check-text"> 영문 숫자 특수문자를 조합하여 최소 8자 최대 16자 등록 가능합니다.</span>
                        <span class="check-text" id="passwordMessage"></span>

                        <!--닉네임-->
                        <div class="inputset inputset-lg inputset-label" >
                            <label for="nickName">
                                <h6 class="inputset-tit"> 닉네임<span>*</span>
                                </h6>
                                <input type="text" class="inputset-input form-control" placeholder="사용하실 닉네임을 입력해 주세요." id="nickName" name="nickName"
                                       required maxlength="8" oninput="updateCharCount('nickName', 'nickNameLength')" minlength="2"/>
                            </label>
                            <span id="nickNameLength">0/8</span>
                        </div>
                        <span class="check-text">영문과 숫자 한글을 조합하여 최소 2자 최대 8자 등록 가능합니다.</span>
                        <span class="check-text" id="nickNameMessage"></span>

                        <!--이름-->
                        <div class="inputset inputset-lg inputset-label">
                            <label  for="userName">
                                <h6 class="inputset-tit"> 회원명<span>*</span>
                                </h6>
                                <input type="text" class="inputset-input form-control" placeholder="본인의 성명을 입력해주세요." id="userName" name="userName" value="${kakaoUserInfo.nickname}" required>
                            </label>
                        </div>

                        <!--주소-->
                        <div class="inputset inputset-lg inputset-label">
                            <label for="addr">
                                <h6 class="inputset-tit"> 주소<span>*</span></h6>

                                <input type="text" class="inputset-input form-control" placeholder="주소 찾기를 통하여 주소를 등록해주세요." id="addr" name="addr" required>
                                <button class="btnset btnset-line btnset-lg" type="button" onclick="findAddress()">주소 찾기</button>

                            </label>
                        </div>

                        <!--상세주소-->
                        <div class="inputset inputset-lg inputset-label">
                            <label for="address">
                                <h6 class="inputset-tit"> 상세주소 </h6>
                                <input type="text" class="inputset-input form-control" placeholder="상세주소를 입력해주세요"  id="address" name="address" required>
                            </label>
                        </div>

                        <!--휴대폰 번호-->
                        <div class="inputset inputset-lg inputset-label">
                            <label for="phone">
                                <h6 class="inputset-tit"> 휴대번호<span>*</span>
                                </h6>
                                <input type="tel" class="inputset-input form-control" placeholder="- 포함하여 입력해주세요." id="phone" name="phone" required>
                            </label>
                        </div>
                        <span class="check-text" id="phoneMessage"></span>

                        <!--이메일-->
                        <div class="inputset inputset-lg inputset-label">
                            <label  for="email">
                                <h6 class="inputset-tit"> 이메일<span>*</span>
                                </h6>
                                <input type="email" class="inputset-input form-control" id="email" name="email" value="${kakaoUserInfo.email}"required>
                            </label>
                        </div>

                        <!--회원이미지-->
                            <div class="inputset inputset-lg inputset-label"  for="userImage">
                                <label>
                                    <h6 class="inputset-tit"> 회원 이미지 </h6>

                                    <div style="text-align: Left;">
                                        <img src="../file/user/user.jpg" width="80" style="border-radius: 50%; max-width: 100%;" alt=""/>
                                        <p class="check-stext">* 기본이미지 입니다.</p>
                                    </div>

                                    <div id="dropArea" class="drop-area" >
                                        <span class="drop-text">
                                            JPG 이미지를 올려 주세요
                                        </span>
                                        <input class="check-image" type="file" id="userfile" name="userfile" accept=".jpg"/>
                                        <ul id="fileList" class="file-list" style="list-style-type: none; padding: 0; margin-top: 10px;"></ul>
                                    </div>

                                </label>
                            </div>



                    </div>
                </div>
                <div class="contents-alarm">
                </div>
                <div class="contents-agree">
                    <div class="inputset inputset-lg inputset-label">
                        <label >
                            <h6 class="inputset-tit">개인정보수집 및 이용동의</h6>
                            <div class="inputset-board"> - 수집하는 개인정보 항목 : 이메일 주소 <br>
                                <br> 작성해주시는 개인 정보는 문의 접수 및 고객 불만 해결을 위해 5년간 보관됩니다. 이용자는 본 동의를 거부할 수 있으나, 미동의시 문의 접수가 불가능합니다.
                            </div>
                        </label>
                    </div>
                    <div class="checkset">
                        <input id="checkset-a-2-1" class="checkset-input input-fill" type="checkbox" value="">
                        <label class="checkset-label" for="checkset-a-2-1"></label>
                        <span class="checkset-text">위 내용을 읽었으며, 내용에 동의합니다. (필수)</span>
                    </div>
                </div>
                <button class="btnset btnset-lg contents-submit">가입완료</button>
            </div>
        </div>
    </div>
    <!-- [E]hooms-N53 -->
</form>
</main>
<%@ include file="../layout/bottom.jsp" %>

    <script src="../user/js/setting.js"></script>
    <script src="../user/js/plugin.js"></script>
    <script src="../user/js/template.js"></script>
    <script src="../user/js/common.js"></script>
    <script src="../user/js/script.js"></script>
    <script src="../user/js/addUser.js"></script>
    <script src="/common/js/drag.js"></script>

</body>
</html>
 