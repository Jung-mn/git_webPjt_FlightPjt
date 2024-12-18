<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원 정보 수정</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #0029a6;
            margin: 0;
            padding: 0;
        }
        .bodycontainer {
            background: #f1f3f5;
            border-radius: 20px 20px 0px 0px;
        }
        .container {
            width: 50%;
            margin: 0 auto;
            border: 1px solid #ccc;
            border-radius: 10px;
            padding: 40px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            background: #fff;
        }
        .container h2 {
            font-weight: 400;
            color: #000080;
        }
        .form-group {
            margin-bottom: 30px;
        }
        .form-group label {
            display: block;
            color: #868e96;
            font-size: 13px;
            font-weight: 600;
        }
        .form-group input,
        .form-group select {
            font-size: 15px;
            font-weight: 500;
            color: #222222;
            width: 95%;
            padding: 8px;
            border: none;
            border-bottom: solid #aaaaaa 1px;
            border-radius: 2px;
        }
        
        .form-group input:hover {
            border: solid #002cf3 1px;
        }
        .form-group input:focus {
            border: solid #002cf3 1px;
            outline: none;
        }
        .form-group input[type="radio"] {
            width: auto;
        }
        .form-actions {
            text-align: center;
            margin-top: 20px;
        }
        .form-actions button {
            padding: 10px 20px;
            font-size: 16px;
            cursor: pointer;
            color: #fff;
            background: #000080;
            margin: 7px;
            border-radius: 7px; 
            width: 22%;
        }
    </style>
</head>
<body>
    <%-- 헤더를 외부 파일로 포함 --%>
    <%@ include file="/WEB-INF/views/includes/header.jsp" %>

    <div class="bodycontainer">
        <br>
        <h1>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp회원 정보 수정</h1>

        <div class="container">
            <h2>회원정보 수정</h2> 
            <br><br>
            <form action="<c:url value='/user/member/updateProfile' />" method="post">
                <!-- 한글 이름 -->
                <div class="form-group">
                    <label for="koreanName">&nbsp한글 이름</label>
                    <input type="text" id="koreanName" name="koreanName" value="${loggedInUser.koreanName}" required>
                </div>
                <!-- 영문 성 -->
                <div class="form-group">
                    <label for="englishLastName">&nbsp영문 성</label>
                    <a>&nbsp여권과 동일한 철자로 입력해 주세요 (특수문자 제외).</a>
                    <input type="text" id="englishLastName" name="englishLastName" value="${loggedInUser.englishLastName}" required>
                </div>
                <!-- 영문 이름 -->
                <div class="form-group">
                    <label for="englishFirstName">&nbsp영문 이름</label>
                    <a>&nbsp여권과 동일한 철자로 입력해 주세요 (특수문자 제외).</a>
                    <input type="text" id="englishFirstName" name="englishFirstName" value="${loggedInUser.englishFirstName}" required>
                </div>
                <!-- 이메일 -->
                <div class="form-group">
                    <label for="email">&nbsp이메일 주소</label>
                    <input type="email" id="email" name="email" value="${loggedInUser.email}" required placeholder="예) hong1234@gmail.com">
                </div>
                <!-- 전화번호 -->
                <div class="form-group">
                    <label for="phone">&nbsp전화번호</label>
                    <input type="tel" id="phone" name="phone" value="${loggedInUser.phone}" required>
                </div>
                <!-- 생년월일 -->
                <div class="form-group">
                    <label for="birthdate">&nbsp생년월일</label>
                    <input type="date" id="birthdate" name="birthdate" value="${loggedInUser.birthdate}" required>
                </div>
                <!-- 성별 -->
                <div class="form-group">
                    <label>&nbsp성별</label>
                    <br>
                    &nbsp남<input type="radio" id="male" name="gender" value="male" <c:if test="${loggedInUser.gender == 'male'}">checked</c:if> required>&nbsp&nbsp&nbsp 
                    여<input type="radio" id="female" name="gender" value="female" <c:if test="${loggedInUser.gender == 'female'}">checked</c:if> required>
                </div>
                <!-- 제출 -->
                <div class="form-actions">
                    <button type="submit">수정 완료</button>
                </div>
            </form>
        </div>
    </div>

    <%-- 푸터를 외부 파일로 포함 --%>
    <%@ include file="/WEB-INF/views/includes/footer.jsp" %>
</body>
</html>
