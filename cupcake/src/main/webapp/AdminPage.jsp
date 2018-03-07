<%-- 
    Document   : AdminPage
    Created on : Feb 27, 2018, 8:29:56 PM
    Author     : Perlt
--%>

<%@page import="entity.User"%>
<%@page import="entity.AdminUser"%>
<%@page import="java.util.List"%>
<%@page import="DatabaseAcces.DataMapper"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css.css">
        <title>Admin page</title>
        <link href="styleSheet/CreateUserCss.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <%@include file="includes/Menu.jsp" %>
        <h1>Admin</h1>

        <p><% out.print(session.getAttribute("user")); %></p>

        <form action="OrderHistoryAdmin.jsp">
            <input type="submit" value="All Orders">
        </form>
        
        <br>

        <form action="MakeCupCake" method="get">
            <input type="text" name="name">
            <input type="radio" name="type" value="topping" checked> topping
            <input type="radio" name="type" value="bottom"> bottom
            <br>
            <input type="number" name="price"> Price
            <br>
            <input type="submit" value="Make new cupcake">
        </form>
        
        <form action="AdminPage.jsp" method="post">
            <p>Filter sql</p>
            <input type="text" name="sql">
            <br><br>
            <input type="submit" value="Enter"> 
        </form>

        <%
            String sql = request.getParameter("sql");
            User user = (User) session.getAttribute("user");
            if (sql != null) {
                DataMapper dm = new DataMapper();
                List<AdminUser> list = dm.AdminAccess(sql, user);

                for (AdminUser x : list) {
        %>
        <p> <% out.print(x); %>  </p>
            <form id="inline" action="AdminPageControlDelete" method="get" : inline>
                <input type="hidden" name="origin" value="<% out.print(x.getUserId()); %>">
                <input type="submit" value="delete"> 
            </form>
                <form id="inline" action="AdminPageMakeAdmin" method="post">
                <input type="hidden" name="origin" value="<% out.print(x.getUserId()); %>">
                <input type="submit" value="admin"> 
            </form>
        <%}
            }%>
    </body>
</html>
