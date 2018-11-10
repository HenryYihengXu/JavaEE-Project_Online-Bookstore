<%@ page import="po.BuyLogDao" %><%--
  Created by IntelliJ IDEA.
  User: 20163
  Date: 2018/5/21
  Time: 11:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body bgcolor="#ffd700">
<%
    BuyLogDao dao = new BuyLogDao();
    dao.buyBooks(request.getParameter("bookName"), Integer.parseInt(request.getParameter("price")),
            Integer.parseInt(request.getParameter("number")));
%>
<p align="center"><font size="6" color="black"><b>购买成功，将尽快为您发货！</b></font></p><br><br>
<div align="center">
    <form action="homepage.jsp">
        <input type="submit" value="返回">
    </form>
</div>
</body>
</html>
