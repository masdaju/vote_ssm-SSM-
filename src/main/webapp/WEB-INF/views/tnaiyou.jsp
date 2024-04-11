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
    <title>投票管理</title>
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
<table class="biaoge" style="width: 100%">
<tr>
    <th>投票ID</th>
    <th>没人限投票数</th>
    <th>标题</th>
    <th>发布时间</th>
    <th>状态</th>
    <th colspan="3">操作<span><input type="text" id="sid" placeholder="通过id查找" value='' ><button id="confirm"  onclick="findnaiyou()">确认</button></span>
        <button id="addButton" class="btn">添加投票</button></th>
</tr>
<tbody id="naiyouL">
<c:forEach items="${naiyouList}" var="n" varStatus="status">
    <tr>

        <td><input type="hidden" id="vid${status.index}" value="${n.vid}">${n.vid}</td>
        <td><input type="hidden" id="lim${status.index}" value="${n.lim}">${n.lim}</td>
      <input type="hidden" id="context${status.index}" value="${n.context}">
        <td><input type="hidden" id="title${status.index}" value="${n.title}">${n.title}</td>
        <td><input type="hidden" id="title${status.index}" value="${n.ntime}">${n.ntime}</td>
        <td><input type="hidden" id="state${status.index}" value="${n.state}">
            <c:if test="${n.state == 0}">
               投票已结束
            </c:if>
            <c:if test="${n.state == 1}">
                投票进行中
            </c:if>
        </td>
        <td><button id="changebtn${status.index}" onclick="ssss(${status.index})" class="btn"><span>修改信息</span></button></td>
        <td><button id="deletebtn${status.index}" onclick="deleteN(${status.index})" class="btn"><span>删除投票</span></button></td>
        <td><button id="vid${status.index}" class="btn" onclick="redirectToDetail(${n.vid})"><span>查看详情</span></button></td>
    </tr>
</c:forEach>
</tbody>
</table>

<div id="addModal" class="modal">
    <!-- 添加模块的内容 -->
    <h2>添加投票</h2>
    <div><input type="text" id="alim" placeholder="限定票数"></div>
    <div><input type="text" id="atitle" placeholder="输入标题"></div>
    <div><textarea id="acontext" placeholder="请输入文本类容" style="width: 1165px; height: 450px;"></textarea></div>

    <button id="quxiaoButton" onclick="">取消</button>
    <button id="saveButton"  onclick="addVote()">保存</button>
</div>


<div id="changeModal" class="modal">
    <!-- 修改模块的内容 -->
    <h2>修改信息</h2>
    <div><input type="hidden" id="cid" placeholder="请输入投票id"></div>
    <div><input type="text" id="clim" placeholder="每人限投"></div>
    <div><input type="text" id="ctitle" placeholder="输入标题"></div>
    <div><textarea id="ccontext" placeholder="请输入文本类容" style="width: 1165px; height: 380px;"></textarea></div>

    <div>状态：
        <select id="cstate" name="cstate">
            <option value="0">投票已经结束</option>
            <option value="1">投票进行中</option>
        </select></div>
    <button id="quxiaoButton-change">取消</button>
    <button id="saveButton-change"  onclick="changeNaiyou()">保存</button>
</div>

</body>
<script>
    function findnaiyou() {
        const sid = document.getElementById('sid').value;
        console.log(sid)
        if (sid==""){
            window.location.href = "${pageContext.request.contextPath}/NaiyouManage/Naiyou" ;
        }else {
        window.location.href = "${pageContext.request.contextPath}/NaiyouManage/selectVid/" + sid;
        }
    }
    //查看详情
    function redirectToDetail(vid) {
        window.location.href = "${pageContext.request.contextPath}/TicketManage/detailVid/" + vid;
    }
    //添加
    function addVote(){
        let lim =$("#alim").val();
        let context = $("#acontext").val();
        let title = $("#atitle").val();
        if(context==null||context===""){
            return alert("未填写内容")
        }else if(title==null||title===""){
            return alert("未填写标题")
        }else if (lim==null||lim===""){
            return  alert("未填写限定票数")
        }
        $.ajax({
            url:"${pageContext.request.contextPath}/NaiyouManage/insertN",
            type : "post",
            data : JSON.stringify({
                context:context,
                title:title,
                lim:lim,
            }),
            contentType:"application/json;charset=UTF-8",
            dataType:"json",
            success : function (data){
                if(data==true){
                    alert("添加成功");
                    location.reload();
                }else {
                    alert("添加失败");
                }
            },
            error: function (){
                alert("添加失败");
            }
        });

        clear();
        document.getElementById('addModal').style.display = 'none';
    };
//删除
    function deleteN(index) {
        let id = $("#vid" + index).val();

        // Use confirm dialog to ask for user confirmation
        let userConfirmed = confirm("确定删除吗?");

        if (userConfirmed) {
            $.ajax({
                url: "${pageContext.request.contextPath}/NaiyouManage/deleteN",
                type: "post",
                data: JSON.stringify({
                    vid: id
                }),
                contentType: "application/json;charset=UTF-8",
                dataType: "json",
                success: function (data) {
                    if (data === true) {
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


    //修改
    function changeNaiyou(){
        let vid = $("#cid").val();
        let lim=$("#clim").val();
        let context = $("#ccontext").val();
        let title = $("#ctitle").val();
        let state = $("#cstate").val();
        if(vid==null||vid===""){
            return alert("未输入id")
        }else if(context==null||context===""){
            return alert("未输入内容")
        } else if(title==null||title===""){
            return alert("未输入标题")
        }
        $.ajax({
            url:"${pageContext.request.contextPath}/NaiyouManage/updateN",
            type : "post",
            data : JSON.stringify({
                vid:vid,
                context:context,
                title:title,
                state:state,
                lim:lim
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
        document.getElementById('addModal').style.display = 'none';
    }

    // 点击按钮显示添加模块
    document.getElementById('addButton').addEventListener('click', function() {
        document.getElementById('addModal').style.display = 'block';
    });
    function ssss(index){
        $("#cid").val($("#vid"+index).val());
        $("#clim").val($("#lim"+index).val());
        $("#ccontext").val($("#context"+index).val());
        $("#ctitle").val($("#title"+index).val());
        $("#cstate").val($("#state"+index).val())
        document.getElementById('changeModal').style.display='block';
    }
    //点击取消按钮
    document.getElementById('quxiaoButton').addEventListener('click',function (){
        clear();
        document.getElementById('addModal').style.display = 'none';
    });
    document.getElementById('quxiaoButton-change').addEventListener('click',function (){
        clear();
        document.getElementById('changeModal').style.display = 'none';
    });
    function clear(){
        document.getElementById("alim").value='';
        document.getElementById("acontext").value='';
        document.getElementById("atitle").value='';
        document.getElementById("ccontext").value='';
        document.getElementById("cid").value='';
        document.getElementById("clim").value='';
        document.getElementById("ctitle").value='';
        document.getElementById("cstate").value='';
    }
</script>
</html>
