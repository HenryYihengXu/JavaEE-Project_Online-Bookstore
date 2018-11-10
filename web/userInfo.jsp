<%@ page import="po.UserDao" %>
<%@ page import="po.User" %><%--
  Created by IntelliJ IDEA.
  User: 20163
  Date: 2018/5/21
  Time: 13:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body bgcolor="#ffd700">
<%
    User user = (User)session.getAttribute("currentUser");
%>
<div style="margin-left: 450px">
    <form action="userInfo.action">
    用户名：&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="userName" value="<%=user.getUserName()%>"><br>
    密&nbsp;&nbsp;&nbsp;&nbsp;码：&nbsp;&nbsp;&nbsp;&nbsp;<input type="password" name="password" value="<%=user.getPassword()%>"><br>
    联系电话：<input type="text" name="phone" value="<%=user.getPhone()%>"><br>
    送货地址：<input type="text" name="address" value="<%=user.getAddress()%>"><br>
        <p><input type="submit" value="修改"></p>
    </form>
    <form action="homepage.jsp">
        <input type="submit" value="返回">
    </form>
</div>
</body>
</html>
