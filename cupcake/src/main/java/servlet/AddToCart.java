/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import DatabaseAcces.DataMapper;
import entity.OrderEntity;
import entity.User;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import static java.util.Collections.list;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Perlt
 */
@WebServlet(name = "AddToCart", urlPatterns = {"/AddToCart"})
public class AddToCart extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");

        DataMapper dm = new DataMapper();

        String topping = request.getParameter("topping");
        String bottom = request.getParameter("bottom");
        double toppingPrice = dm.getToppingsPrice(topping);
        double bottomPrice = dm.getBottomPrice(bottom);

        int amount = Integer.parseInt(request.getParameter("amount"));
         
        if (request.getSession().getAttribute("shoppingList") == null) {
                List<OrderEntity> shoppingList = new ArrayList<>();
                shoppingList.add(new OrderEntity(topping, bottom, bottomPrice + toppingPrice, amount));
                request.getSession().setAttribute("shoppingList", shoppingList);
            } else {
                List<OrderEntity> shoppingList = (List<OrderEntity>) request.getSession().getAttribute("shoppingList");
                shoppingList.add(new OrderEntity(topping, bottom, toppingPrice + bottomPrice, amount));
         }

         response.sendRedirect("Order.jsp");
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(AddToCart.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(AddToCart.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
