<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
</style>

<header>
    <!-- Logo -->
    <div class="logo">Flight<span>together</span></div>

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
        <a href="/user/member/memberJoinForm">회원가입</a>
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

        <!-- 로그인 (오른쪽 배치) -->
        <a href="user/member/memberLoginForm" class="login">
            <img src="https://img.icons8.com/ios-filled/50/FFFFFF/login-rounded-right.png" alt="login-Icon">로그인
        </a>
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
</script>
