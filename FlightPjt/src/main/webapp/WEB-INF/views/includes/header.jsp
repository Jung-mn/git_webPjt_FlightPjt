<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<header>
    <!-- Logo -->
    <div class="logo">Flight<span>together</span></div>

    <!-- Navigation Links (Top Right) -->
    <nav>
        <a href="#">이벤트</a>
        <a href="#">고객센터</a>
        <a href="#">언어</a>
        <a href="#">회원가입</a>
    </nav>

    <!-- Menu (Under the Logo) -->
    <div class="menu">
        <a href="#">호텔</a>
        <a href="#">항공권</a>
        <a href="#">투어 & 티켓</a>
        <a href="#">기차표</a>
        <a href="#">렌터카</a>
    </div>
</header>
<style>
    header {
        background: #0052cc;
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

    .menu {
        margin-top: 1rem;
        display: flex;
        justify-content: flex-start;
        gap: 1.5rem;
    }

    .menu a {
        color: #fff;
        text-decoration: none;
        font-size: 0.9rem;
    }

    nav {
        float: right;
    }

    nav a {
        color: #fff;
        text-decoration: none;
        margin: 0 0.5rem;
        font-size: 0.9rem;
    }
</style>
