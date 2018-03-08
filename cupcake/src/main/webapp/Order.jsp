<%-- 
    Document   : Order
    Created on : Feb 27, 2018, 3:40:39 PM
    Author     : Perlt
--%>

<%@page import="entity.OrderEntity"%>
<%@page import="entity.Bottom"%>
<%@page import="java.util.List"%>
<%@page import="DatabaseAcces.DataMapper"%>
<%@page import="entity.Topping"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Order</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link href="styleSheet/OrderCss.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <%@include file="includes/Menu.jsp" %>
        <%
            DataMapper dm = new DataMapper();
            List<Topping> toppingList = dm.getToppingList();
            List<Bottom> bottomList = dm.getBottomList();
        %>
        <h1>Order</h1>
        <div class="container-fluid">
            <div class="row">
            <form action="AddToCart" method="post">
                <div class="col-md-3">
                    <%            if (session.getAttribute("shoppingList") != null) {
                            List<OrderEntity> shoppingList = (List<OrderEntity>) session.getAttribute("shoppingList");
                    %>
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th>Topping</th>
                                <th>Bottom</th>
                                <th>Price</th>
                                <th>Amount</th>
                            </tr>
                        </thead>
                        <tbody>
                            <% for (OrderEntity x : shoppingList) {
                            %>
                            <tr>
                                <td><% out.print(x.getTopping()); %></td>
                                <td><% out.print(x.getBottom()); %></td>
                                <td><% out.print(x.getPrice()); %></td>
                                <td><% out.print(x.getAmount()); %></td>
                                <%}%>
                            </tr>
                        </tbody>
                    </table>
                    <%}%>
                    <p>Amount</p>
                    <div class="form-group">
                        <select name="amount">
                            <option value="1">1</option>
                            <option value="2">2</option>
                            <option value="3">3</option>
                            <option value="4">4</option>
                            <option value="5">5</option>
                        </select>
                    </div>

                    <input type="submit" value="Add to cart">
                    <br>
                    <!--<form action="BuyControl">  <input type="submit" value="buy"> </form>-->
                </div>
                    
                <div class="col-md-2">
                    <div id="middlePadding">
                        <h3> Topping </h3>
                        <div class="form-group">
                            <select name="topping">
                                <%
                                    for (Topping x : toppingList) {
                                %>
                                <option value="<% out.print(x.getName()); %>" checked> <% out.print(x.getName() + " " + x.getPrice() + "$"); %> 
                                    <%
                                        }
                                    %>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="col-md-2">
                    <h3> Bottom </h3>
                    <div class="form-group">
                        <select name="bottom">  
                            <%
                                for (Bottom x : bottomList) {
                            %>
                            <option value="<% out.print(x.getName()); %>"> <% out.print(x.getName() + " " + x.getPrice() + "$"); %> </option>
                            <%
                                }
                            %>
                        </select>
                    </div>
                </div>
                <div class="col-md-5">
                    <img src="styleSheet/cupcake.jpg" class="img-rounded" width="100%" height="100%">
                </div>
            </form>
        </div>
        <!--TODO: fix so you can buy and the button is not wired placed-->
        </div>
    </body>

</html>
