/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllers;

import DAO.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.User;

/**
 *
 * @author Nhat Vuong
 */
@WebServlet(name = "UserController", urlPatterns = {"/UserController"})
public class UserController extends HttpServlet {

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet UserController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UserController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
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
            String theCommand = request.getParameter("command");
            if (theCommand == null) {
                theCommand = "LIST";
            }
            switch (theCommand) {
                case "LIST":
                    listUsers(request, response);
                    break;

                case "LOAD":
                    loadUser(request, response);
                    break;

                default:
                    listUsers(request, response);
            }
        } catch (Exception ex) {
            Logger.getLogger(UserController.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String theCommand = request.getParameter("command");
            if (theCommand == null) {
                theCommand = "ADD";
            }
            switch (theCommand) {

                case "ADD":
                    addUser(request, response);
                    break;
                case "UPDATE":
                    updateUser(request, response);
                    break;
                case "LOAD":
                    loadUser(request, response);
                    break;

                case "DELETE":
                    deleteUser(request, response);
                    break;
                default:
                    addUser(request, response);
            }
        } catch (Exception ex) {
            Logger.getLogger(UserController.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    private void listUsers(HttpServletRequest request, HttpServletResponse response) throws Exception {
        // get users from the database
        UserDAO userDAO = new UserDAO();
        List<User> list = userDAO.getUsers();

        // add these users to the object request
        request.setAttribute("userList", list);

        // send to the JSP page (view)
        RequestDispatcher dispatcher = request.getRequestDispatcher("admin-user.jsp");
        dispatcher.forward(request, response);
    }

    private void addUser(HttpServletRequest request, HttpServletResponse response) throws Exception {
        // read user info from the form
        String name = request.getParameter("name");
        String password = request.getParameter("password");
        String email = request.getParameter("email");

        // create a new user object
        User user = new User(name, email, password);

        // add the user to the database
        UserDAO userDAO = new UserDAO();
        userDAO.addUser(user);

        // calling the user list jsp page
        listUsers(request, response);
    }

    private void loadUser(HttpServletRequest request, HttpServletResponse response) throws Exception {
        // read user id from the form data
        String theUserId = request.getParameter("userId");

        // get user from the database
        User user = new UserDAO().getUser(theUserId);

        // place user in the request attribute
        request.setAttribute("THE_USER", user);

        RequestDispatcher dispatcher = request.getRequestDispatcher("admin-user-update.jsp");
        dispatcher.forward(request, response);
    }

    private void updateUser(HttpServletRequest request, HttpServletResponse response) throws Exception {
        // read user info from the form data
        int id = Integer.parseInt(request.getParameter("userId"));
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        // create a new user object
        User user = new User(id, name,email, password);

        // perform update on database
        new UserDAO().updateUser(user);

        // send them back to the "list user" page
        listUsers(request, response);
    }

    private void deleteUser(HttpServletRequest request, HttpServletResponse response) throws Exception {
        // read user id from the form data
        String theUserId = request.getParameter("userId");

        // delete user from the database
        new UserDAO().deleteUser(theUserId);

        // send them back to the "list user" page
        listUsers(request, response);
    }
}
