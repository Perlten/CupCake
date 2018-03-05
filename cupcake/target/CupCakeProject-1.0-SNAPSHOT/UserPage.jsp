<%-- 
    Document   : User
    Created on : Feb 27, 2018, 3:28:15 PM
    Author     : Perlt
--%>

<%@page import="entity.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@include file="includes/Menu.jsp" %>
        <% Object o = request.getSession().getAttribute("user");
            User user = (User) o;
        %>

        <p>Username: <% out.print(user.getUsername());%> 
            <br>
            Saldo: <% out.print(user.getSaldo()); %>
        </p>
        
        <p>Add funds</p>
        <form action="AddFunds" method="post">
            <input type="number" name="amount">
            <input type="submit" value="Enter">
        </form>
        <br>
        <form action="OrderHistory.jsp">
            <input type="submit" value="Order history">
        </form>
        <br>
        

        <% if (user.isIsAdmin()) {
        %>
        <a href="AdminPage.jsp"> Admin Page </a>
        <%
        }%>
                
                
    </body>
</html>
