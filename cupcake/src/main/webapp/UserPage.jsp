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
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <title>JSP Page</title>
        <link href="styleSheet/CreateUserCss.css" rel="stylesheet" type="text/css"/>
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
               <input type="submit" class="btn btn-primary" value="Enter">
        </form>
        <br>
        <form action="OrderHistory.jsp">
               <input type="submit" class="btn btn-primary" value="Order history">
        </form>
        <br>
        

        <% if (user.isIsAdmin()) {
        %>
        <form action="AdminPage.jsp">    <input type="submit" class="btn btn-primary" value="Admin page"> </form>
        <%
        }%>
                
                
    </body>
</html>
