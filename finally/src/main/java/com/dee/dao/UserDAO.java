package com.dee.dao;

import com.dee.entity.User;
import com.dee.utils.DBConnectionUtil;

import java.sql.*;

public class UserDAO {

    static Connection connection = null;
    Statement statement = null;
    ResultSet resultSet = null;
    //User user = null;

    public UserDAO() {
    }


    public boolean userSignup(User user) {
        String firstName = user.getFirstname();
        String lastName = user.getLastname();
        String email = user.getEmail();
        String password = user.getPassword();
        String birthdate = user.getBirthdate();
        String gender = user.getGender();

        User userExistsAlready = getUserDB(email);
        if (userExistsAlready==null) {

            String sql = "INSERT INTO fbuser (firstname, lastname, email, password, birthdate, gender) VALUES (?, ?, ?, ?, ?, ?)";

            connection = DBConnectionUtil.openConnection();

            PreparedStatement statement;
            try {
                statement = connection.prepareStatement(sql);
                statement.setString(1, firstName);
                statement.setString(2, lastName);
                statement.setString(3, email);
                statement.setString(4, password);
                statement.setString(5, birthdate);
                statement.setString(6, gender);
                statement.executeUpdate();

                statement.close();
//            connection.close();

            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
            System.out.println("User has been signed up successfully");
            return true;
        }else {
            System.out.println("User already exists");
            return false;
        }
    }


    public User getUserDB(String email)  {
        final String getUserfromDB = "SELECT * FROM fbuser WHERE email=?;";
        User user = null;

        try(Connection connection =  DBConnectionUtil.openConnection()) {
            PreparedStatement preparedStatement = connection.prepareStatement(getUserfromDB);
            preparedStatement.setString(1, email);
            ResultSet resultSet =  preparedStatement.executeQuery();
            if (resultSet.next()){
                int userID = resultSet.getInt("user_id");
                String firstName =  resultSet.getString("firstname");
                String lastName =  resultSet.getString("lastname");
                String emailAdd =  resultSet.getString("email");
                String password =  resultSet.getString("password");
                String gender =  resultSet.getString("gender");
                String birthdate = resultSet.getString("birthdate");

                user = new User(userID, firstName, lastName, emailAdd,password,birthdate, gender);

            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }

        return user;

    }
}
