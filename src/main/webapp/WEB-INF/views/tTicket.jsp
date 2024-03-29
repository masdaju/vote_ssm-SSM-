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
    <title>进货管理</title>
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
            background-color: #00ff0d;
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
            border: 1px solid #00ff0d;
            border-width:1px 0 1px 0;
            border:2px inset #ffffff;
        }
        .biaoge tr {
            border: 1px solid #ffffff;
        }
        .biaoge tr:nth-child(odd){
            background-color: #aafec2;
        }
        .biaoge tr:nth-child(even){
            background-color:#ffffff;
        }
        /*样式可以根据需要自行调整*/
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
    </style>
</head>
<body>
<input type="hidden" id="userId" value="${user.getUserName()}">
<table class="biaoge" style="width: 100%">
    <tr>
        <th>投票ID</th>
        <th>标题</th>
        <th>赞成</th>
        <th>反对</th>
        <th>每人限投</th>
        <th>状态</th>
        <th colspan="3">操作<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></th>
    </tr>
    <tbody id="goodsL">
    <c:forEach items="${TicketList}" var="t" varStatus="status">
        <tr>
            <input type="hidden" id="ntime${status.index}" value="${t.ntime}">
            <input type="hidden" id="context${status.index}" value="${t.context}">
            <td><input type="hidden" id="id${status.index}" value="${t.vid}">${t.vid}</td>
            <td><input type="hidden" id="title${status.index}" value="${t.title}">${t.title}</td>
            <td><input type="hidden" id="agree${status.index}" value="${t.agree}">${t.agree}</td>
            <td><input type="hidden" id="disagree${status.index}" value="${t.disagree}">${t.disagree}</td>
            <td><input type="hidden" id="lim${status.index}" value="${t.lim}">${t.lim}</td>
            <td><input type="hidden" id="state${status.index}" value="${t.state}">
                <c:if test="${t.state == 0}">
                    投票已结束
                </c:if>
                <c:if test="${t.state == 1}">
                    投票进行中
                </c:if>

            </td>

            <td><button id="changebtn${status.index}" onclick="agree(${status.index})" class="btn"><span>赞成</span></button></td>
            <td><button id="changebtn${status.index}" onclick="disagree(${status.index})" class="btn"><span>反对</span></button></td>
            <td><button id="vid${status.index}" class="btn" onclick="redirectToDetail(${t.vid})"><span>查看详情</span></button></td>
        </tr>
    </c:forEach>
    </tbody>

</table>
</body>
<script>
    function redirectToDetail(vid) {
        window.open("${pageContext.request.contextPath}/TicketManage/detailVid/" + vid)
    }
    <%--function Ndetails(index){--%>
    <%--    let title = $("#title"+index).val();--%>
    <%--    let agree = $("#agree"+index).val();--%>
    <%--    let disagree = $("#disagree"+index).val();--%>
    <%--    let context = $("#context"+index).val();--%>
    <%--    let lim = $("#lim"+index).val();--%>
    <%--    let state = $("#state"+index).val();--%>
    <%--    let ntime = $("#ntime"+index).val();--%>
    <%--    &lt;%&ndash;location.href = "${pageContext.request.contextPath}/TicketManage/detail";&ndash;%&gt;--%>

    <%--    $.ajax({--%>
    <%--        url: "${pageContext.request.contextPath}/TicketManage/detail",--%>
    <%--        type: "post",--%>
    <%--        data: JSON.stringify({--%>
    <%--            title: title,--%>
    <%--            agree: agree,--%>
    <%--            disagree: disagree,--%>
    <%--            context: context,--%>
    <%--            lim: lim,--%>
    <%--            state: state,--%>
    <%--            ntime: ntime--%>
    <%--        }),--%>
    <%--        contentType: "application/json;charset=UTF-8",--%>
    <%--        dataType: "json",--%>

    <%--    });--%>
    <%--}--%>


    function agree(index){
        if ($("#state"+index).val()==='0'){
            alert("投票已经结束")
        }else{
            let lim = $("#lim"+index).val();
            let id = $("#id"+index).val();
            let username=$("#userId").val();
            $.ajax({
                url: '${pageContext.request.contextPath}/TicketManage/forVerify',
                method: 'POST', // 将请求方法从 GET 更改为 POST
                contentType:"application/json;charset=UTF-8",
                data: JSON.stringify({ vid: id, username: username,lim:lim}),
                success: function(response) {
                    // 处理返回的 true 或 false
                    if (response===true){
                        alert("超过限定票数")
                    }    else{
                        $.ajax({
                            url:"${pageContext.request.contextPath}/TicketManage/voteAgree",
                            type : "post",
                            data : JSON.stringify({
                                vid:id,
                                username:username
                            }),
                            contentType:"application/json;charset=UTF-8",
                            dataType:"json",
                            success : function (data){
                                if(data===true){
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

                }
            });
        }
    }

    function disagree(index){
        if ($("#state"+index).val()==='0'){
            alert("投票已经结束")
        }else{

        let lim = $("#lim"+index).val();
        let id = $("#id"+index).val();
        let username=$("#userId").val();
            $.ajax({
                url: '${pageContext.request.contextPath}/TicketManage/forVerify',
                method: 'POST', // 将请求方法从 GET 更改为 POST
                contentType:"application/json;charset=UTF-8",
                data: JSON.stringify({ vid: id, username: username,lim:lim }),
                success: function(response) {
                    // 处理返回的 true 或 false
                if (response===true){
                    alert("超过限定票数")
                }    else{
                    $.ajax({
                        url:"${pageContext.request.contextPath}/TicketManage/voteDisagree",
                        type : "post",
                        data : JSON.stringify({
                            vid:id,
                            username:username
                        }),
                        contentType:"application/json;charset=UTF-8",
                        dataType:"json",
                        success : function (data){
                            if(data===true){
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

                }
            });
        }
    }

</script>
</html>
