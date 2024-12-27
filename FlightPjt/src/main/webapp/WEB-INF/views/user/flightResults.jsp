<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Flight Results</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f1f3f5;
            margin: 0;
            padding: 0;
        }
        .bodycontainer {
            background: #fff;
            border-radius: 20px 20px 0px 0px;
            margin: 20px;
            padding: 20px;
        }
        .bodycontainer h1 {
            font-weight: 500;
            text-align: center;
            color: #000080;
        }
        .container {
            width: 100%;
            margin: 0 auto;
            padding: 20px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            background: #fff;
        }
        .table-container {
            margin-top: 20px;
            overflow-x: auto;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        table, th, td {
            border: 1px solid #ddd;
        }
        th, td {
            text-align: center;
            padding: 10px;
        }
        th {
            background-color: #f2f2f2;
        }
        .btn-select {
            background-color: #007bff;
            color: white;
            padding: 5px 10px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        .btn-select:hover {
            background-color: #0056b3;
        }
        .error {
            color: red;
            font-weight: bold;
            text-align: center;
            font-size: 16px;
            margin-top: 20px;
        }
        .no-results {
            text-align: center;
            font-size: 18px;
            margin-top: 20px;
            color: #555;
        }
    </style>
</head>
<body>
    <%@ include file="/WEB-INF/views/includes/header.jsp" %> <!-- 헤더를 외부 파일로 포함 -->
    
    <div class="bodycontainer">
        <h1>Flight Results</h1>

        <c:if test="${not empty error}">
            <p class="error">${error}</p>
        </c:if>

        <!-- 출발 항공편 결과 출력 -->
        <c:if test="${not empty outboundFlightResults}">
            <div class="table-container">
                <h2>출발 항공편</h2>
                <table>
                    <thead>
                        <tr>
                            <th></th>
                            <th>출발지</th>
                            <th>출발 시간</th>
                            <th>비행 시간</th>
                            <th>도착지</th>
                            <th>도착 시간</th>                           
                            <th>가격</th>
                            <th>선택</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="flight" items="${outboundFlightResults}">
                            <tr>
                                <td>${flight['id']}</td>
                                <td>${flight['itineraries'][0]['segments'][0]['departure']['iataCode']}</td>
                                <td>
                                    <fmt:parseDate var="departureDate" value="${flight['itineraries'][0]['segments'][0]['departure']['at']}" pattern="yyyy-MM-dd'T'HH:mm:ss" />
                                    <fmt:formatDate value="${departureDate}" pattern="MM월 dd일 HH시 mm분" />
                                </td>
                                <!-- <td>${flight['itineraries'][0]['duration']}</td> -->
                                <td>${flight['readableDuration']}</td> <!-- 변환된 비행시간 -->
                                <td>${flight['itineraries'][0]['segments'][0]['arrival']['iataCode']}</td>
                                <td>
                                    <fmt:parseDate var="arrivalDate" value="${flight['itineraries'][0]['segments'][0]['arrival']['at']}" pattern="yyyy-MM-dd'T'HH:mm:ss" />
                                    <fmt:formatDate value="${arrivalDate}" pattern="MM월 dd일 HH시 mm분" />
                                </td>
                                <td>${flight['price']['total']} ${flight['price']['currency']} </td>
                                <td>
                                    <button class="btn-select" onclick="selectFlight('${flight['id']}')">선택</button>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </c:if>

        <!-- 왕복인 경우 반환 항공편 결과 출력 -->
        <c:if test="${not empty inboundFlightResults}">
            <div class="table-container">
                <br><br><h2>반환 항공편</h2>
                <table>
                    <thead>
                        <tr>
                            <th></th>
                            <th>출발지</th>
                            <th>출발 시간</th>
                            <th>비행 시간</th>
                            <th>도착지</th>
                            <th>도착 시간</th>                           
                            <th>가격</th>
                            <th>선택</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="flight" items="${inboundFlightResults}">
                            <tr>
                                <td>${flight['id']}</td>
                                <td>${flight['itineraries'][0]['segments'][0]['departure']['iataCode']}</td>
                                <td>
                                    <fmt:parseDate var="departureDate" value="${flight['itineraries'][0]['segments'][0]['departure']['at']}" pattern="yyyy-MM-dd'T'HH:mm:ss" />
                                    <fmt:formatDate value="${departureDate}" pattern="MM월 dd일 HH시 mm분" />
                                </td>
                                <!-- <td>${flight['itineraries'][0]['duration']}</td> -->
                                <td>${flight['readableDuration']}</td> <!-- 변환된 비행시간 -->
                                <td>${flight['itineraries'][0]['segments'][0]['arrival']['iataCode']}</td>
                                <td>
                                    <fmt:parseDate var="arrivalDate" value="${flight['itineraries'][0]['segments'][0]['arrival']['at']}" pattern="yyyy-MM-dd'T'HH:mm:ss" />
                                    <fmt:formatDate value="${arrivalDate}" pattern="MM월 dd일 HH시 mm분" />
                                </td>
                                <td>${flight['price']['total']} ${flight['price']['currency']} </td>
                                <td>
                                    <button class="btn-select" onclick="selectFlight('${flight['id']}')">선택</button>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </c:if>

        <c:if test="${empty flightResults}">
            
        </c:if>
    </div>

    <script>
        function selectFlight(flightId) {
            alert("선택한 항공편 ID: " + flightId);
        }
    </script>
    
    <%@ include file="/WEB-INF/views/includes/footer.jsp" %> <!-- 푸터를 외부 파일로 포함 -->
</body>
</html>
