<%--
  Created by IntelliJ IDEA.
  User: MIZUGI
  Date: 2023/12/28
  Time: 11:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <title>Vote Detail</title>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery-3.6.0.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/layui.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/layui.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/echarts.min.js"></script>

    <!-- Include your rich text editor library, for example, if using CKEditor -->

</head>
<body class="layui-layout-body">
<div class="layui-container">
    <div class="layui-row">
        <div class="layui-col-md12">

            <input type="hidden" id="userId" value="${user.getUserName()}">
            <input type="hidden" id="id" value="${naiyou.vid}">
            <input type="hidden" id="lim" value="${naiyou.lim}">
            <input type="hidden" id="state" value="${naiyou.state}">
            <h1>${naiyou.title}</h1>
            <div class="layui-form">
                <div class="layui-form-item">
                    <h3>
                    <label class="layui-form-label">投票状态:</label>
                    <div class="layui-input-block">
                        <span>
                            <c:if test="${naiyou.state == 0}">
                                投票已结束
                            </c:if>
                            <c:if test="${naiyou.state == 1}">
                                投票进行中
                            </c:if>
                        </span>
                    </div>
                    </h3>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">每人限投${naiyou.lim}票</label>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">发布时间:</label>
                    <div class="layui-input-block">
                        <span>${naiyou.ntime}</span>
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">赞成:</label>
                    <div class="layui-input-block">
                        <span>${naiyou.agree}</span>
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">反对:</label>
                    <div class="layui-input-block">
                        <span>${naiyou.disagree}</span>
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">文本内容:</label>
                    <div class="layui-input-block">
                        <!-- Use your rich text editor here, replace 'editor1' with the actual id of your text area -->
                        <textarea id="editor1" style="width: 410px; height: 200px;">${naiyou.context}</textarea>
                        <div id="pieChart" style="width: 500px; height: 300px; float: right;"></div>
                    </div>

                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">发布时间:</label>
                    <div class="layui-input-block">
                        <span>${naiyou.ntime}</span>
                    </div>
                </div>

                <div class="layui-form-item">
                    <div class="layui-input-block">
                        <button id="a" onclick="agree()" class="layui-btn"><span>赞成</span></button>
                        <button id="d" onclick="disagree()" class="layui-btn"><span>反对</span></button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
<script>
    // 使用ECharts绘制饼图
    $(document).ready(function() {
        // 初始化echarts实例
        const myChart = echarts.init(document.getElementById('pieChart'));

        // 饼图配置
       const option = {
            tooltip: {
                trigger: 'item'
            },
            legend: {
                top: '5%',
                left: 'center'
            },
            series: [
                {
                    name: 'Access From',
                    type: 'pie',
                    radius: ['40%', '70%'],
                    avoidLabelOverlap: false,
                    itemStyle: {
                        borderRadius: 10,
                        borderColor: '#fff',
                        borderWidth: 2
                    },
                    label: {
                        show: false,
                        position: 'center'
                    },
                    emphasis: {
                        label: {
                            show: true,
                            fontSize: 40,
                            fontWeight: 'bold'
                        }
                    },
                    labelLine: {
                        show: false
                    },
                    data: [
                        {
                            value: ${naiyou.agree},
                            name: '赞成',
                            itemStyle: {
                                color: '#5cb85c'  // 赞成的颜色
                            }
                        },
                        {
                            value: ${naiyou.disagree},
                            name: '反对',
                            itemStyle: {
                                color: '#d9534f'  // 反对的颜色
                            }
                        }
                    ],

                }
            ]
        };

        // 使用刚指定的配置项和数据显示图表。
        myChart.setOption(option);
    });
    function agree(){
        if ($("#state").val()==0){
            alert("投票已经结束")
        }else{
            let lim = $("#lim").val();
            let id = $("#id").val();
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

    function disagree(){
        if ($("#state").val()==0){
            alert("投票已经结束")
        }else{

            let lim = $("#lim").val();
            let id = $("#id").val();
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

