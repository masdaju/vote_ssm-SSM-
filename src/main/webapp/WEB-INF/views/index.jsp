<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>投票管理系统喵</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="//cdn.staticfile.org/layui/2.9.2/css/layui.css" rel="stylesheet">
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery-3.6.0.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/layui.js"></script>

</head>
<body>
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo layui-hide-xs layui-bg-black">投票管理系统</div>
        <!-- 头部区域（可配合layui 已有的水平导航） -->
        <ul class="layui-nav layui-layout-left">
            <!-- 移动端显示 -->
            <li class="layui-nav-item layui-show-xs-inline-block layui-hide-sm" lay-header-event="menuLeft">
                <i class="layui-icon layui-icon-spread-left"></i>
            </li>

        </ul>
        <div style="margin-top: 130px;margin-left: 250px">
            <iframe src="${pageContext.request.contextPath}/zhuye" id="myframe" width="1200px" height="650px"></iframe>
        </div>
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item layui-hide layui-show-sm-inline-block">
                <a href="javascript:;">
                    ${user.getUserName()}
                </a>
                <dl class="layui-nav-child">
                    <dd><a id="ni" href="javascript:profile()">${user.getUserName()}的个人信息</a></dd>
                    <dd><a href="${pageContext.request.contextPath}/logout">Sign out</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item" lay-header-event="menuRight" lay-unselect>
                <a href="javascript:;">
                    <i class="layui-icon layui-icon-more-vertical"></i>
                </a>
            </li>
        </ul>
    </div>
    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
            <ul class="layui-nav layui-nav-tree" lay-filter="test">
                <li class="layui-nav-item">
                    <a href="javascript:;">投票管理</a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:f('kiroku')">投票记录</a></dd>
                        <dd><a href="javascript:f('NaiyouManage/Naiyou')">投票增&删&改&查</a></dd>

                    </dl>
                </li>
                <li class="layui-nav-item"><a href="javascript:f('TicketManage/Ticket')">参与投票&投票详情</a></li>
                <li class="layui-nav-item"><a href="javascript:f('UsersManage/Users')">用户管理</a></li>
                <li class="layui-nav-item"><a  href="javascript:profile()">${user.getUserName()}的个人信息</a></li>
                <li class="layui-nav-item"><a href="${pageContext.request.contextPath}/UsersManage/logout2">退出登录</a></li>
            </ul>
        </div>
    </div>
    <div class="layui-body">
        <!-- 内容主体区域 -->
        <div style="padding: 15px;">

            <div class="layui-card layui-panel">

            </div>
            <br><br>
        </div>
    </div>
    <div class="layui-footer">
        <!-- 底部固定区域 -->
        底部固定区域
    </div>
</div>
<input type="hidden" id="username" value="${user.getUserName()}">
<script>
    function profile() {
        const username  = document.getElementById('username').value;
        window.top.location = "${pageContext.request.contextPath}/UsersManage/uProfile/" + username;
    }
    layui.use(['element', 'layer', 'util'], function(){
        var element = layui.element;
        var layer = layui.layer;
        var util = layui.util;
        var $ = layui.$;

        //头部事件
        util.event('lay-header-event', {
            menuLeft: function(othis){ // 左侧菜单事件
                layer.msg('展开左侧菜单的操作', {icon: 0});
            },
            menuRight: function(){  // 右侧菜单事件
                layer.open({
                    type: 1,
                    title: '更多',
                    content: '<div style="padding: 15px;">处理右侧面板的操作</div>',
                    area: ['260px', '100%'],
                    offset: 'rt', // 右上角
                    anim: 'slideLeft', // 从右侧抽屉滑出
                    shadeClose: true,
                    scrollbar: false
                });
            }
        });
    });

    window.onscroll=function(){
        document.querySelector('header').classList.toggle('sticky',window.scrollY>0)
    }
    $(".btn").click(function(){
        $('.btn').toggleClass('btnc')
        $('.sidebar').toggleClass('side')
    })
    var iframe = document.getElementById('myframe');
    function f(url){
        // 更改iframe的src属性
        if(url === 'UsersManage/Users' || url === 'NaiyouManage/Naiyou'){
            if(parseInt(${user.getPower()})===parseInt(0)){
                iframe.src = '${pageContext.request.contextPath}/'+url;
            }
            else {
                return alert("权限不足！无权访问")
            }
        }else if(url === 'TicketManage/Ticket'){
            if(parseInt(${user.getPower()})===parseInt(0)||parseInt(${user.getPower()})===parseInt(1)){
                iframe.src = '${pageContext.request.contextPath}/'+url;
            }
            else {
                return alert("权限不足！无权访问")
            }

        }else if(url === 'SelectInventory'){
            if(parseInt(${user.getPower()})===parseInt(1)||parseInt(${user.getPower()})===parseInt(0)||parseInt(${user.getPower()})===parseInt(2)){
                iframe.src = '${pageContext.request.contextPath}/'+url;
            }
            else {
                return alert("权限不足！无权访问")
            }
        }else if(url === 'kiroku'){
            if(parseInt(${user.getPower()})===parseInt(0)){
                iframe.src = '${pageContext.request.contextPath}/'+url;
            }
            else {
                return alert("权限不足！无权访问")
            }

        }else if(url === 'zhuye' || url === 'logout'){
            iframe.src = '${pageContext.request.contextPath}/'+url;
        }
        iframe.src = '${pageContext.request.contextPath}/'+url;
    }

</script>
</body>
</html>