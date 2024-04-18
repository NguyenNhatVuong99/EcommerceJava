/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package models;

import java.time.LocalDateTime;
import java.util.Date;

/**
 *
 * @author Nhat Vuong
 */
public class Order {

    private int id;
    private int quantity;
    private double price;
    private int userId;
    private String name;
    private String email;
    private String address;
    private String phone;
    private LocalDateTime date;
    private boolean status;

    public Order() {
    }

    public Order(int id, int quantity, double price, int userId, String name, String email, String address, String phone, LocalDateTime date, boolean status) {
        this.id = id;
        this.quantity = quantity;
        this.price = price;
        this.userId = userId;

        this.name = name;
        this.email = email;
        this.address = address;
        this.phone = phone;
        this.date = date;
        this.status = status;
    }

    public Order(int quantity, double price, int userId, String name, String email, String address, String phone, LocalDateTime date, boolean status) {
        this.quantity = quantity;
        this.price = price;
        this.userId = userId;
        this.name = name;
        this.email = email;
        this.address = address;
        this.phone = phone;
        this.date = date;
        this.status = status;
    }

    public Order(int quantity, double price, int userId, String address, String phone, LocalDateTime date, boolean status) {
        this.quantity = quantity;
        this.price = price;
        this.userId = userId;
        this.address = address;
        this.phone = phone;
        this.date = date;
        this.status = status;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public LocalDateTime getDate() {
        return date;
    }

    public void setDate(LocalDateTime date) {
        this.date = date;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

}
