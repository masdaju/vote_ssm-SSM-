<%--
  Created by IntelliJ IDEA.
  User: MIZUGI
  Date: 2024/1/12
  Time: 21:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<meta charset="utf-8">
<title>新增供应商信息</title>
<link rel="stylesheet" type="text/css" href="style.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery-3.6.0.min.js"></script>
<body>
<!-- Table goes in the document BODY -->
<form>
    <table class="hovertable">
        <tr>
            <th colspan="2">新增供应商信息</th>
        </tr>
        <tr onmouseover="this.style.backgroundColor='#ffff66';" onmouseout="this.style.backgroundColor='#d4e3e5';">
            <td>供应商编码</td><td><input type="text" id="proCode"></td>
        </tr>
        <tr onmouseover="this.style.backgroundColor='#ffff66';" onmouseout="this.style.backgroundColor='#d4e3e5';">
            <td>供应商名称</td><td><input type="text" id="proName"></td>
        </tr>
        <tr onmouseover="this.style.backgroundColor='#ffff66';" onmouseout="this.style.backgroundColor='#d4e3e5';">
            <td>联系人</td><td><input type="text" id="proContact"></td>
        </tr>
        <tr onmouseover="this.style.backgroundColor='#ffff66';" onmouseout="this.style.backgroundColor='#d4e3e5';">
            <td>联系电话</td><td><input type="text" id="proPhone"></td>
        </tr>
        <tr onmouseover="this.style.backgroundColor='#ffff66';" onmouseout="this.style.backgroundColor='#d4e3e5';">
            <td>联系地址</td><td><input type="text" id="proAddress"></td>
        </tr>
        <tr onmouseover="this.style.backgroundColor='#ffff66';" onmouseout="this.style.backgroundColor='#d4e3e5';">
            <td>传真</td><td><input type="text" id="proFax"></td></td>
        </tr>
        <tr onmouseover="this.style.backgroundColor='#ffff66';" onmouseout="this.style.backgroundColor='#d4e3e5';">
            <td>供应商详细描述</td><td><textarea cols=30 rows=5 id="proDesc"></textarea></td></td>
        </tr>
        <tr style="background-color:#ffffff;text-align:center">
            <td colspan="2"><input type="button" value="提交" onclick=addd() style="width:100%"></td>
        </tr>
    </table>
</form>
<script>
    function addd() {
        const proCode = $("#proCode").val();
        const proName = $("#proName").val();
        const proContact = $("#proContact").val();
        const proPhone = $("#proPhone").val();
        const proAddress = $("#proAddress").val();
        const proFax = $("#proFax").val();
        const proDesc = $("#proDesc").val();
        // Perform any additional validation if needed
        $.ajax({
            url:"${pageContext.request.contextPath}/addpro",
            type : "post",
            data : JSON.stringify({
                procode: proCode,
                proname: proName,
                procontact: proContact,
                proaddress: proAddress,
                prophone: proPhone,
                profax:proFax,
                prodesc:proDesc,
            }),
            contentType:"application/json;charset=UTF-8",
            dataType:"json",
            success : function (data){
                if(data==true){
                    alert("注册成功");
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