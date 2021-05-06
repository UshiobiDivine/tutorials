package com.dao;

import com.entity.User;
import com.util.DBConnectUtil;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserDAOImplementation {

    static Connection connection = null;
    Statement statement = null;
    ResultSet resultSet = null;
    //User user = null;

    public UserDAOImplementation() {
    }

    public List<User> getUserList() {

        List<User> list = null;

        try {
            list = new ArrayList<>();
            String sql = "SELECT * FROM fbuser";
            connection = DBConnectUtil.openConnection();
            statement = connection.createStatement();
            resultSet = statement.executeQuery(sql);

            while (resultSet.next()) {
                long fbuser_id = resultSet.getLong("fbuser_id");
                String first_name = resultSet.getString("first_name");
                String last_name = resultSet.getString("last_name");
                String email1 = resultSet.getString("email");
                String password1 = resultSet.getString("password");
                String birthdate = resultSet.getString("birthdate");
                String gender = resultSet.getString("gender");
                int post_id = resultSet.getInt("post_id");

                User user1 = new User(first_name, last_name, birthdate, email1, password1, gender);
                list.add(user1);

            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return list;
    }
        public void userSignup (User user){
            String firstName = user.getFirstName();
            String lastName = user.getLastName();
            String email = user.getEmail();
            String password = user.getPassword();
            String birthdate = user.getBirthdate();
            String gender = user.getGender();

            String sql = "INSERT INTO fbuser (first_name, last_name, email, password, birthdate, gender) VALUES (?, ?, ?, ?, ?, ?)";
            connection = DBConnectUtil.openConnection();

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

            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }

        }

        public static User getUser (String email){

            User user1 = null;

            String sql = "SELECT * FROM fbuser WHERE email LIKE ?";
            //String sql = "SELECT * FROM fbuser WHERE email = " +email;
            connection = DBConnectUtil.openConnection();

            try {
                PreparedStatement preparedStatement = connection.prepareStatement(sql);
                preparedStatement.setString(1, email);

                Statement createdStatement = connection.createStatement();
                ResultSet resultSet = createdStatement.executeQuery(sql);

                while (resultSet.next()) {
                    long fbuser_id = resultSet.getLong("fbuser_id");
                    String first_name = resultSet.getString("first_name");
                    String last_name = resultSet.getString("last_name");
                    String email1 = resultSet.getString("email");
                    String password1 = resultSet.getString("password");
                    String birthdate = resultSet.getString("birthdate");
                    String gender = resultSet.getString("gender");
                    int post_id = resultSet.getInt("post_id");

                    user1 = new User(first_name, last_name, birthdate, email1, password1, gender);
                    System.out.println("First name is: " + first_name);
                    System.out.println("Last name is: " + last_name);
                    System.out.println("Email is: " + email);
                    System.out.println("Password is: " + password1);

                }
                //resultSet.close();


                //ResultSet resultSet = preparedStatement.executeQuery();

//            if (resultSet.next()) {
//                String fisrt_name = resultSet.getString("fisrt_name");
//                String last_name = resultSet.getString("last_name");
//                String email1 = resultSet.getString("email");
//                String password1 = resultSet.getString("password");
//                String birthdate = resultSet.getString("birthdate");
//                String gender = resultSet.getString("gender");
//
//                user1 = new User(fisrt_name, last_name, birthdate, email1, password1, gender);
              return user1;
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            } finally {
                try {
                    connection.close();
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
            }

            return user1;

    /*@Override
    public void login(User user) {

    }

    @Override
    public void createPost() {

    }

    @Override
    public void deletePost(Post post) {
        String sql = "DELETE FROM post where post_id = ?";
    }

    @Override
    public void editPost(Post post) {

    }

    @Override
    public void getPost(Post post) {

    }

    @Override
    public void createComment() {

    }

    @Override
    public void deleteComment(Comment comment) {
        String sql = "DELETE FROM post where post_id = ?";
    }

    @Override
    public void editComment(Comment comment) {

    }

    @Override
    public void getComment(Comment comment) {

    }

    @Override
    public void getUser(User user) {
        String sql = "SELECT * FROM fbuser WHERE fbuser_id = user.getid";
    }*/

        }


    }
