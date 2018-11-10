<%@ page import="po.CartLogDao" %><%--
  Created by IntelliJ IDEA.
  User: 20163
  Date: 2018/5/21
  Time: 19:09
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
    dao.deleteBook(request.getParameter("bookName"));
%>
<p><font size="6" color="black"><b>商品已移出购物车！</b></font></p><br><br>
<div>
    <form action="homepage.jsp">
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" value="返回">
    </form>
</div>
</body>
</html>
