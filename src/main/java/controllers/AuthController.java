/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controllers;

import DAO.UserDAO;
import connection.ConnectDB;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
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
@WebServlet("/auth")
public class AuthController extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action != null) {
            switch (action) {
                case "login":
                    login(req, res);
                    break;

                case "register":
                    register(req, res);
                    break;
                default:
                    res.sendRedirect("login.jsp");
            }
        }
    }

    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        String action = req.getParameter("action");
        if ("logout".equals(action)) {
            logout(req, res);
        } else {
            // Redirect to login page or handle other actions
            res.sendRedirect("login.jsp");
        }
    }

    private void login(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        UserDAO userDao = new UserDAO();
        User user = userDao.UserLogin(email, password);
        if (user != null) {
            req.getSession().setAttribute("auth", user);
            res.sendRedirect("index.jsp");
        } else {
            req.setAttribute("error", "Invalid email or password");
            req.getRequestDispatcher("login.jsp").forward(req, res);
        }
    }

    private void logout(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        if (req.getSession().getAttribute("auth") != null) {
            req.getSession().removeAttribute("auth");
        }
        res.sendRedirect("index.jsp");
    }

    private void register(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        // Add validation and registration logic here
        // For example:
        // userDao.register(email, password);
        res.sendRedirect("login.jsp");
    }

}
