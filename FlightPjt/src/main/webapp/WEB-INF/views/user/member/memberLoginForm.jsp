<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>로그인</title>
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
        .container h2{
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
        .form-group a {
        	font-size: 10px;
        	color: #000080;
        }
        .form-group input{
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
		    border: solid #002cf3 1px; /* 마우스를 가져다 댔을 때 테두리 색상과 두께를 #0029a6으로 설정 */
		}
        .form-group input:focus {
		    border: solid #002cf3 1px; /* 포커스를 받았을 때 테두리 색상을 #0029a6으로 변경 */
		    outline: none; /* 기본 outline 제거 */
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
    <br>
        <h1>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
        &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp로그인 </h1>
        
        <div class="container">
            <h2>회원 로그인</h2> 
            <br><br>
            <form action="<c:url value='/user/member/login' />" method="post">
                
                <!-- 아이디 -->
                <div class="form-group">
                    <label for="id">&nbsp아이디</label>
                    <input type="text" id="id" name="id" required>
                </div>
                
                <!-- 비밀번호 -->
                <div class="form-group">
                    <label for="password">&nbsp비밀번호</label>
                    <input type="password" id="password" name="password" required>
                </div>            
                
                <!-- 아이디찾기&비밀번호찾기 -->
                <div class="form-group" style="text-align: center;">
				    <a href="<c:url value='/user/member/findId' />">아이디 찾기</a> | 
				    <a href="<c:url value='/user/member/findPassword' />">비밀번호 찾기</a>
				</div>      

                <!-- 제출 -->
                <div class="form-actions">
                    <button type="reset">초기화</button>
                    <button type="submit">로그인</button>              
                </div>
            </form>
        </div>
    </div>
    <%@ include file="/WEB-INF/views/includes/footer.jsp" %> <!-- 푸터를 외부 파일로 포함 -->
</body>
</html>
