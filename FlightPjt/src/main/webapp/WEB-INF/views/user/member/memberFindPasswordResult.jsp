<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>비밀번호 찾기 결과</title>
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
            width: 35%;
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
            text-align: center;
        }
        .form-actions {
            text-align: center;
            margin-top: 20px;
        }
        .form-actions button {
            padding: 10px 20px;
            font-size: 16px;
            cursor: pointer;
            color: #000080;
            background: #fff;
            margin: 7px;
            border-radius: 7px;
            width: 22%;
        }
        .form-actions button[type="submit"] {
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
    <%@ include file="/WEB-INF/views/includes/header.jsp" %> <!-- 헤더를 외부 파일로 포함 -->
    <div class="bodycontainer">
        <br><br><br><br>
        <div class="container">
            <h2>비밀번호 찾기 결과</h2>
            <br><br><br>
            <p><strong><%= request.getAttribute("foundPassword") %></strong></p>
            <br><br>
            <div class="form-actions">
                <button onclick="window.location.href='<c:url value='/user/member/memberLoginForm' />';">로그인</button>
            </div>
        </div>
    </div>
    <%@ include file="/WEB-INF/views/includes/footer.jsp" %> <!-- 푸터를 외부 파일로 포함 -->
</body>
</html>
