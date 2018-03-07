<%-- 
    Document   : CreateUser
    Created on : Feb 27, 2018, 12:54:25 AM
    Author     : Perlt
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>New user</title>
        <link href="styleSheet/CreateUserCss.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <%@include file="includes/Menu.jsp" %>
        <div id="createUser">
            <h1>New User</h1>
            <form action="CreateUserControl" method="post"> Username: <br>
                <input type="text" name="username"> <br> Password <br>
                <input type="password" name="password"> <br> <br>
                <input type="submit" value="Enter">
            </form>
        </div>
    </body>
</html>
