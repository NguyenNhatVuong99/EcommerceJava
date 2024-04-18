/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import connection.ConnectDB;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import models.Product;
import models.Product;

/**
 *
 * @author Nhat Vuong
 */
public class ProductDAO {

    public List<Product> getProducts() {
        List<Product> sl = new ArrayList<>();
        ConnectDB db = ConnectDB.getInstance();
        String sql = "Select * from products";
        try {
            Connection con = db.openConnection();
            PreparedStatement statement = con.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt(1);
                String name = rs.getString(2);
                String category = rs.getString(3);
                Double price = rs.getDouble(4);
                String image = rs.getString(5);

                Product product = new Product(id, name, category, price, image);
                sl.add(product);
            }
            rs.close();
            statement.close();
            con.close();
        } catch (Exception ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return sl;
    }

}
