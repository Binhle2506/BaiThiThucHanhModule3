package com.example.baithithuchanhmodule3.models;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
    private static String jdbcURL = "jdbc:mysql://localhost:3306/codegym_ecommerce";
    private static String jdbcUsername = "root";
    private static String jdbcPassword = "2542006";
    public static Connection getConnection() {
        Connection connection = null;
        try{
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
            System.out.println("Connection Successful");
        }catch (SQLException e){
            System.out.println("Error: " + e);
        }catch (ClassNotFoundException e){
            e.printStackTrace();
        }
        return connection;
    }
}