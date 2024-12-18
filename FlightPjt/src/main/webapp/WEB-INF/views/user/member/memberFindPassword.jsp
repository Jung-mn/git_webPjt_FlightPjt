<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>비밀번호 찾기</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #0029a6;
            margin: 0;
            padding: 0;
        }
        .bodycontainer{
            background: #f1f3f5;
            border-radius: 20px 20px 0px 0px;
        }
        .bodycontainer h1{
            font-weight: 500;
            text-align: center;
            color: #fff;
            padding-top: 30px;
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
        .form-group {
            margin-bottom: 30px;
        }
        .form-group label {
            display: block;
            color: #868e96;
            font-size: 13px;
            font-weight: 600;
        }
        .form-group input {
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
            <h2>비밀번호 찾기</h2> 
            <br><br>
            <form action="<c:url value='/user/member/findPassword' />" method="post">

				<!-- 아이디 -->
                <div class="form-group">
                    <label for="id">아이디</label>
                    <input type="text" id="id" name="id" required>
                </div> 

                <!-- 전화번호 -->
                <div class="form-group">
                    <label for="phone">전화번호</label>
                    <input type="text" id="phone" name="phone" required>
                </div>
                             
                <!-- 제출 -->
                <div class="form-actions">
                    <button type="button" onclick="window.location.href='<c:url value='/user/member/memberLoginForm' />';">로그인</button>
                    <button type="submit">검색</button>              
                </div>
            </form>
        </div>
    </div>
    <%@ include file="/WEB-INF/views/includes/footer.jsp" %> <!-- 푸터를 외부 파일로 포함 -->
</body>
</html>
