<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<meta charset="utf-8">
<title>列表</title>
<link rel="stylesheet" type="text/css" href="style.css">
<body>
<!-- Table goes in the document BODY -->
<table class="hovertable">
    <tr><td colspan="8"><a href="${pageContext.request.contextPath}/toaddpro">新增供应商</a></td></tr>
    <tr>
        <th>供应商编码</th><th>供应商名称</th><th>供应商联系人</th><th>联系电话</th><th>创建时间</th><th colspan="3">操作</th>
    </tr>


    <c:forEach items="${list}" var="p" varStatus="status">
    <tr  onmouseover="this.style.backgroundColor='#ffff66';" onmouseout="this.style.backgroundColor='#d4e3e5';" style="background-color: rgb(212, 227, 229);">

        <td id="id${status.index}" value="${p.procode}">${p.procode}</td>
        <td id="id${status.index}" value="${p.proname}">${p.proname}</td>
        <td id="id${status.index}" value="${p.prodesc}">${p.prodesc}</td>
        <td id="id${status.index}" value="${p.prophone}">${p.prophone}</td>
        <td id="id${status.index}" value="${p.creationdate}">${p.creationdate}</td>
        <td><a id="${status.index}" onclick=prodetail(${p.id}) >详情</a></td>
        <td><a href="#">修改</a></td><td><a href="#">删除</a></td>
    </tr>
    </c:forEach>
</table>
<script>
    function prodetail(id){
        window.location.href = "${pageContext.request.contextPath}/proDetail/"+id
    }
</script>
</body>
</html>