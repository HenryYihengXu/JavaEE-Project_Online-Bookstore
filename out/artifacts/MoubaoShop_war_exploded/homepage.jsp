<%@ page import="po.User" %>
<%@ page import="po.BookDao" %>
<%@ page import="java.util.List" %>
<%@ page import="po.Book" %><%--
  Created by IntelliJ IDEA.
  User: 20163
  Date: 2018/5/14
  Time: 14:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<SCRIPT LANGUAGE="JavaScript">
    function allBooks() {
        var xmlHttp = new XMLHttpRequest();
        xmlHttp.open("get", "allBooks.jsp?type=0", true);
        xmlHttp.onreadystatechange = function() {
            document.getElementById("contentDiv").innerHTML = xmlHttp.responseText;
        }
        xmlHttp.send();
    }
    function discountBooks() {
        var xmlHttp = new XMLHttpRequest();
        xmlHttp.open("get", "allBooks.jsp?type=1", true);
        xmlHttp.onreadystatechange = function() {
            document.getElementById("contentDiv").innerHTML = xmlHttp.responseText;
        }
        xmlHttp.send();
    }
    function academicBooks() {
        var xmlHttp = new XMLHttpRequest();
        xmlHttp.open("get", "allBooks.jsp?type=2", true);
        xmlHttp.onreadystatechange = function() {
            document.getElementById("contentDiv").innerHTML = xmlHttp.responseText;
        }
        xmlHttp.send();
    }
    function novels() {
        var xmlHttp = new XMLHttpRequest();
        xmlHttp.open("get", "allBooks.jsp?type=3", true);
        xmlHttp.onreadystatechange = function() {
            document.getElementById("contentDiv").innerHTML = xmlHttp.responseText;
        }
        xmlHttp.send();
    }
    function literatures() {
        var xmlHttp = new XMLHttpRequest();
        xmlHttp.open("get", "allBooks.jsp?type=4", true);
        xmlHttp.onreadystatechange = function() {
            document.getElementById("contentDiv").innerHTML = xmlHttp.responseText;
        }
        xmlHttp.send();
    }
    function others() {
        var xmlHttp = new XMLHttpRequest();
        xmlHttp.open("get", "allBooks.jsp?type=5", true);
        xmlHttp.onreadystatechange = function() {
            document.getElementById("contentDiv").innerHTML = xmlHttp.responseText;
        }
        xmlHttp.send();
    }
    function searchBook() {
        var xmlHttp = new XMLHttpRequest();
        xmlHttp.open("get", "searchBook.jsp?bookName=" + document.form1.search1.value, true);
        xmlHttp.onreadystatechange = function() {
            document.getElementById("contentDiv").innerHTML = xmlHttp.responseText;
        }
        xmlHttp.send();
    }
    function cart() {
        var xmlHttp = new XMLHttpRequest();
        xmlHttp.open("get", "cart.jsp", true);
        xmlHttp.onreadystatechange = function() {
            document.getElementById("contentDiv").innerHTML = xmlHttp.responseText;
        }
        xmlHttp.send();
    }
    function orders() {
        var xmlHttp = new XMLHttpRequest();
        xmlHttp.open("get", "orders.jsp", true);
        xmlHttp.onreadystatechange = function() {
            document.getElementById("contentDiv").innerHTML = xmlHttp.responseText;
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
    function addGood() {
        var xmlHttp = new XMLHttpRequest();
        xmlHttp.open("get", "addGood.jsp", true);
        xmlHttp.onreadystatechange = function() {
            document.getElementById("contentDiv").innerHTML = xmlHttp.responseText;
        }
        xmlHttp.send();
    }
</SCRIPT>

<head>
    <title>Moubao</title>
</head>
<body bgcolor="#ffd700">
<div style="height: 50px; margin-left: 100px; margin-right: 100px; margin-top: 30">
    <div style="float: left; width: 200px">
        <font size="6"><b>某宝网上书店</b></font>
    </div>
    <div style="float: left; width: 300px; margin-top: 20; margin-left: 20">
        尊敬的用户<%=((User)session.getAttribute("currentUser")).getUserName()%>，欢迎光临！
    </div>
    <div style="margin-top: 19px; float: right">
        <%--<a href="">购物车</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="">所有订单</a>&nbsp;&nbsp;&nbsp;&nbsp;
        <a href="">用户资料</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="login.jsp">退出</a>&nbsp;&nbsp;&nbsp;&nbsp;--%>
        <form action="login.jsp">
            <input type="button" value="购物车" onclick="cart()">&nbsp;&nbsp;&nbsp;&nbsp;
            <input type="button" value="所有订单" onclick="orders()">&nbsp;&nbsp;&nbsp;&nbsp;
            <input type="button" value="用户资料" onclick="userInfo()">&nbsp;&nbsp;&nbsp;&nbsp;
            <input type="submit" value="退出">
        </form>
    </div>
</div>
<div style="height: 50px">
    <hr color="black" size="4">
</div>
<%--<iframe src="login.jsp" style="margin-left: 100px" id="contenFrame">

</iframe>--%>
<div style="margin-left: 100px; margin-right: 100px">
    <div style="float: left; width: 220; height: 1000px; border-right: black; border: 2px">
        <%--<table border="1">
            <tr>
                <td align="top" width="200" height="1000">--%>
                    <form name="form1">
                        <input type="button" value="所有书籍" onclick="allBooks()"><br>
                        <input type="button" value="特价书籍" onclick="discountBooks()"><br>
                        <input type="button" value="学术书籍" onclick="academicBooks()"><br>
                        <input type="button" value="小说书籍" onclick="novels()"><br>
                        <input type="button" value="文学书籍" onclick="literatures()"><br>
                        <input type="button" value="其他书籍" onclick="others()"><br>
                        <input type="button" value="添加书籍" onclick="addGood()"><br><br>
                        <input type="text" name="search1" value="输入书名查询书籍"><br>
                        <input type="button" value="查询" onclick="searchBook()"><br>
                    </form>
                <%--</td>
            </tr>
        </table>--%>

    </div>
    <div style="float: left" id="contentDiv">
        <%
            BookDao bookDao = new BookDao();
            List books = bookDao.getBooksByType(0);
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
    </div>
</div>
</body>
</html>
