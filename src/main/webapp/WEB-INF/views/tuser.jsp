<%--
  Created by IntelliJ IDEA.
  User: Yustar
  Date: 2023/11/15
  Time: 21:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>用户管理</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery-3.6.0.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/buttoncss.css">
    <style>
        body{
            width: 100%;
        }
        .biaoge table {
            display: flex;
            width:100%;
            margin:15px 0;
            border:0;
        }
        .biaoge th {
            flex: 1;
            background-color:#00A5FF;
            color:#FFFFFF
        }
        .biaoge,.biaoge th,.biaoge td {
            flex: 1;
            font-size:0.95em;
            text-align:center;
            padding:4px;
            border-collapse:collapse;
        }
        .biaoge th,.biaoge td {
            flex: 1;
            border: 1px solid #20fe32;
            border-width:1px 0 1px 0;
            border:2px inset #ffffff;
        }
        .biaoge tr {
            border: 1px solid #ffffff;
        }
        .biaoge tr:nth-child(odd){
            background-color: #aafedb;
        }
        .biaoge tr:nth-child(even){
            background-color:#ffffff;
        }
        /* 样式可以根据需要自行调整 */
        .modal {
            display: none;
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            background-color: #fff;
            padding: 20px;
            border: 1px solid #ccc;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
        }
        .modal {
            display: none; /* 默认隐藏模态框 */
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            background-color: white;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        /* 模态框标题样式 */
        .modal h2 {
            margin-top: 0;
        }

        /* 输入框样式 */
        .modal input[type="text"],
        .modal input[type="password"],
        .modal select {
            width: 100%;
            margin-bottom: 10px;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 3px;
        }

        /* 按钮样式 */
        .modal button {
            padding: 8px 16px;
            margin-right: 10px;
            border: none;
            border-radius: 3px;
            cursor: pointer;
        }

        /* 取消按钮样式 */
        #quxiaoButton,
        #quxiaoButton-change {
            background-color: #ccc;
        }

        /* 保存按钮样式 */
        #saveButton,
        #saveButton-change {
            background-color: #4CAF50;
            color: white;
        }
    </style>
</head>
<body>
<%--
<c:if test="${flag == 1}">
    男
</c:if>
<c:if test="${flag == 2}">
    女
</c:if>
--%>

<table class="biaoge" style="width: 100%">
    <tr>
        <th>用户ID</th>
        <th>用户名</th>
        <th>密码</th>
        <th>角色</th>
        <th>用户状态</th>
        <th colspan="4">操作<span><input type="text" id="uid" placeholder="通过id查找" value='' >
            <button id="confirm"  onclick="finduser()">确认</button></span>
            <button id="addButton" class="btn">添加账号</button></th>
    </tr>
    <tbody id="userL">
    <c:forEach items="${userList}" var="u" varStatus="status">
        <tr>
            <td><input type="hidden" id="id${status.index}" value="${u.uid}">${u.uid}</td>
            <td><input type="hidden" id="name${status.index}" value="${u.userName}">${u.userName}</td>
            <td><input type="hidden" id="pw${status.index}" value="${u.password}">${u.password}</td>
            <td><input type="hidden" id="powe${status.index}" value="${u.power}">
                <c:choose>
                    <c:when test="${u.power == 0}">
                        管理员
                    </c:when>
                    <c:when test="${u.power == 1}">
                        一般用户
                    </c:when>
                </c:choose>
            </td>
            <td>
                <c:if test="${u.state == 0}">
                    不可用
                </c:if>
                <c:if test="${u.state == 1}">
                    可用
                </c:if>
            </td>

            <td><button id="changebtn${status.index}" onclick="ssss(${status.index})" class="btn"><span>修改信息</span></button></td>
            <td><button id="resetbtn${status.index}" onclick="resetPassord(${status.index})" class="btn"><span>重置密码</span></button></td>
            <td><button id="deletebtn${status.index}" onclick="deleteUser(${status.index})" class="btn"><span>停用账号</span></button></td>
            <td><button id="deletebtn${status.index}" onclick="deleteU(${status.index})" class="btn"><span>删除账号</span></button></td>


        </tr>
    </c:forEach>
    </tbody>
</table>
<div id="addModal" class="modal">
    <!-- 添加模块的内容 -->
    <h2>添加用户</h2>
    <div><input type="text" id="username" placeholder="请输入用户名"></div>
    <div><input type="password" id="password" placeholder="请输入密码"></div>
    <div><input type="password" id="password1" placeholder="确认密码"></div>
    <div>角色：
    <select id="power" name="power">
        <option value="0">管理员</option>
        <option value="1">一般用户</option>
    </select></div>
    <button id="quxiaoButton" onclick="">取消</button>
    <button id="saveButton"  onclick="addUser()">保存</button>
</div>
<div id="changeModal" class="modal">
    <!-- 添加模块的内容 -->
    <h2>修改信息</h2>
    <div><input type="hidden" id="uid-input"></div>
    <div><input type="text" id="username-change" placeholder="请输入用户名"></div>
    <div><input type="password" id="password-change" placeholder="请输入密码"></div>
     <div><input type="password" id="password1-change" placeholder="确认密码"></div>
     <div>角色：
    <select id="power-change" name="power">
        <option value="0">管理员</option>
        <option value="1">一般用户</option>
    </select></div>
    <button id="quxiaoButton-change">取消</button>
    <button id="saveButton-change"  onclick="changeUser()">保存</button>
</div>
</body>
<script>

    function finduser(){
        const uid = document.getElementById('uid').value;
        window.location.href = "${pageContext.request.contextPath}/UsersManage/selectUid/" + uid;
    }
    //修改
    function changeUser(){
        let uid = $("#uid-input").val();//获取选中行的id
        let username = $("#username-change").val();
        let password = $("#password-change").val();
        let password1 = $("#password1-change").val();
        let power = $("#power-change").val()
        if(username==null||username==""){
            clear();
            return alert("用户名不能为空")
        }
        else if(password==null||password==""||password1==null||password1==""){
            clear();
            return alert("密码不能为空")
        } else if (password != password1){
            clear();
            return alert("两次密码不一致");
        }
        $.ajax({
            url:"${pageContext.request.contextPath}/UsersManage/updateUser",
            type : "post",
            data : JSON.stringify({
                uid:uid,
                userName:username,
                password:password,
                power:power
            }),
            contentType:"application/json;charset=UTF-8",
            dataType:"json",
            success : function (data){
                if(data==true){
                    alert("修改成功");
                    location.reload();
                }else {
                    alert("修改失败");
                }
            },
            error: function (){
                alert("修改失败");
            }
        });
        clear();
        document.getElementById('changeModal').style.display = 'none';
    }
    function ssss(index){
        $("#uid-input").val($("#id"+index).val());
        $("#username-change").val($("#name"+index).val());
        $("#power-change").val($("#powe"+index).val());
        document.getElementById('changeModal').style.display='block';
    }
    //重置密码
    function resetPassord(index){
        let id = $("#id"+index).val();
        $.ajax({
            url:"${pageContext.request.contextPath}/UsersManage/resetPw",
            type : "post",
            data : JSON.stringify({
                uid:id
            }),
            contentType:"application/json;charset=UTF-8",
            dataType:"json",
            success : function (data){
                if(data==true){
                    alert("成功");
                    location.reload();
                }else {
                    alert("失败");
                }
            },
            error: function (){
                alert("失败");
            }
        });
    }

    //停用账号
    function deleteUser(index){
        let id = $("#id"+index).val();
        $.ajax({
            url:"${pageContext.request.contextPath}/UsersManage/deleteUser",
            type : "post",
            data : JSON.stringify({
                uid:id
            }),
            contentType:"application/json;charset=UTF-8",
            dataType:"json",
            success : function (data){
                if(data==true){
                    alert("成功");
                    location.reload();
                }else {
                    alert("失败");
                }
            },
            error: function (){
                alert("失败");
            }
        });
    }
    //删除账号
    function deleteU(index) {
        let id = $("#id" + index).val();

        // Use confirm dialog to ask for user confirmation
        let userConfirmed = confirm("确定要删除吗？");

        if (userConfirmed) {
            $.ajax({
                url: "${pageContext.request.contextPath}/UsersManage/deleteU",
                type: "post",
                data: JSON.stringify({
                    uid: id
                }),
                contentType: "application/json;charset=UTF-8",
                dataType: "json",
                success: function (data) {
                    if (data == true) {
                        alert("成功");
                        location.reload();
                    } else {
                        alert("失败");
                    }
                },
                error: function () {
                    alert("失败");
                }
            });
        } else {
            alert("取消删除");
        }
    }

    //添加
    function addUser(){
        let username = $("#username").val();
        let password = $("#password").val();
        let password1 = $("#password1").val();
        let power = $("#power").val();
        if(username==null||username==""){
            clear();
            return alert("用户名不能为空")
        }
        else if(password==null||password==""||password1==null||password1==""){
            clear();
            return alert("密码不能为空")
        } else if (password != password1){
            clear();
            return alert("两次密码不一致");
        }
        $.ajax({
            url:"${pageContext.request.contextPath}/UsersManage/addUser",
            type : "post",
            data : JSON.stringify({
                userName:username,
                password:password,
                power:power,
            }),
            contentType:"application/json;charset=UTF-8",
            dataType:"json",
            success : function (data){
                if(data==true){
                    alert("添加成功");
                    location.reload();
                }else {
                    alert("失败");
                }
            },
            error: function (){
                alert("用户名已经被注册");
            }
        });

        clear();
        document.getElementById('addModal').style.display = 'none';
    };

    function clear(){
        document.getElementById("username").value='';
        document.getElementById("password").value='';
        document.getElementById("password1").value='';
        document.getElementById("username-change").value='';
        document.getElementById("password-change").value='';
        document.getElementById("password1-change").value='';
    }

    // 点击按钮显示添加模块
    document.getElementById('addButton').addEventListener('click', function() {
        document.getElementById('addModal').style.display = 'block';
    });
    // document.getElementById('changebtn').addEventListener('click',function(){
    //    document.getElementById('changeModal').style.display='block';
    // });



    // 点击保存按钮隐藏添加模块
    // document.getElementById('saveButton').addEventListener('click', function() {
    //     document.getElementById('addModal').style.display = 'none';
        // 这里可以添加保存逻辑
    // });
    //点击取消按钮
    document.getElementById('quxiaoButton').addEventListener('click',function (){
        clear();
        document.getElementById('addModal').style.display = 'none';
    });
    document.getElementById('quxiaoButton-change').addEventListener('click',function (){
        clear();
        document.getElementById('changeModal').style.display = 'none';
    });
</script>
</html>
