<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
            background: url('https://via.placeholder.com/1500x500') no-repeat center center/cover;
            height: 50vh;
            display: flex;
            justify-content: center;
            align-items: center;
            color: #fff;
            text-align: center;
        }

        .search-form {
            background: #fff;
            padding: 1rem;
            margin: -2rem auto 2rem;
            width: 80%;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            display: flex;
            gap: 1rem;
        }

        .search-form input, .search-form select, .search-form button {
            flex: 1;
            padding: 0.5rem;
        }

        footer {
            background: #f1f1f1;
            color: #555;
            padding: 1rem;
            text-align: center;
        }
    </style>
</head>
<body>
    <%@ include file="/WEB-INF/views/includes/header.jsp" %>
    
    <div class="banner">
        <h1>Find Your Next Destination</h1>
    </div>
    <div class="search-form">
        <input type="text" placeholder="출발지">
        <input type="text" placeholder="도착지">
        <input type="date">
        <input type="date">
        <button>검색</button>
    </div>
    <footer>
        <p>&copy; 2024 Trip Clone. All rights reserved.</p>
    </footer>
</body>
</html>
