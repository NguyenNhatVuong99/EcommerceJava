/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllers;

import DAO.OrderDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDateTime;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.Order;

/**
 *
 * @author Nhat Vuong
 */
@WebServlet(name = "OrderController", urlPatterns = {"/OrderController"})

public class OrderController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet OderController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet OderController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String theCommand = request.getParameter("command");
            if (theCommand == null) {
                theCommand = "LIST";
            }
            switch (theCommand) {
                case "LIST":
                    listOrders(request, response);
                    break;
                case "ADD":
                    addOrders(request, response);
                    break;
                default:
                    listOrders(request, response);
            }
        } catch (Exception ex) {
            Logger.getLogger(OrderController.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String theCommand = request.getParameter("command");
            if (theCommand == null) {
                theCommand = "LIST";
            }
            switch (theCommand) {
                case "LIST":
                    listOrders(request, response);
                    break;
                case "ADD":
                    addOrders(request, response);
                    break;
                default:
                    listOrders(request, response);
            }
        } catch (Exception ex) {
            Logger.getLogger(OrderController.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    private void listOrders(HttpServletRequest request, HttpServletResponse response) throws Exception {
        OrderDAO orderDAO = new OrderDAO();
        List<Order> list = orderDAO.getOrders();

        // add these orders to the object request
        request.setAttribute("orderList", list);

        // send to the JSP page (view)
        RequestDispatcher dispatcher = request.getRequestDispatcher("admin-order.jsp");
        dispatcher.forward(request, response);
    }

    private void addOrders(HttpServletRequest request, HttpServletResponse response) throws Exception {
        // read order info from the form
        int userId = Integer.parseInt(request.getParameter("userId"));

        String address = request.getParameter("address");
        String phone = request.getParameter("phone");
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        double price = Double.parseDouble(request.getParameter("price"));
        LocalDateTime date = LocalDateTime.now();
        boolean status = false;
        // create a new order object
        Order order = new Order(quantity, price, userId, address, phone, date, status);

        // add the order to the database
        OrderDAO orderDAO = new OrderDAO();
        orderDAO.addOrder(order);

        // calling the order list jsp page
        RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
        dispatcher.forward(request, response);
    }
}
