package com.dee.dao;

import com.dee.entity.Comment;
import com.dee.entity.Post;
import com.dee.utils.DBConnectionUtil;

import java.sql.*;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

public class PostDAO {

    public PostDAO() {
    }

    public boolean createPost(Post po){
        String sqlCreatePost = "INSERT INTO post (user_id, post_text) VALUES(?, ?)";
        Connection connection = DBConnectionUtil.openConnection();

        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sqlCreatePost);
            preparedStatement.setInt(1, po.getUserID());
            preparedStatement.setString(2, po.getBody());
            preparedStatement.execute();
            return true;
        } catch (SQLException e){
            e.printStackTrace();
            System.out.println("Could Not Create Post");
        }
        return false;
    }


    // METHOD TO DELETE A POST
    public boolean deletePost(int postID){
        boolean successful =  false;
        // create a prepared statement
        try (Connection connection = DBConnectionUtil.openConnection()){
            String sql = "UPDATE post SET deleted_post = ?  WHERE post_id = ?";
            // create a prepared statement
            // i prefer to delete a row by setting the  value of  the deleted column to true, to avoid the overhead of deleting a key
            // that is a foreign key in other tables;
            PreparedStatement preparedStatement =  connection.prepareStatement(sql);
            preparedStatement.setInt(1,1);
            preparedStatement.setInt(2, postID);

            boolean deletePost =  preparedStatement.execute();
            if (deletePost){
                successful =  true;
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
        return  successful;
    }


    //method to update post
    public  boolean updatePost (Post post) {
        String sql  = "UPDATE post SET post_text = ? WHERE post_id = ?";
        boolean successful =  false;
        // get a connection
        try (Connection connection = DBConnectionUtil.openConnection()) {
            // create a prepared statement
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            // set the values of the  statement
            preparedStatement.setString(1, post.getBody());
            preparedStatement.setInt(2, post.getPostID());
            // execute the command
            boolean updatePost = preparedStatement.execute();
            successful = true;
        }catch (SQLException e){
            e.printStackTrace();
        }
        return  successful;
    }


    // method to get post content of a particular post ID
    public String getPostContentById(int postID)  {

       String sql = "SELECT post_text from  post WHERE post_id = ?";

        String postContent = "";
        try(Connection connection = DBConnectionUtil.openConnection()) {
            // create a prepared statement
            PreparedStatement preparedStatement =  connection.prepareStatement(sql);
            // set the values of the prepared statement
            preparedStatement.setInt(1, postID);
            // execute the query
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                postContent =  resultSet.getString("post_text");
                System.out.println("Post Content = " + postContent);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Unable to get post Content");
        }

        return postContent;
    }


    public  void likeOrUnlikePost(int postID, int userID) throws SQLException {


        //String unlikeSql = "DELETE  FROM likes  WHERE post_id = ? AND user_id = ?";
        String likeSql = "INSERT INTO likes (post_id, user_id) VALUES(?, ?)";

        System.out.println("inside like or unlike()");
        // check if the user has already liked the post
        try(Connection connection = DBConnectionUtil.openConnection()){
            //create a prepared statement
            PreparedStatement preparedStatement = connection.prepareStatement(likeSql);
            // set the values of the prepared statement
            preparedStatement.setInt(1, postID);
            preparedStatement.setInt(2, userID);
            int resultSet  = preparedStatement.executeUpdate();

//            // if the user has already liked the post,
//            if(resultSet.next()){
//                // unlike the post
//                PreparedStatement preparedStatement1 = connection.prepareStatement(unlikeSql);
//                preparedStatement1.setInt(1, postID);
//                preparedStatement1.setInt(2, userID);
//                preparedStatement1.execute();
//                System.out.println("unliked post!");
//            } else {
//                // like the post
//                PreparedStatement preparedStatement1 = connection.prepareStatement(likeSql);
//                preparedStatement1.setInt(1, postID);
//                preparedStatement1.setInt(2, userID);
//                preparedStatement1.execute();
//                System.out.println("Liked!");
//
//            }
        }
    }


    // method to create a new comment
    public boolean createComment(Comment comment)  {

        // get object connection
        boolean successful =  false;
        try {
            Connection connection = DBConnectionUtil.openConnection();
            String sql = "INSERT INTO comment(post_id, user_id, comment_body) VALUES (?, ?, ?)";
            // create a prepared statement
            PreparedStatement preparedStatement =  connection.prepareStatement(sql);
            // set values for the parameters
            preparedStatement.setInt(1, comment.getPostID());
            preparedStatement.setInt(2, comment.getUserID());
            preparedStatement.setString(3, comment.getComment());
            // execute query;
            boolean createStatement = preparedStatement.execute();
            successful  = true;
        } catch (SQLException e){
            e.printStackTrace();
        }
        return successful;
    }


    // method to retrieve all the comments for a particular posts
    public List<Comment> getComments(int postID)  {
        List<Comment>comments =  new ArrayList<>();
        try {
            // get db connection
            Connection connection = DBConnectionUtil.openConnection();
            String getComments = "SELECT * FROM comment WHERE post_id = ?";
            // create a prepared statement
            PreparedStatement preparedStatement =  connection.prepareStatement(getComments);
            preparedStatement.setInt(1, postID);
            ResultSet resultSet =  preparedStatement.executeQuery();
            // create a a comment object for each record in the result
            while (resultSet.next()){
                int postID2 =  resultSet.getInt("post_id");
                int userID =  resultSet.getInt("user_id");

                String comment =  resultSet.getString("comment_body");
                Timestamp date = resultSet.getTimestamp("commentDate");
                //LocalDateTime localDateTime = date.toLocalDateTime();


                //System.out.println("Time Stamp = " + date);
                Comment comment1 = new Comment(postID2, userID, comment, date);
                // add the newly created comment to the list
                //System.out.println("created comment 1" +  comment1);
                comments.add(comment1);
            }
        }catch (SQLException e) {
            e.printStackTrace();
        }

        return comments;
    }


    // method to fetch all the posts of a single user from the db
    public Map<Post, List<Comment>> getUserPosts(int userID) throws SQLException {

        String  getUsersPosts = "SELECT post.user_id, post.post_id, post.post_text, post.dateposted, count(likes.like_id) as totalLikes\n" +
                "        FROM post \n" +
                "        LEFT JOIN likes ON \n" +
                "        post.post_id =  likes.post_id WHERE post.deleted_post = 'false' and post.user_id =? GROUP BY post.post_id, post.dateposted ORDER BY post.dateposted DESC;";


//        List<Post> userPosts =  new ArrayList<>();
        Map<Post, List<Comment>>  userPosts =  new LinkedHashMap<Post, List<Comment>>();

        // get a db connection
        Connection connection = DBConnectionUtil.openConnection();
        // create a prepared statement
        PreparedStatement preparedStatement = connection.prepareStatement(getUsersPosts);
        // set the values of the prepared statement
        preparedStatement.setInt(1, userID);
        ResultSet resultSet =  preparedStatement.executeQuery();


        // loop through the result and use each record to create a post object
        while (resultSet.next()){
            int postID =  resultSet.getInt("post_id");
//            int storedUserId =  resultSet.getInt("userID");
            String message =  resultSet.getString("post_text");
            int totalLikes =  resultSet.getInt("totalLikes");
//            String deleted =  resultSet.getString("deleted");
            Timestamp date = resultSet.getTimestamp("dateposted");

            Post post =  new Post(postID, userID, message, "No", date,totalLikes );

            // get all the comments for the post
            List postComments =  getComments(postID);
            userPosts.put(post, postComments);
            // add the post object to our array list
//            userPosts.add(post);
        }
        return userPosts;
    }

}
