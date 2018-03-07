<%-- 
    Document   : Order
    Created on : Feb 27, 2018, 3:40:39 PM
    Author     : Perlt
--%>

<%@page import="entity.Bottom"%>
<%@page import="java.util.List"%>
<%@page import="DatabaseAcces.DataMapper"%>
<%@page import="entity.Topping"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Order</title>
        <link href="styleSheet/CreateUserCss.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <%@include file="includes/Menu.jsp" %>
            <%
                DataMapper dm = new DataMapper();
                List<Topping> toppingList = dm.getToppingList();
                List<Bottom> bottomList = dm.getBottomList();

            %>
        <h1>Order</h1>
        <%
        if(session.getAttribute("shoppingList") != null){
        %>
        <p>Shopping list
            <% out.print(session.getAttribute("shoppingList")); %>
        </p>
        <%}%>
        <h3> Topping </h3>
        <form action="AddToCart" method="post">
            <br>
            <select name="topping">
            <% 
                for (Topping x : toppingList) {
            %>
                <option value="<% out.print(x.getName()); %>" checked> <% out.print(x.getName() + " " + x.getPrice() + "$"); %> 
                <%
                }
            %>
            </select>
            
            <h3> Bottom </h3>
            <select name="bottom">  
            <%
                for (Bottom x : bottomList) {
            %>
            
                <option value="<% out.print(x.getName()); %>"> <% out.print(x.getName() + " " + x.getPrice() + "$"); %> </option>
                <%
                }
            %>
            </select>
            <br> <br>
            <p>Amount</p>
            <select name="amount">
                <option value="1">1</option>
                <option value="2">2</option>
                <option value="3">3</option>
                <option value="4">4</option>
                <option value="5">5</option>
            </select>
            <br> <br>
            <input type="submit" value="Add to cart">
        </form>
            <form action="BuyControl"> <input type="submit" value="buy"> </form>


    </body>
</html>
