<%@ page import="po.CartLog" %>
<%@ page import="po.CartLogDao" %><%--
  Created by IntelliJ IDEA.
  User: 20163
  Date: 2018/5/20
  Time: 23:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    CartLogDao dao = new CartLogDao();
    dao.addItems(request.getParameter("bookName"), Integer.parseInt(request.getParameter("price")),
            Integer.parseInt(request.getParameter("number")));
%>
<p><font size="6" color="black"><b>添加到购物车成功！</b></font></p><br><br>
<div>
<form action="homepage.jsp">
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" value="返回">
</form>
</div>
</body>
</html>
