<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>简易时钟</title>
    <style>
        #clock {
            font-size: 48px;
            text-align: center;
            margin-top: 100px;
        }
    </style>
</head>
<body>
<div id="clock"></div>

<script>
    setInterval(function() {
        document.getElementById('clock').textContent = new Date().toLocaleTimeString();
    }, 1000);
</script>
</body>
</html>
