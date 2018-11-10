<%--
  Created by IntelliJ IDEA.
  User: 20163
  Date: 2018/5/20
  Time: 22:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<SCRIPT LANGUAGE="JavaScript">
    function buyBook() {
        var xmlHttp = new XMLHttpRequest();
        xmlHttp.open("get", "buy.jsp?bookName="+document.form1.bookName.value+
            "&price="+document.form1.price.value+"&number="+document.form1.number.value, true);
        xmlHttp.onreadystatechange = function() {
            document.getElementById("div1").innerHTML = xmlHttp.responseText;
        }
        xmlHttp.send();
    }
    function addBook() {
        var xmlHttp = new XMLHttpRequest();
        xmlHttp.open("get", "addSuccess.jsp?bookName="+document.form1.bookName.value+
            "&price="+document.form1.price.value+"&number="+document.form1.number.value, true);
        xmlHttp.onreadystatechange = function() {
            document.getElementById("div1").innerHTML = xmlHttp.responseText;
        }
        xmlHttp.send();
    }
</SCRIPT>
<body bgcolor="#ffd700">
<div align="center" style="height: 100px; margin-left: 100px; margin-right: 100px; margin-top: 60">
    <form name="form1" action="homepage.jsp">
    <table align="center" border="0">
        <tr>
            <td style="width: 140px" bgcolor="#adff2f">书名</td>
            <td style="width: 140px" bgcolor="#7fffd4">单价</td>
            <td style="width: 140px" bgcolor="#adff2f">数量</td>
            <td bgcolor="#7fffd4">操作</td>
        </tr>
        <tr>
            <td bgcolor="#7fffd4"><%=request.getParameter("bookName")%></td>
            <td bgcolor="#adff2f"><%=request.getParameter("price")%></td>
            <td bgcolor="#7fffd4"><input name="number" type="text" value="1"></td>
            <td bgcolor="#adff2f">
                <input type="hidden" name="bookName" value="<%=request.getParameter("bookName")%>">
                <input type="hidden" name="price" value="<%=request.getParameter("price")%>">
                <input type="button" value="立即购买" onclick="buyBook()">
                <input type="button" value="加入购物车" onclick="addBook()">
                <input type="submit" value="返回">
            </td>
        </tr>
    </table>
    </form>
</div>
<div style="height: 100px; margin-left: 450px; margin-right: 100px; margin-top: 60" id="div1">
</div>
</body>
</html>
