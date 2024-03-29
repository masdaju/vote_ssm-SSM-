<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: MIZUGI
  Date: 2024/1/12
  Time: 21:33
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<meta charset="utf-8">
<title>详情</title>
<link rel="stylesheet" type="text/css" href="style.css">
<body>

<!-- Table goes in the document BODY -->
<table class="hovertable">
    <c:forEach items="${lsit}" var="p" varStatus="status">
    <tr>
        <th colspan="2">供应商详情</th>
    </tr>
    <tr onmouseover="this.style.backgroundColor='#ffff66';" onmouseout="this.style.backgroundColor='#d4e3e5';">
        <td>供应商编码</td><td>${p.prodesc}</td>
    </tr>
    <tr onmouseover="this.style.backgroundColor='#ffff66';" onmouseout="this.style.backgroundColor='#d4e3e5';">
        <td>供应商名称</td><td>${p.proname}</td>
    </tr>
    <tr onmouseover="this.style.backgroundColor='#ffff66';" onmouseout="this.style.backgroundColor='#d4e3e5';">
        <td>联系人</td><td>${p.procontact}</td>
    </tr>
    <tr onmouseover="this.style.backgroundColor='#ffff66';" onmouseout="this.style.backgroundColor='#d4e3e5';">
        <td>联系电话</td><td>${p.prophone}</td>
    </tr>
    <tr onmouseover="this.style.backgroundColor='#ffff66';" onmouseout="this.style.backgroundColor='#d4e3e5';">
        <td>联系地址</td><td>${p.proaddress}</td>
    </tr>
    <tr onmouseover="this.style.backgroundColor='#ffff66';" onmouseout="this.style.backgroundColor='#d4e3e5';">
        <td>传真</td><td>${p.profax}</td>
    </tr>
    <tr onmouseover="this.style.backgroundColor='#ffff66';" onmouseout="this.style.backgroundColor='#d4e3e5';">
        <td>供应商详情</td><td>${p.prodesc}</td>
    </tr>
    <tr onmouseover="this.style.backgroundColor='#ffff66';" onmouseout="this.style.backgroundColor='#d4e3e5';">
        <td>创建时间</td><td>${p.creationdate}</td>
    </tr>
    <tr style="background-color:#ffffff;text-align:center">
        <td colspan="2"><a onclick=goBack()>返回列表</a></td>
    </tr>
    </c:forEach>
</table>
<script>
    function goBack() {
        window.history.back()
    }


</script>
</body>
</html>