<%-- 
    Document   : AdminEkstraOrderInfo
    Created on : Mar 1, 2018, 9:49:55 PM
    Author     : Perlt
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="entity.OrderEntity"%>
<%@page import="DatabaseAcces.DataMapper"%>
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
            int totalPrice = 0;
          %>
        

          <%
              for(OrderEntity x : orderList){
                  totalPrice += x.getPrice() * x.getAmount();
                  %>
                  <p> 
                      Order Id: <% out.print(x.getOrderId()); %> <br>
                      Topping: <% out.print(x.getTopping()); %> <br>
                      Bottom: <% out.print(x.getBottom()); %> <br>
                      Price: <% out.print(x.getPrice()); %> <br>
                      Amount: <% out.print(x.getAmount()); %> <br>
                  </p>
                  <p>New price</p>
                  <form action="ChangePrice" method="get">
                      <input type="number" name="newPrice"> 
                      <input type="hidden" name="orderId" value="<% out.print(x.getOrderId()); %>">
                      <input type="hidden" name="topping" value="<% out.print(x.getTopping()); %>">
                      <input type="hidden" name="bottom" value="<% out.print(x.getBottom()); %>">
                      <input type="submit" value="Enter">
                  </form>
                  <%
              }
          %>
          <p>Total price: <% out.print(totalPrice); %></p>
        
    </body>
</html>
