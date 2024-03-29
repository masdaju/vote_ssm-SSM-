<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Profile</title>

    <!-- Include layui CSS and JavaScript -->
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery-3.6.0.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/layui.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/layui.css">
</head>
<body>

<div class="layui-container">
    <div class="layui-row">
        <div class="layui-col-md6 layui-col-md-offset3">

            <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
                <legend>User Profile</legend>
            </fieldset>

            <form class="layui-form">

                <div class="layui-form-item">
                    <label class="layui-form-label">用户名</label>
                    <div class="layui-input-block">
                        <input type="text" value="${user.userName}" class="layui-input" readonly>
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">密码</label>
                    <div class="layui-input-block">
                        <input type="text" value="${user.password}" class="layui-input" readonly>
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">权限</label>
                    <div class="layui-input-block">
                        <input type="text" value="${user.power == 1 ? '一般用户' : '管理员'}" class="layui-input" readonly>
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">状态</label>
                    <div class="layui-input-block">
                        <input type="text" value="${user.state == 1 ? '可用' : '不可用'}" class="layui-input" readonly>
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">生日</label>
                    <div class="layui-input-block">
                        <input type="text" value="${user.birthdate}" class="layui-input" readonly>
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">电话号码</label>
                    <div class="layui-input-block">
                        <input type="text" value="${user.phonenum}" class="layui-input" readonly>
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">性别</label>
                    <div class="layui-input-block">
                        <input type="text" value="${user.gender == 1 ? '男' : '女'}" class="layui-input" readonly>
                    </div>
                </div>

                <div class="layui-form-item">
                    <div class="layui-input-block">
                        <button type="button" class="layui-btn" onclick="goBack()">Go Back</button>
                    </div>
                </div>

            </form>

        </div>
    </div>
</div>

<script>
    function goBack() {
        // You can customize this function based on your requirements
        window.history.back();
    }
</script>

</body>
</html>