<%@ page import="po.BookDao" %>
<%@ page import="po.Book" %><%--
  Created by IntelliJ IDEA.
  User: 20163
  Date: 2018/5/20
  Time: 19:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    BookDao bookDao = new BookDao();
    Book book = bookDao.getBook(request.getParameter("bookName"));
    if (book == null) {
%>
<p align="center"><font size="6"><b>此书籍不存在！</b></font> </p>
<%
    } else {
%>

<table align="center" border="0">
    <tr>
        <td style="width: 140px" bgcolor="#adff2f">书名</td>
        <td style="width: 140px" bgcolor="#7fffd4">类型</td>
        <td style="width: 140px" bgcolor="#adff2f">原价</td>
        <td style="width: 140px" bgcolor="#7fffd4">现价</td>
        <td bgcolor="#adff2f">操作</td>
    </tr>
    <tr>
        <td bgcolor="#7fffd4"><%=book.getBookName()%></td>
        <td bgcolor="#adff2f"><%=book.getType()%></td>
        <td bgcolor="#7fffd4"><%=book.getOriginPrice()%></td>
        <td bgcolor="#adff2f"><%=book.getCurrentPrice()%></td>
        <td bgcolor="#7fffd4"><form action="afterLookUp.jsp">
            <input type="hidden" name="DName" value="<%=book.getBookName()%>">
            <input type="button" value="立即购买" onclick="buy()">
            <input type="submit" value="加入购物车" onclick="addToCart()">
        </form></td>
    </tr>
</table>
<%
    }
%>
</body>
</html>
