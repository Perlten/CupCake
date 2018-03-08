

<%@page import="entity.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <title>Homepage</title>
        <link href="styleSheet/CreateUserCss.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <%@include file="includes/Menu.jsp" %>
        <h1>Front page!</h1>
        <form action="CreateUser.jsp"> <input type="submit" class="btn btn-primary" value="Create user"> </form>
        <form action="Login.jsp"> <input type="submit" class="btn btn-primary" value="Login"></form>
        <form action="Order.jsp"> <input type="submit" class="btn btn-primary" value="Order"></form>
        
        <%
            if(session.getAttribute("user") != null){
            Object o = session.getAttribute("user");
            User user = (User) o;
            %>
            <br>
            <p>Logged in as</p>
            <form action="UserPage.jsp"> <input type="submit" class="btn btn-primary" value="<% out.print(user.getUsername()); %>"> </form>
            <%
            }
        %>
    </body>
</html>
