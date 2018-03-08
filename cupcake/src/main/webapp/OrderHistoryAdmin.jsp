<%-- 
    Document   : OrderHistoryAdmin
    Created on : Mar 1, 2018, 7:14:50 PM
    Author     : Perlt
--%>

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
                                <td><form action="AdminEkstraOrderInfo.jsp" method="post"> 
                                        <input type="hidden" name="orderId" value="<% out.print(x.getOrderId()); %>"> 
                                        <input type="submit" value="More info"> 
                                    </form></td>
                                    <%
                                                numList.add(x.getOrderId());
                                            }
                                        }%>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </body>
</html>


