<%@page import="java.util.ArrayList"%>
<%@page import="entity.OrderEntity"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page import="entity.User"%>
<%@page import="DatabaseAcces.DataMapper"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link href="styleSheet/CreateBorder.css" rel="stylesheet" type="text/css"/>
    </head>

    <body>
        <%@include file="includes/Menu.jsp" %>
        <h1>Order history Admin</h1>
        <%
            DataMapper dm = new DataMapper();
            User user = (User) session.getAttribute("user");
            List<OrderEntity> list = dm.getAllOrders(user);
        %>
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-4">
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th>Order id</th>
                                <th>Price</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                List<Integer> numList = new ArrayList<>();
                                for (OrderEntity x : list) {
                                    if (!numList.contains(x.getOrderId())) {
                            %>
                            <tr>
                                <td><% out.print(x.getOrderId()); %></td>
                                <td><% out.print(x.getPrice()); %></td>
                                <td><form action="OrderHistoryAdmin.jsp" method="post"> 
                                        <input type="hidden" name="orderId" value="<% out.print(x.getOrderId()); %>"> 
                                        <input type="submit" class="btn btn-primary" value="More info">
                                    </form></td>
                                    <%
                                                numList.add(x.getOrderId());
                                            }
                                        }%>
                            </tr>
                        </tbody>
                    </table>
                </div>

                <div class="col-md-4">
                    <% if (request.getParameter("orderId") != null) {
                            int orderId = Integer.parseInt(request.getParameter("orderId"));
                            List<OrderEntity> orderList = dm.getOrderListById(orderId);
                            int totalPrice = 0;
                    %>


                    <div class="makeBorder">
                        <%
                            for (OrderEntity x : orderList) {
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
                        <p>Total price: <% out.print(totalPrice);%></p>
                    </div>
                </div>
                <% }%>
                <div class="col-md-4">
                    <div class="makeFixed">
                        <img src="styleSheet/cupcake.jpg" class="img-rounded" width="100%" height="100%">
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>


