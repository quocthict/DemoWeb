package com.demo.config;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class MysqlConnection {
    private final String serverName = "localhost";
    private final String portNumber = "3307";
    private final String dbName = "kiga";
    private final String userName = "root";
    private final String password = "admin123";
    private final String driver = "com.mysql.cj.jdbc.Driver";

    public Connection getConnection() throws ClassNotFoundException, SQLException {
        String url = "jdbc:mysql://" + serverName + ":" + portNumber + "/" + dbName;
        Connection connection = null;
        try {
            Class.forName(driver);
            return DriverManager.getConnection(url, userName, password);
        } catch (SQLException | ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }

//    public static void main(String[] args) {
//        try {
//            System.out.println(new MysqlConnection().getConnection());
//            System.out.println("ok");
//        } catch (Exception e) {
//            throw new RuntimeException(e);
//        }
//    }
}
