<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registration</title>

    <!-- Include layui CSS and JavaScript -->
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery-3.6.0.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/layui.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/layui.css">
    <!-- Include jQuery -->
</head>
<body>

<div class="layui-container">
    <div class="layui-row">
        <div class="layui-col-md6 layui-col-md-offset3">

            <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
                <legend>Registration Form</legend>
            </fieldset>

            <form class="layui-form" id="registrationForm">

                <div class="layui-form-item">
                    <label class="layui-form-label" for="userName">Username</label>
                    <div class="layui-input-block">
                        <input type="text" id="userName" name="userName" lay-verify="required" autocomplete="off" class="layui-input">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label" for="password">Password</label>
                    <div class="layui-input-block">
                        <input type="password" id="password" name="password" lay-verify="required" autocomplete="off" class="layui-input">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label" for="birthdate">Birthdate</label>
                    <div class="layui-input-block">
                        <input type="date" id="birthdate" name="birthdate" lay-verify="required" autocomplete="off" class="layui-input">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label" for="phonenum">Phone Number</label>
                    <div class="layui-input-block">
                        <input type="text" id="phonenum" name="phonenum" lay-verify="required" autocomplete="off" class="layui-input">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label" for="gender">Gender</label>
                    <div class="layui-input-block">
                        <select id="gender" name="gender" lay-verify="required">
                            <option value=""></option>
                            <option value="1">男</option>
                            <option value="0">女</option>
                        </select>
                    </div>
                </div>

                <div class="layui-form-item">
                    <div class="layui-input-block">
                        <button type="button" class="layui-btn" onclick="submitRegistration()">Submit</button>
                    </div>
                </div>

            </form>

        </div>
    </div>
</div>

<script>
    layui.use(['form', 'layer'], function () {
        var form = layui.form;
        var layer = layui.layer;

        // Submit form
        form.on('submit', function (data) {
            // Handle form submission here
            // You can use data.field to get the form data
            console.log(data.field);
            return false; // Prevent the form from submitting normally
        });

        // Initialize the date input
        layui.laydate.render({
            elem: '#birthdate',
            format: 'yyyy-MM-dd',
            max: new Date().toLocaleDateString() // Restrict future dates
        });
    });

    function submitRegistration() {
        var  userName = $("#userName").val();
        var password = $("#password").val();
        var birthdate = $("#birthdate").val();
        var phonenum = $("#phonenum").val();
        var gender = $("#gender").val();
        // Perform any additional validation if needed
        $.ajax({
            url:"${pageContext.request.contextPath}/UsersManage/doRegister",
            type : "post",
            data : JSON.stringify({
                userName: userName,
                password: password,
                birthdate: birthdate,
                phonenum: phonenum,
                gender: gender
            }),
            contentType:"application/json;charset=UTF-8",
            dataType:"json",
            success : function (data){
                if(data==true){
                    alert("注册成功");
                    window.top.location="${pageContext.request.contextPath}/Login";
                }else {
                    alert("添加失败");
                }
            },
            error: function (){
                alert("用户名已经被注册");
            }
        });

    }

</script>

</body>
</html>
