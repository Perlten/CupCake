<%-- 
    Document   : EkstraOrderInfo
    Created on : Mar 1, 2018, 6:58:00 PM
    Author     : Perlt
--%>

<%@page import="java.util.List"%>
<%@page import="entity.User"%>
<%@page import="DatabaseAcces.DataMapper"%>
<%@page import="entity.OrderEntity"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="styleSheet/CreateUserCss.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <%@include file="includes/Menu.jsp" %>
         <%
            int orderId = Integer.parseInt(request.getParameter("orderId"));
            DataMapper dm = new DataMapper();
            List<OrderEntity> orderList = dm.getOrderListById(orderId);
          %>
        

          <%
              for(OrderEntity x : orderList){
                  %>
                  <p> 
                      Order Id: <% out.print(x.getOrderId()); %> <br>
                      Topping: <% out.print(x.getTopping()); %> <br>
                      Bottom: <% out.print(x.getBottom()); %> <br>
                      Price: <% out.print(x.getPrice()); %> <br>
                      Amount: <% out.print(x.getAmount()); %> <br>
                  </p>
                  <%
              }
          %>

    </body>
</html>
