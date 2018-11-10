<%@ page import="po.BookDao" %>
<%@ page import="java.util.List" %>
<%@ page import="po.Book" %><%--
  Created by IntelliJ IDEA.
  User: 20163
  Date: 2018/5/20
  Time: 16:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>

<SCRIPT LANGUAGE="JavaScript">

</SCRIPT>

<body>
<%
    int type = Integer.parseInt(request.getParameter("type"));
    BookDao bookDao = new BookDao();
    List books = bookDao.getBooksByType(type);
%>

<table align="center" border="0">
    <tr>
        <td style="width: 140px" bgcolor="#adff2f">书名</td>
        <td style="width: 140px" bgcolor="#7fffd4">类型</td>
        <td style="width: 140px" bgcolor="#adff2f">原价</td>
        <td style="width: 140px" bgcolor="#7fffd4">现价</td>
        <td bgcolor="#adff2f">操作</td>
    </tr>

    <%
        for (int i = 0; i < books.size(); i++) {
            Book book = (Book)books.get(i);
            //System.out.println(i);
    %>
    <tr>
        <td bgcolor="#7fffd4"><%=book.getBookName()%></td>
        <td bgcolor="#adff2f"><%=book.getType()%></td>
        <td bgcolor="#7fffd4"><%=book.getOriginPrice()%></td>
        <td bgcolor="#adff2f"><%=book.getCurrentPrice()%></td>
        <td bgcolor="#7fffd4"><form action="buyOrCart.jsp">
            <input type="hidden" name="bookName" value="<%=book.getBookName()%>">
            <input type="hidden" name="price" value="<%=book.getCurrentPrice()%>">
            <input id="<%=i%>" type="submit" value="立即购买或加入购物车">
        </form></td>
    </tr>
    <%
        }
    %>
</table>
</body>
</html>
