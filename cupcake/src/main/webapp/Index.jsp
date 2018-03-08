

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
        <form action="CreateUser.jsp"> <input type="submit" value="Create user"> </form>
        <form action="Login.jsp"> <input type="submit" value="Login"> </form>
        <form action="Order.jsp"> <input type="submit" value="Order"> </form>
        
        <%
            if(session.getAttribute("user") != null){
            Object o = session.getAttribute("user");
            User user = (User) o;
            %>
            <p>Logged in as</p>
            <form action="UserPage.jsp"> <input type="submit" value="<% out.print(user.getUsername()); %>"> </form>
            <%
            }
        %>
    </body>
</html>
