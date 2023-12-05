<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
    <title>작업 추가</title>
    <style>
        label {
            display: block;
            margin-bottom: 8px;
        }

        input,
        textarea {
            margin-bottom: 16px;
        }
    </style>
</head>
<body>

<h2>작업 추가</h2>

<form action="../work/addWork" method="post" onsubmit="return validateForm()">

    <label for="userId">작성자:</label>
    <input type="text" id="userId" name="userId" required />

    <label>창작 여부:</label>
    <label>
        <input type="radio" name="status" value="0" checked /> 원작
    </label>
    <label>
        <input type="radio" name="status" value="1" /> 창작
    </label>

    <label for="workName">작품명:</label>
    <input type="text" id="workName" name="workName" maxlength="30" required />

    <label>카테고리:</label>
    <label>
        <input type="radio" name="category" value="0" checked /> 웹소설
    </label>
    <label>
        <input type="radio" name="category" value="1" /> 웹툰
    </label>
    <label>
        <input type="radio" name="category" value="2" /> 웹드라마
    </label>

    <label>장르:</label>
    <label>
        <input type="checkbox" name="genre" value="학원" /> 학원
    </label>
    <label>
        <input type="checkbox" name="genre" value="액션" /> 액션
    </label>
    <label>
        <input type="checkbox" name="genre" value="SF" /> SF
    </label>
    <label>
        <input type="checkbox" name="genre" value="판타지" /> 판타지
    </label>
    <label>
        <input type="checkbox" name="genre" value="개그" /> 개그
    </label>
    <label>
        <input type="checkbox" name="genre" value="로맨스" /> 로맨스
    </label>
    <label>
        <input type="checkbox" name="genre" value="스포츠" /> 스포츠
    </label>
    <label>
        <input type="checkbox" name="genre" value="일상" /> 일상
    </label>
    <label>
        <input type="checkbox" name="genre" value="추리" /> 추리
    </label>
    <label>
        <input type="checkbox" name="genre" value="스릴러" /> 스릴러
    </label>
    <label>
        <input type="checkbox" name="genre" value="무협" /> 무협
    </label>
    <label>
        <input type="checkbox" name="genre" value="기타" /> 기타
    </label>

    <label for="note">작가 노트:</label>
    <textarea id="note" name="note" maxlength="100"></textarea>

    <label for="workDesc">작업 소개:</label>
    <textarea id="workDesc" name="workDesc" maxlength="400" oninput="updateCharCount(this)"></textarea>
    <div id="charCount">글자 수: 0/400</div>

    <label for="thumbnail">썸네일:</label>
    <input type="text" id="thumbnail" name="thumbnail" />

    <label>유료 / 무료 선택:</label>
    <label>
        <input type="radio" name="fap" value="0" checked /> 무료
    </label>
    <label>
        <input type="radio" name="fap" value="1" /> 유료
    </label>

    <!-- 각 장르에 해당하는 input 추가 -->
    <input type="hidden" name="genre1" />
    <input type="hidden" name="genre2" />
    <input type="hidden" name="genre3" />

    <button type="submit">작업 추가</button>
</form>

</body>
<script>
    function validateForm() {
        var checkboxes = document.getElementsByName("genre");
        var checkedCount = 0;

        var genre1 = "";
        var genre2 = "";
        var genre3 = "";

        for (var i = 0; i < checkboxes.length; i++) {
            if (checkboxes[i].checked) {
                checkedCount++;
                if (checkedCount === 1) {
                    genre1 = checkboxes[i].value;
                } else if (checkedCount === 2) {
                    genre2 = checkboxes[i].value;
                } else if (checkedCount === 3) {
                    genre3 = checkboxes[i].value;
                }
            }
        }

        if (checkedCount < 1 || checkedCount > 3) {
            alert("장르는 최소 1개 이상, 최대 3개까지 선택해야 합니다.");
            return false;
        }

        // 선택된 장르 값을 각각의 input에 할당
        document.getElementsByName("genre1")[0].value = genre1;
        document.getElementsByName("genre2")[1].value = genre2;
        document.getElementsByName("genre3")[2].value = genre3;

        return true;
    }
</script>
</html>
