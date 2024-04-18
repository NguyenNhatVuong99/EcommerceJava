/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import connection.ConnectDB;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import models.User;

/**
 *
 * @author Nhat Vuong
 */
public class UserDAO {

    public User UserLogin(String email, String password) {
        User user = null;
        ConnectDB db = ConnectDB.getInstance();

        try {
            Connection con = db.openConnection();

            String query = "select * from users where email=? and password = ?";
            PreparedStatement pst = con.prepareStatement(query);
            pst.setString(1, email);
            pst.setString(2, password);
            ResultSet rs = pst.executeQuery();
            System.err.println("re" + rs);
            if (rs.next()) {
                user = new User();
                user.setId(rs.getInt("id"));
                user.setEmail(rs.getString("email"));
                user.setPassword(rs.getString("password"));
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.err.println(e.getMessage());
        }
        return user;
    }

    public List<User> getUsers() {
        List<User> sl = new ArrayList<>();
        ConnectDB db = ConnectDB.getInstance();
        String sql = "Select * from users";
        try {
            Connection con = db.openConnection();
            PreparedStatement statement = con.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt(1);
                String name = rs.getString(2);
                String email = rs.getString(3);
                String password = rs.getString(4);
                User user = new User(id, name, email, password);
                sl.add(user);
            }
            System.out.println("DAO.UserDAO.getUsers()");
            rs.close();
            statement.close();
            con.close();
        } catch (Exception ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return sl;
    }

    public void addUser(User user) {
        // create sql for insert
        String sql = "INSERT INTO users (name,email, password) VALUES (?, ?, ?)";
        ConnectDB db = ConnectDB.getInstance();

        try {
            Connection con = db.openConnection();
            PreparedStatement statement = con.prepareStatement(sql);
            statement.setString(1, user.getName());
            statement.setString(2, user.getEmail());
            statement.setString(3, user.getPassword());
            statement.execute();
            statement.close();
            con.close();
        } catch (Exception ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void updateUser(User user) {
        String sql = "UPDATE users SET name=?, email=?, password=? WHERE id=?";
        ConnectDB db = ConnectDB.getInstance();
        try {
            Connection con = db.openConnection();
            PreparedStatement statement = con.prepareStatement(sql);
            statement.setString(1, user.getName());
            statement.setString(2, user.getEmail());
            statement.setString(3, user.getPassword());
            statement.setInt(4, user.getId());
            statement.execute();
            statement.close();
            con.close();
        } catch (Exception ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public User getUser(String idd) {
        User user = null;
        int id = Integer.parseInt(idd);
        ConnectDB db = ConnectDB.getInstance();
        String sql = "Select * from users where id=?";
        try {
            Connection con = db.openConnection();
            PreparedStatement statement = con.prepareStatement(sql);
            statement.setInt(1, id);
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                String name = rs.getString(2);
                String email = rs.getString(3);
                String password = rs.getString(4);
                user = new User(id, name, email, password);
            }
            rs.close();
            statement.close();
            con.close();
        } catch (Exception ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return user;
    }

    public void deleteUser(String idd) {
        try {
            ConnectDB db = ConnectDB.getInstance();
            Connection con = db.openConnection();
            String sql = "DELETE FROM users WHERE id=?";
            PreparedStatement statement = con.prepareStatement(sql);
            int id = Integer.parseInt(idd);
            statement.setInt(1, id);
            statement.execute();
            con.close();
            statement.close();
        } catch (Exception ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
