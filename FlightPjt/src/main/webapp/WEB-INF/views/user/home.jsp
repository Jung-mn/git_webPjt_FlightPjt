<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Flight Booking - Home</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }
        
        .banner {
		    position: relative;
		    height: 50vh;
		    overflow: hidden;
		    z-index: 1; /* 배너의 z-index는 낮게 설정 */
		}
		
		.banner img {
		    width: 100%;
		    height: 100%;
		    object-fit: cover;
		}
		
		.banner h1 {
		    position: absolute;
		    top: 50%;
		    left: 50%;
		    transform: translate(-50%, -50%);
		    color: #fff;
		    font-size: 2.5rem;
		    text-shadow: 2px 2px 8px rgba(0, 0, 0, 0.7);
		}
		
		.search-form {
		    position: relative;
		    z-index: 10; /* search-form이 배너보다 위에 있도록 설정 */
		    background: #fff;
		    padding: 1rem;
		    margin: -2rem auto 2rem;
		    width: 80%;
		    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
		    display: flex;
		    flex-direction: column;
		    gap: 1rem;
		    border-radius: 10px; /* 모서리를 둥글게 설정 */
		}

        
        .search-row {
            display: flex;
            align-items: center;
            gap: 1rem;
        }
        
        .search-row input[type="text"],
        .search-row input[type="date"] {
            font-size: 1rem;
            padding: 0.75rem;
            flex: 1;
        }
    
        .passenger-container {
            display: flex;
            flex-direction: column;
            gap: 0.5rem;
            flex-grow: 1;
        }

        .passenger-overview {
            cursor: pointer;
            padding: 1rem;
            background: #f9f9f9;
            border: 1px solid #ddd;
            border-radius: 8px;
            text-align: center;
        }

        .passenger-section {
            display: none;
            flex-direction: column;
            gap: 1rem;
            border: 1px solid #ddd;
            padding: 1rem;
            border-radius: 8px;
        }

        .passenger-section div {
            display: flex;
            align-items: center;
            justify-content: space-between;
        }

        .passenger-section button {
            width: 30px;
            height: 30px;
            border: 1px solid #ddd;
            background: #f9f9f9;
            border-radius: 50%;
            cursor: pointer;
        }

        .passenger-section select {
            width: 100%;
            padding: 0.5rem;
        }
        
        .search-row .search-button {
            padding: 0.7rem 1.4rem;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 20px;
        }
    </style>
    <script>
        function adjustCount(type, operation) {
            const input = document.getElementById(type + '-count');
            let count = parseInt(input.value);
            if (operation === 'increment') {
                count++;
            } else if (operation === 'decrement' && count > 0) {
                count--;
            }
            input.value = count;
            updatePassengerOverview();
        }

        function togglePassengerSection() {
            const section = document.getElementById('passenger-section');
            if (section.style.display === 'none' || section.style.display === '') {
                section.style.display = 'flex';
            } else {
                section.style.display = 'none';
            }
        }

        function updatePassengerOverview() {
            const adultCount = document.getElementById('adult-count').value;
            const childCount = document.getElementById('child-count').value;
            const infantCount = document.getElementById('infant-count').value;
            const seatTypes = document.querySelectorAll('.checkbox-group input:checked');
            let seatTypeText = Array.from(seatTypes).map(input => input.nextSibling.textContent.trim()).join(', ');
            if (!seatTypeText) seatTypeText = '일반석';

            document.getElementById('passenger-overview').textContent = `성인 ${adultCount}명, 어린이 ${childCount}명, 유아 ${infantCount}명, ${seatTypeText}`;
        }
    </script>
</head>
<body>
    <%@ include file="/WEB-INF/views/includes/header.jsp" %> <!-- 헤더를 외부 파일로 포함 -->
    
    <!-- <img src="<c:url value='/resources/img/user/large_banner.jpg' />" -->

    <div class="banner">
	    <img src="<c:url value='/resources//img/test3.jpg' />" alt="Banner" style="width: 100%; height: 100%; object-fit: cover;" />
	    <h1 style="position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%); color: #fff;">함께하는 여행, 빠르고 쉽게!</h1>
	</div>
    <div class="search-form">
        <!-- 왕복/편도 선택 라디오 버튼 -->
        <div>
            <label><input type="radio" name="tripType" value="roundTrip" checked> 왕복</label>
            <label><input type="radio" name="tripType" value="oneWay"> 편도</label>
        </div>
        
        
        <div class="search-row">
            
            <!-- 출발지&도착지 -->
            <input type="text" placeholder="출발지">
            <input type="text" placeholder="도착지">
            
            <!-- 출발일&도착일 -->
            <input type="date" placeholder="출발일">
            <input type="date" placeholder="도착일">
            
            <!-- 탑승자 결과 보기 및 설정 -->
            <div class="passenger-container">
                <div id="passenger-overview" class="passenger-overview" onclick="togglePassengerSection()">
                    성인 1명, 일반석
                </div>
                <div id="passenger-section" class="passenger-section">
                    <div>
                        <label for="adult-count">성인 (12세 이상)</label>
                        <div>
                            <button type="button" onclick="adjustCount('adult', 'decrement')">-</button>
                            <input id="adult-count" type="text" value="1" readonly style="width: 40px; text-align: center;">
                            <button type="button" onclick="adjustCount('adult', 'increment')">+</button>
                        </div>
                    </div>
                    <div>
                        <label for="child-count">어린이 (2~11세)</label>
                        <div>
                            <button type="button" onclick="adjustCount('child', 'decrement')">-</button>
                            <input id="child-count" type="text" value="0" readonly style="width: 40px; text-align: center;">
                            <button type="button" onclick="adjustCount('child', 'increment')">+</button>
                        </div>
                    </div>
                    <div>
                        <label for="infant-count">유아 (2세 미만)</label>
                        <div>
                            <button type="button" onclick="adjustCount('infant', 'decrement')">-</button>
                            <input id="infant-count" type="text" value="0" readonly style="width: 40px; text-align: center;">
                            <button type="button" onclick="adjustCount('infant', 'increment')">+</button>
                        </div>
                    </div>
                    <!-- 좌석 종류 -->
                    <div class="checkbox-group">
                        <label><input type="checkbox" name="seatType" value="economy" checked> 일반석</label>
                        <label><input type="checkbox" name="seatType" value="premiumEconomy"> 프리미엄 일반석</label>
                        <label><input type="checkbox" name="seatType" value="business"> 비즈니스석</label>
                        <label><input type="checkbox" name="seatType" value="first"> 일등석</label>
                    </div>
                </div>
            </div>
        </div>

        <!-- 검색 버튼 -->
        <div class="search-row">
            <div style="flex: 1;"></div> <!-- 왼쪽 정렬용 빈 공간 -->
            <button class="search-button">검색</button>
        </div>
        
    </div>

    <%@ include file="/WEB-INF/views/includes/footer.jsp" %> <!-- 푸터를 외부 파일로 포함 -->
</body>
</html>
