<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원가입</title>
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
            width: 50%;
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
        .form-group input,
		.form-group select{
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
		<h1>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp회원가입 </h1>
		
	    <div class="container">
	        <h2>회원정보 입력</h2> 
	        <br><br>
	        <form action="joinProcess.jsp" method="post">
	            <!-- 한글 이름 -->
	            <div class="form-group">
	                <label for="koreanName">&nbsp한글 이름</label>
	                <input type="text" id="koreanName" name="koreanName" required>
	            </div>
	            <!-- 영문 성 -->
	            <div class="form-group">
	                <label for="englishLastName">&nbsp영문 성</label>
	                <a>&nbsp여권과 동일한 철자로 입력해 주세요 (특수문자 제외).</a>
	                <input type="text" id="englishLastName" name="englishLastName" required>
	            </div>
	            <!-- 영문 이름 -->
	            <div class="form-group">
	                <label for="englishFirstName">&nbsp영문 이름</label>
	                <a>&nbsp여권과 동일한 철자로 입력해 주세요 (특수문자 제외).</a>
	                <input type="text" id="englishFirstName" name="englishFirstName" required>
	            </div>
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
	            <!-- 비밀번호 확인 -->
	            <div class="form-group">
	                <label for="passwordConfirm">&nbsp비밀번호 확인</label>
	                <input type="password" id="passwordConfirm" name="passwordConfirm" required>
	            </div>
	            <!-- 생년월일 -->
	            <div class="form-group">
	                <label for="birthdate">&nbsp생년월일</label>
	                <input type="date" id="birthdate" name="birthdate" required>
	            </div>
	            <!-- 성별 -->
	            <div class="form-group">
	                <label>&nbsp성별</label>
	                
	                남<input type="radio" id="male" name="gender" value="male" required>&nbsp&nbsp&nbsp 
	                여<input type="radio" id="female" name="gender" value="female" required>
	                
	            </div>
	            <!-- 이메일 -->
	            <div class="form-group">
	                <label for="email">&nbsp이메일 주소</label>
	                <input type="email" id="email" name="email" required>
	            </div>
	            <!-- 전화번호 -->
	            <div class="form-group">
	                <label for="phone">&nbsp전화번호</label>
	                <input type="tel" id="phone" name="phone" required>
	            </div>
	            <!-- 거주 지역 -->
	            <div class="form-group">
	                <label for="region">&nbsp거주 지역</label>
	                <select id="region" name="region" required>
	                    <option value="">선택</option>
	                    <option value="서울">서울</option>
	                    <option value="경기">경기</option>
	                    <option value="인천">인천</option>
	                    <option value="부산">부산</option>
	                    <option value="대구">대구</option>
	                    <option value="광주">광주</option>
	                    <option value="대전">대전</option>
	                    <option value="울산">울산</option>
	                    <option value="강원">강원</option>
	                    <option value="충북">충북</option>
	                    <option value="충남">충남</option>
	                    <option value="전북">전북</option>
	                    <option value="전남">전남</option>
	                    <option value="경북">경북</option>
	                    <option value="경남">경남</option>
	                    <option value="제주">제주</option>
	                </select>
	            </div>
	            <!-- 제출 -->
	            <div class="form-actions">
	            	<button type="reset">초기화</button>
	                <button type="submit">가입하기</button>              
	            </div>
	        </form>
	    </div>
    </div>
    <%@ include file="/WEB-INF/views/includes/footer.jsp" %> <!-- 푸터를 외부 파일로 포함 -->
</body>
</html>
