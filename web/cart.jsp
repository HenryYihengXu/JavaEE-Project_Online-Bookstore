<%@ page import="po.CartLogDao" %>
<%@ page import="java.util.List" %>
<%@ page import="po.CartLog" %><%--
  Created by IntelliJ IDEA.
  User: 20163
  Date: 2018/5/21
  Time: 11:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div style="margin-left: 100px">
<%
    CartLogDao dao = new CartLogDao();
    List list = dao.getCartLogByUser();
    if (list.isEmpty()) {
%>
<p align="center"><font size="6" color="black"><b>购物车为空，快去选购书籍吧</b></font></p><br><br>
<%
    } else {
%>

<table align="center" border="0">
    <tr>
        <td style="width: 140px" bgcolor="#adff2f">书名</td>
        <td style="width: 140px" bgcolor="#7fffd4">数量</td>
        <td style="width: 140px" bgcolor="#adff2f">总价</td>
        <td bgcolor="#7fffd4">操作</td>
    </tr>

    <%
        for (int i = 0; i < list.size(); i++) {
            CartLog log = (CartLog) list.get(i);
            //System.out.println(i);
    %>
    <tr>
        <td bgcolor="#7fffd4"><%=log.getBookName()%></td>
        <td bgcolor="#adff2f"><%=log.getNumber()%></td>
        <td bgcolor="#7fffd4"><%=log.getPrice()%></td>
        <td bgcolor="#adff2f">
            <form action="afterCart.jsp">
                <input type="hidden" name="bookName" value="<%=log.getBookName()%>">
                <input type="hidden" name="number" value="<%=log.getNumber()%>">
                <input type="hidden" name="price" value="<%=log.getPrice()%>">
                <input id="<%=i%>" type="submit" value="处理">
            </form>
        </td>
    </tr>
    <%
        }
        }
    %>
</table>
</div>
</body>
</html>
