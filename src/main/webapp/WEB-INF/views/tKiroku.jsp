<%--
  Created by IntelliJ IDEA.
  User: Yustar
  Date: 2023/11/15
  Time: 21:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>库存查看</title>
</head>
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
<body>
<table class="biaoge" style="width: 100%">
    <tr>
        <th>编号</th>
        <th>投票id</th>
        <th>投票人id</th>
        <th>投票人</th>
        <th>投票时间 <button id="addButton" class="btn">清除记录</button></th>

    </tr>
    <tbody id="userL">
    <c:forEach items="${kirokuList}" var="k" varStatus="status">

                <tr >

                    <td><input type="hidden" id="time${status.index}" value="${k.id}">${k.id}</td>
                    <td><input type="hidden" id="id${status.index}" value="${k.vid}">${k.vid}</td>
                    <td><input type="hidden" id="name${status.index}" value="${k.uid}">${k.uid}</td>
                    <td><input type="hidden" id="name${status.index}" value="${k.username}">${k.username}</td>
                    <td><input type="hidden" id="count${status.index}" value="${k.ptime}">${k.ptime}</td>

                </tr>

    </c:forEach>
    </tbody>
</table>
<div id="addModal" class="modal">
    <!-- 添加模块的内容 -->
    <h2>清除记录</h2>
    <div><input type="text" id="vid" placeholder="投票id"></div>
    <div><input type="text" id="uid" placeholder="用户id"></div>

    <button id="quxiaoButton" onclick="">取消</button>
    <button id="saveButton"  onclick="deleteK()">保存</button>
</div>
</body>
<script>
    function deleteK(){
        let vid = $("#vid").val();
        let uid =$("#uid").val();
        $.ajax({
            url:"${pageContext.request.contextPath}/KirokuManage/deleteK",
            type : "post",
            data : JSON.stringify({
                vid:vid,
                uid:uid
            }),
            contentType:"application/json;charset=UTF-8",
            dataType:"json",
            success : function (data){
                if(data==true){
                    alert("删除成功");
                    location.reload();
                }else {
                    alert("删除失败");
                }
            },
            error: function (){
                alert("删除失败");
            }
        });
        clear();
        document.getElementById('addModal').style.display = 'none';
    }

    document.getElementById('quxiaoButton').addEventListener('click',function (){
        clear();
        document.getElementById('addModal').style.display = 'none';
    });

    // 点击按钮显示添加模块
    document.getElementById('addButton').addEventListener('click', function() {
        document.getElementById('addModal').style.display = 'block';
    });
    function clear(){
        document.getElementById("vid").value='';
        document.getElementById("uid").value='';
    }
</script>
</html>
