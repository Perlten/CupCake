<%-- 
    Document   : OrderHistory
    Created on : Mar 1, 2018, 5:25:08 PM
    Author     : Perlt
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="entity.OrderEntity"%>
<%@page import="java.util.List"%>
<%@page import="entity.User"%>
<%@page import="DatabaseAcces.DataMapper"%>
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
        <h1>Order history</h1>
        <% 
            DataMapper dm = new DataMapper();
            User user = (User) session.getAttribute("user");
            List<OrderEntity> list = dm.getListByUserId(user);
        %>
        
        <%
            List<Integer> numList = new ArrayList<>();
            for(OrderEntity x : list){
                if(!numList.contains(x.getOrderId())){
        %>
                <p> Order id: <% out.print(x.getOrderId()); %> Price: <% out.print(x.getPrice() * x.getAmount()); %>  </p>
                <form action="EkstraOrderInfo.jsp" method="post">
                    <input type="hidden" name="orderId" value="<% out.print(x.getOrderId()); %>">
                    <input type="submit" class="btn btn-primary" value="More info">
                </form>
                <%
                numList.add(x.getOrderId());
                }
            }%>

        
    </body>
</html>
