

<%@page import="entity.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Homepage</title>
        <link href="styleSheet/CreateUserCss.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <%@include file="includes/Menu.jsp" %>
        <h1>Front page!</h1>
        <a href="CreateUser.jsp"> New User </a>  
        <br>
        <a href="Login.jsp"> login </a>
        <br>
        <a href="Order.jsp"> Order </a>
        
        <%
            if(session.getAttribute("user") != null){
            Object o = session.getAttribute("user");
            User user = (User) o;
            %>
            <p>Logged in as</p>
            <a href="UserPage.jsp"> <%out.print(user.getUsername());%> </a>
            <%
            }
        %>
    </body>
</html>
