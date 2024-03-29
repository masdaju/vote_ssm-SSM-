<%--
  Created by IntelliJ IDEA.
  User: Yustar
  Date: 2023/11/13
  Time: 22:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>用户登录</title>
  <script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery-3.6.0.min.js"></script>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/buttoncss.css">
  <style>
    body {
      /* 设置背景图片的路径和属性 */
      /* 设置背景图片的路径和属性 */
      background: url('/static/back.jpg') center center fixed;
      background-size: cover; /* 让背景图片覆盖整个页面 */
      background-position: center 0px; /* 调整背景图片位置，往下移50px */
      margin: 0; /* 清除默认的页面边距 */
      font-family: Arial, sans-serif; /* 设置字体 */

      margin: 0;
      font-family: 'Arial', sans-serif;
      background-color: #f2f2f2;
      display: flex;
      align-items: center;
      justify-content: center;
      height: 100vh;
    }

    .login {
      background-color: #fff;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
      padding: 40px; /* 调整 padding 值以增大登录框 */
      text-align: center;
      border-radius: 15px; /* 调整 border-radius 以使边角更为圆润 */
    }

    h2 {
      color: #3498db;
    }

    .login_box {
      margin: 15px 0;
      position: relative;
    }

    input {
      width: calc(100% - 20px); /* 调整宽度以适应更大的框 */
      padding: 10px;
      box-sizing: border-box;
      border: 1px solid #ddd;
      border-radius: 5px;
      margin-top: 5px;
    }

    label {
      position: absolute;
      top: 50%;
      left: 10px;
      transform: translateY(-50%);
      font-size: 12px;
      color: #888;
      transition: top 0.3s, font-size 0.3s, color 0.3s;
    }

    input:focus + label {
      top: 0;
      font-size: 10px;
      color: #3498db;
    }

    a {
      display: inline-block;
      margin-top: 20px;
      background-color: #3498db;
      color: #fff;
      padding: 15px 30px; /* 调整 padding 值以适应更大的框 */
      text-decoration: none;
      border-radius: 8px; /* 调整 border-radius 以使边角更为圆润 */
      position: relative;
      overflow: hidden;
    }

    a:hover span {
      transform: scaleX(1);
    }

    span {
      position: absolute;
      top: 0;
      left: 0;
      width: 100%;
      height: 100%;
      background: linear-gradient(90deg, transparent, #3498db, transparent);
      transform: scaleX(0);
      transform-origin: right;
      transition: transform 0.5s;
    }
  </style>
</head>
<body>

<div class="login">
  <h2>系统登录</h2>
  <div class="login_box">
    <!-- required就是不能为空 必须在css效果中有很大的作用 -->
    <!-- 可以简写为required -->
    <input type="text" id="name"/><label>用户名</label>
  </div>
  <div class="login_box">
    <input type="password" id="password"/><label>密码</label>
  </div>
  <a href="javascript:login()">
    登录
    <span></span>
    <span></span>
    <span></span>
    <span></span>
  </a>
  <a href="javascript:rigister()">
    注册
    <span></span>
    <span></span>
    <span></span>
    <span></span>
  </a>
</div>
</body>
<script>
  function rigister(){
    window.top.location= "${pageContext.request.contextPath}/Register";
  }
  function login(){
    let name = $("#name").val();
    let password = $("#password").val();
    $.ajax({
      url:"${pageContext.request.contextPath}/doAjaxLogin",
      type : "post",
      data : JSON.stringify({
        userName:name,
        password:password
      }),
      contentType:"application/json;charset=UTF-8",
      dataType:"json",
      success : function (data){
        if(data === 1){
          location.href = "${pageContext.request.contextPath}/index"
        }else if(data === 0){
          alert("账号已停用");
        }else {
          alert("账号或密码错误");
        }
      }
    });
  }
</script>
</html>

