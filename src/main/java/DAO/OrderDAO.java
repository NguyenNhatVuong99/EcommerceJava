/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import connection.ConnectDB;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import models.Order;

/**
 *
 * @author Nhat Vuong
 */
public class OrderDAO {

    public List<Order> getOrders() {
        List<Order> orders = new ArrayList<>();
        ConnectDB db = ConnectDB.getInstance();

        String sql = "SELECT orders.id , orders.quantity,orders.price,orders.userId, users.name, users.email, orders.address, orders.phone,orders.date,orders.status   FROM orders INNER JOIN users ON users.id = orders.userId";

        try {
            Connection con = db.openConnection();
            PreparedStatement statement = con.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id"); // Get order ID
                int quantity = rs.getInt("quantity"); // Get quantity
                double price = rs.getDouble("price"); // Get price
                int userId = rs.getInt("userId");
                String name = rs.getString("name"); // Get user name
                String email = rs.getString("email"); // Get user email
                String address = rs.getString("address"); // Get address
                String phone = rs.getString("phone"); // Get phone
//                LocalDateTime date = rs.getDate("date"); // Get date
                Timestamp timestamp = rs.getTimestamp("date");
                LocalDateTime date = timestamp.toLocalDateTime();
                boolean status = rs.getBoolean("status"); // Get status

                // Create an Order object
                Order order = new Order(id, quantity, price, userId, name, email, address, phone, date, status);
                orders.add(order);
            }
            rs.close();
            statement.close();
            con.close();
        } catch (Exception ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return orders;
    }

    public void addOrder(Order order) {
        // create sql for insert
        String sql = "INSERT INTO orders (quantity,price,userId, address, phone, date, status) VALUES (?, ?, ?,?, ?, ?,?)";
        ConnectDB db = ConnectDB.getInstance();

        try {
            Connection con = db.openConnection();
            PreparedStatement statement = con.prepareStatement(sql);
            statement.setInt(1, order.getQuantity());
            statement.setDouble(2, order.getPrice());
            statement.setInt(3, order.getUserId());
            statement.setString(4, order.getAddress());
            statement.setString(5, order.getPhone());
            LocalDateTime dateTime = LocalDateTime.now();
            Timestamp timestamp = Timestamp.valueOf(dateTime);
            statement.setTimestamp(6, timestamp);
            statement.setBoolean(7, order.isStatus());
            statement.execute();
            statement.close();
            con.close();

        } catch (Exception ex) {
            Logger.getLogger(OrderDAO.class
                    .getName()).log(Level.SEVERE, null, ex);
        }
    }
}
