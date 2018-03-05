<%-- 
    Document   : Login
    Created on : Feb 27, 2018, 1:59:26 PM
    Author     : Perlt
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
    </head>
    <body>
    <%@include file="includes/Menu.jsp" %>
        <h1>Login</h1>
        <form action="LoginControl" method="post">
            Username: <br>
            <input type="text" name="username"> <br>
            Password <br>
            <input type="password" name="password"> <br> <br>
            <input type="submit" value="Enter" name="submit">
        </form>
        
    </body>
</html>
