package com.example.baithithuchanhmodule3.models;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProductModel {
    private static Connection conn = DBConnection.getConnection();

    public static List<Product> getAllProducts() {
        List<Product> products = new ArrayList<>();
        String sql = "SELECT * FROM product";

        try {
            PreparedStatement stmt = conn.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Product product = new Product(
                        rs.getInt("productID"),
                        rs.getString("productName"),
                        rs.getInt("productPrice"),
                        rs.getInt("productSale"),
                        rs.getInt("productInventory")
                );
                products.add(product);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return products;
    }

    public static void addProduct(Product product) {
        String sql = "INSERT INTO product (productName, productPrice, productSale, productInventory) VALUES (?, ?, ?, ?)";

        try {
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, product.getProductName());
            stmt.setInt(2, product.getProductPrice());
            stmt.setInt(3, product.getProductSale());
            stmt.setInt(4, product.getProductInventory());
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static void destroy(int id) throws SQLException {
        String sql = "DELETE FROM product WHERE productID = ?";
        PreparedStatement statement = conn.prepareStatement(sql);
        statement.setInt(1, id);
        statement.executeUpdate();
    }

    public static Product getProductById(int id) throws SQLException {
        String sql = "SELECT * FROM product WHERE productID = ?";
        PreparedStatement stmt = conn.prepareStatement(sql);
        stmt.setInt(1, id);
        ResultSet rs = stmt.executeQuery();

        if (rs.next()) {
            return new Product(
                    rs.getInt("productID"),
                    rs.getString("productName"),
                    rs.getInt("productPrice"),
                    rs.getInt("productSale"),
                    rs.getInt("productInventory")
            );
        }
        return null;
    }

    public static void update(Product product) throws SQLException {
        String sql = "UPDATE product SET productName = ?, productPrice = ?, productSale = ?, productInventory = ? WHERE productID = ?";
        PreparedStatement stmt = conn.prepareStatement(sql);
        stmt.setString(1, product.getProductName());
        stmt.setInt(2, product.getProductPrice());
        stmt.setInt(3, product.getProductSale());
        stmt.setInt(4, product.getProductInventory());
        stmt.setInt(5, product.getProductID());
        stmt.executeUpdate();
    }
    public static List<Product> search(String keyword) {
        List<Product> products = new ArrayList<>();
        String sql = "SELECT * FROM product WHERE productName LIKE ?";

        try {
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, "%" + keyword + "%");
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Product product = new Product(
                        rs.getInt("productID"),
                        rs.getString("productName"),
                        rs.getInt("productPrice"),
                        rs.getInt("productSale"),
                        rs.getInt("productInventory")
                );
                products.add(product);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return products;
    }

}
