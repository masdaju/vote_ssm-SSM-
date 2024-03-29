<%--
  Created by IntelliJ IDEA.
  User: Yustar
  Date: 2023/11/15
  Time: 21:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%
    // 获取当前session
    if (session != null) {
        // 使session失效
        session.invalidate();
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>退出登录</title>
    <style>
        body {
            margin: 0;
            font-family: 'Arial', sans-serif;
            background-color: #f2f2f2;
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
        }

        h1 {
            color: #3498db;
        }

        p {
            margin-top: 20px;
        }

        a {
            display: inline-block;
            padding: 10px 20px;
            text-decoration: none;
            background-color: #3498db;
            color: #fff;
            border-radius: 5px;
            transition: background-color 0.3s ease-in-out;
        }

        a:hover {
            background-color: #2980b9;
        }
    </style>
</head>
<body>
<h1>您已成功退出登录</h1>
<p><a href="${pageContext.request.contextPath}/Login">返回登录页面</a></p>
</body>
</html>