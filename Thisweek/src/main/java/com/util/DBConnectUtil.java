package com.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

public class DBConnectUtil {
//    private static final String URL = "jdbc:mysql://localhost:3306/sql_store";
//    private static final String username = "root";
//    private static final String password = "";
    private static Connection connection = null;
    static final ResultSet resultSet1 = null;

    public static Connection openConnection(){

        try {
//            Class.forName("com.mysql.jdbc.Driver");
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        try {
            String url = "jdbc:mysql://localhost:3306/facebookDB";
            Properties info = new Properties();
            info.put("user", "root");
            info.put("password", "Am mhb0902");

            connection = DriverManager.getConnection(url, info);

            if (connection != null) {
                //System.out.println(connection);
                System.out.println("Successfully connected to MySQL database sql_store");
            }

        } catch (SQLException ex) {
            System.out.println("An error occurred while connecting MySQL database");
            ex.printStackTrace();
        }

        return connection;
    }

}
