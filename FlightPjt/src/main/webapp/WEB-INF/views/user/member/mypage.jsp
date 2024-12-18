<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Page - FlightTogether</title>
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
            padding: 30px;
        }
        .container {
            width: 60%;
            margin: 0 auto;
            border: 1px solid #ccc;
            border-radius: 10px;
            padding: 40px;
            background: #fff;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }
        .container h2 {
            font-weight: 400;
            color: #000080;
            text-align: center;
            font-size: 30px;
        }
        .user-info {
            margin-bottom: 30px;
        }
        .user-info table {
            width: 100%;
            border-collapse: collapse;
        }
        .user-info table, .user-info th, .user-info td {
            border: 1px solid #ccc;
            padding: 10px;
        }
        .user-info th {
            background-color: #f4f4f4;
            text-align: left;
            font-weight: 600;
            color: #868e96;
        }
        .user-info td {
            color: #222222;
            font-size: 15px;
            font-weight: 500;
        }
        .form-actions {
            text-align: center;
            margin-top: 20px;
        }
        a{
        	text-decoration: none;
        }
        
        a:hover {
	        text-decoration: underline; /* 마우스를 올렸을 때 밑줄 */
	        text-decoration-thickness: 1.5px; 
	    }
    </style>
</head>
<body>
    <%-- 헤더를 외부 파일로 포함 --%>
    <%@ include file="/WEB-INF/views/includes/header.jsp" %> 

    <div class="bodycontainer">
        <div class="container">
            <h2>${loggedInUser.koreanName}님 회원 정보</h2>
            <br><br>
            <div class="user-info">
                <table>
                    <tr>
                        <th>아이디</th>
                        <td>${loggedInUser.id}</td>
                    </tr>
                    <tr>
                        <th>이름</th>
                        <td>${loggedInUser.koreanName}</td>
                    </tr>
                    <tr>
                        <th>영문 이름</th>
                        <td>${loggedInUser.englishFirstName} ${loggedInUser.englishLastName}</td>
                    </tr>
                    <tr>
                        <th>이메일</th>
                        <td>${loggedInUser.email}</td>
                    </tr>
                    <tr>
                        <th>전화번호</th>
                        <td>${loggedInUser.phone}</td>
                    </tr>
                    <tr>
                        <th>생년월일</th>
                        <td><fmt:formatDate value="${loggedInUser.birthdate}" pattern="yyyy년 MM월 dd일" /></td>
                    </tr>
                    <tr>
					    <th>성별</th>
					    <td>
					        <c:choose>
					            <c:when test="${loggedInUser.gender == 'male'}">남자</c:when>
					            <c:when test="${loggedInUser.gender == 'female'}">여자</c:when>
					            <c:otherwise>알 수 없음</c:otherwise> 
					        </c:choose>
					    </td>
					</tr>
                </table>
            </div>

            <div class="form-actions">
                <a href="<c:url value='/user/member/editProfileForm' />" >
                    회원 정보 수정
                </a>
            </div>
        </div>
    </div>

    <%-- 푸터를 외부 파일로 포함 --%>
    <%@ include file="/WEB-INF/views/includes/footer.jsp" %> 
</body>
</html>
