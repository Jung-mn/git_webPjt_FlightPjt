<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
    header {
        background: #0029a6;
        color: #fff;
        padding: 1rem 2rem;
    }

    .logo {
        font-size: 2.0rem;
        font-weight: bold;
        display: inline-block;
    }

    .logo span {
        font-size: 1.3rem;
        color: #ffd700;
        margin-left: 5px;
    }

    /* Navigation Links (Top Right) */
    nav {
        float: right;
        display: flex; /* Flexbox로 변경 */
        gap: 1.5rem; /* 항목 간 간격을 설정 */
        position: relative;
        padding-top: 10px;
    }

    nav a {
        color: #fff;
        text-decoration: none;
        font-size: 0.9rem;
    }
    
    /* Language Dropdown */
    .language-dropdown {
        position: absolute;
        top: 2rem;
        right: 0;
        background: #fff;
        color: #000;
        border: 1px solid #ccc;
        border-radius: 5px;
        display: none;
        z-index: 100;
        width: 200px;
        padding: 0.5rem;
    }

    .language-dropdown a {
        display: block;
        padding: 0.5rem;
        color: #000;
        text-decoration: none;
    }

    .language-dropdown a:hover {
        background: #f0f0f0;
    }

    /* .menu와 nav 사이의 간격을 늘리기 위한 수정 */
    .menu {
        display: flex;
        justify-content: space-between; /* 메뉴 항목들을 양쪽 끝으로 배치 */
        width: 100%; /* 메뉴가 화면 전체 너비를 차지하게 함 */
        margin-top: 1rem; /* nav와 메뉴 사이에 간격 추가 */
    }

    /* 메뉴 항목들 간 간격을 넓게 설정 */
    .menu div {
        display: flex;
        gap: 2rem; /* 간격을 더 넓게 설정 */
    }

    .menu a {
        color: #fff;
        text-decoration: none;
        font-size: 0.9rem;
    }
    .menu a:hover {
    text-decoration: underline;
    text-decoration-thickness: 1.5px; /* 두께를 1.5px로 설정 */
}
    /* 아이콘의 크기 조정 */
    .menu a img {
        width: 25px;
        height: 25px;
        margin-left: 8px;
    }
    

    .menu a.login {
        font-weight: bold;
        display: flex;
        align-items: center;
        margin-left: auto; /* 로그인 항목을 오른쪽 끝으로 정렬 */
    }

    /* 아이콘의 크기 조정 */
    .menu a.login img {
        width: 25px;
        height: 25px;
        margin-left: 8px;
    }
    

     
	/* login-modal
	.modal {
	    display: none; 
	    position: fixed;
	    z-index: 1000; 
	    left: 0;
	    top: 0;
	    width: 100%;
	    height: 100%;
	    overflow: auto;
	    background-color: rgba(0, 0, 0, 0.4); 
	}
	
	
	.modal-content {
	    background-color: #fff;
	    margin: 5% auto;
	    padding: 20px;
	    border: 1px solid #888;
	    width: 30%;
	    height: 400px; 
	    text-align: center;
	    border-radius: 10px;
	    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
	    color: black; 
    	flex-direction: column; 
    	position: relative; 

	}
	.modal-content a {
	    color: black;
	    text-decoration: none; 
	}
	
	
	.close-button {
	    color: #aaa;
	    font-size: 28px;
	    font-weight: bold;
	    cursor: pointer;
	    position: absolute;
	    top: 10px;
	    right: 10px;
	    
	}
	h2 {
        font-size: 20px;
        margin: 1px 0;
    }

    p {
        font-size: 14px;
        color: #666;
    }

    input[type="text"], input[type="password"] {
        width: 80%;
        padding: 10px;
        margin: 5px 0;
        border: 1px solid #ccc;
        border-radius: 5px;
        margin: 10px 0;
    }

    button {
        width: 80%;
        padding: 10px;
        background-color: #007bff;
        color: #fff;
        border: none;
        border-radius: 5px;
        font-size: 16px;         
        cursor: pointer;
    }

    button:hover {
        background-color: #0056b3;
    }

    a {
        display: inline-block;
        margin-top: 20px;
        text-decoration: none;
        color: #007bff;
        font-size: 14px;
	}

    a:hover {
        text-decoration: underline;
    }

    hr {
        margin: 20px auto;
        width: 80%;
        border: 0;
        border-top: 1px solid #ccc;
    }   */
    
    
</style>

<header>

    <!-- Logo -->
    <a href="<c:url value='/user/' />" class="logo" style="text-decoration: none; color: inherit;">Flight<span>together</span></a>

    <!-- Navigation Links (Top Right) -->
    <nav>
        <a href="#">이벤트</a>
        <a href="#">고객센터</a>
        <div class="language-selector">
            <a href="#" id="language-button">한국어</a>
            <div class="language-dropdown" id="language-dropdown">
                <a href="#" onclick="selectLanguage('한국어')">한국어</a>
                <a href="#" onclick="selectLanguage('English')">English</a>
                <a href="#" onclick="selectLanguage('日本語')">日本語</a>
                <a href="#" onclick="selectLanguage('中文')">中文</a>
                <a href="#" onclick="selectLanguage('Français')">Français</a>
            </div>      
        </div>
        
        
        <!-- 회원가입 / 로그아웃 -->
        <% 
            // 세션에서 로그인한 사용자의 정보를 가져옴
            Object loggedInUser = session.getAttribute("loggedInUser");
        	System.out.println(loggedInUser);
        %>
        <c:choose>
            <c:when test="${not empty loggedInUser}">
            	<a style="font-size: 17px;">${loggedInUser.koreanName}님</a>
                <a href="<c:url value='/user/member/logout' />" >로그아웃</a>
            </c:when>
            <c:otherwise>
                <a href="<c:url value='/user/member/memberJoinForm' />" >회원가입</a>
            </c:otherwise>
        </c:choose>
    </nav>

    <!-- Menu (Under the Logo) -->
    <div class="menu">
        <div>
            <a href="#"><img src="https://img.icons8.com/external-vitaliy-gorbachev-fill-vitaly-gorbachev/50/FFFFFF/external-hotel-vacation-vitaliy-gorbachev-fill-vitaly-gorbachev.png" alt="hotel-icon"/> 호텔</a>
            <a href="#"><img src="https://img.icons8.com/ios-filled/50/FFFFFF/airplane-take-off.png" alt="airplane-icon"/> 항공권</a>
            <a href="#"><img src="https://img.icons8.com/ios-filled/50/FFFFFF/ticket.png" alt="ticket-icon"/> 투어 & 티켓</a>
            <a href="#"><img src="https://img.icons8.com/ios-filled/50/FFFFFF/train.png" alt="train-icon"/> 기차표</a>
            <a href="#"><img src="https://img.icons8.com/ios-filled/50/FFFFFF/station-wagon.png" alt="car-icon"/> 렌터카</a>
        </div>
	
	
	
	
		<c:choose>
			<c:when test="${not empty loggedInUser}">
        		<!-- 마이페이지 (오른쪽 배치) -->
        		<a href="<c:url value='/user/member/mypage' />" >마이페이지</a> 
        	</c:when>
            <c:otherwise>
            	<!-- 로그인 (오른쪽 배치) -->
        		<a href="<c:url value='/user/member/memberLoginForm' />" > 
            		<img src="https://img.icons8.com/ios-filled/50/FFFFFF/login-rounded-right.png" alt="login-Icon">로그인
       	 		</a> 
        	</c:otherwise>
        </c:choose>
        
        <!-- 로그인 모달 
        <div id="login-modal" class="modal">
	        <div class="modal-content">
	            <span class="close-button">&times;</span>
	            <h2>로그인</h2>
	            <a>간편하게 예약을 관리하고 회원 전용 혜택도 누려보세요</a>
	            <form action="<c:url value='/user/member/login' />" method="POST" onsubmit="closeModal()">
	                <input type="text" id="id" name="id" placeholder="아이디를 입력하세요" required>
	                <input type="password" id="password" name="password" placeholder="비밀번호를 입력하세요" required>
	                <button type="submit">로그인</button>
	                <hr>
	                <a href="<c:url value='/user/member/memberJoinForm' />" >회원가입</a>
	            </form>
	        </div>
    	</div> -->
    	
    </div>
</header>

<script>
    const languageButton = document.getElementById('language-button');
    const languageDropdown = document.getElementById('language-dropdown');

    languageButton.addEventListener('click', (e) => {
        e.preventDefault();
        languageDropdown.style.display = languageDropdown.style.display === 'block' ? 'none' : 'block';
    });

    function selectLanguage(language) {
        languageButton.textContent = language;
        languageDropdown.style.display = 'none';
    }

    // Close the dropdown if clicked outside
    document.addEventListener('click', (e) => {
        if (!e.target.closest('.language-selector')) {
            languageDropdown.style.display = 'none';
        }
    });
    
    
    /*   login-modal
    
    const loginButton = document.getElementById('login-button');
    const modal = document.getElementById('login-modal');
    const closeButton = document.querySelector('.close-button');

    loginButton.addEventListener('click', (e) => {
        e.preventDefault();
        modal.style.display = 'block';
    });

    closeButton.addEventListener('click', () => {
        modal.style.display = 'none';
    });

    window.addEventListener('click', (e) => {
        if (e.target === modal) {
            modal.style.display = 'none';
        }
    });
    function closeModal() {
    	modal.style.display = 'none'; // 로그인 후 모달 닫기
        // 로그인 후 페이지 새로 고침 또는 리다이렉트
        window.location.href = '/home'; // 예: 홈 페이지로 리다이렉트
        // 또는 페이지를 새로 고침
        // window.location.reload(); // 페이지를 새로 고침
    }
    
 	// 초기 상태 명확히 설정
    document.addEventListener('DOMContentLoaded', () => {
        modal.style.display = 'none';
    }); 
 	
 	*/

</script>
