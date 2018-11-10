<%@ page import="po.User" %><%--
  Created by IntelliJ IDEA.
  User: 20163
  Date: 2018/5/21
  Time: 18:08
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
        xmlHttp.open("get", "buySuccess.jsp?bookName="+document.form1.bookName.value+
            "&price="+document.form1.price.value+"&number="+document.form1.number.value, true);
        xmlHttp.onreadystatechange = function() {
            document.getElementById("div2").innerHTML = xmlHttp.responseText;
        }
        xmlHttp.send();
    }
    function userInfo() {
        var xmlHttp = new XMLHttpRequest();
        xmlHttp.open("get", "userInfo.jsp", true);
        xmlHttp.onreadystatechange = function() {
            document.getElementById("contentDiv").innerHTML = xmlHttp.responseText;
        }
        xmlHttp.send();
    }
</SCRIPT>
<body>
<%
    User user =(User) session.getAttribute("currentUser");
%>
<div style="margin-left: 100px">
    请您核对送货信息：<br>
    收件人：&nbsp;&nbsp;&nbsp;&nbsp;<%=user.getUserName()%><br>
    联系电话：<%=user.getPhone()%><br>
    送货地址：<%=user.getAddress()%><br>
    <a href="buySuccess.jsp?bookName=<%=request.getParameter("bookName")%>&price=<%=request.getParameter("price")%>
&number=<%=request.getParameter("number")%>">确认购买</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <a href="userInfo.jsp">修改信息</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <a href="homepage.jsp">返回首页</a>

    <%--<form name="form1">
        <input type="hidden" name="bookName" value="<%=request.getParameter("bookName")%>">
        <input type="hidden" name="price" value="<%=request.getParameter("price")%>">
        <input type="hidden" name="number" value="<%=request.getParameter("number")%>">
        <input type="button" value="确认购买" onclick="buyBook()">
        <input type="button" value="修改信息" onclick="userInfo()">
    </form>--%>
</div>
<div id="div2">

</div>
</body>
</html>
