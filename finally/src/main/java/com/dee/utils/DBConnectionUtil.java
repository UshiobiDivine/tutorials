package com.dee.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

public class DBConnectionUtil {
    private static Connection connection = null;
    private static ResultSet resultSet = null;

    public static Connection openConnection(){
        try {
//            Class.forName("com.mysql.jdbc.Driver");
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        try {
            String url = "jdbc:mysql://localhost:3306/facebookDB?useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
            Properties info = new Properties();
            info.put("user", "root");
            info.put("password", "Am mhb0902");

            connection = DriverManager.getConnection(url, info);

            if (connection != null) {
                //System.out.println(connection);
                System.out.println("Successfully connected to MySQL database facebookDB");
            }

        } catch (SQLException ex) {
            System.out.println("An error occurred while connecting MySQL database");
            ex.printStackTrace();
        }

        return connection;
    }
}
