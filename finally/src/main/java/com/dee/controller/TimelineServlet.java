package com.dee.controller;

import com.dee.dao.PostDAO;
import com.dee.dao.UserDAO;
import com.dee.entity.Comment;
import com.dee.entity.Post;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

@WebServlet(name = "TimelineServlet", value = {"/timeline", "/comment", "/like", "/delete", "/edit", "/show", "/viewPosts"})
public class TimelineServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String route = request.getServletPath();
        switch (route) {
            case "/timeline":
                createPost(request, response);
                break;
            case "/viewPosts":
                updatedPost(request, response);
                break;
            case "/comment":
                createComment(request, response);
                break;
            case "/like":
                likeOrUnlikePost(request, response);
                break;
            case "/delete":
                deletePost(request, response);
                break;
            case "/edit":
                editPost(request, response);

        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String route = request.getServletPath();
        switch (route) {
            case "/timeline":
                createPost(request, response);
                break;
            case "/viewPosts":
                updatedPost(request, response);
                break;
            case "/comment":
                createComment(request, response);
                break;

            case "/edit":
                editPost(request, response);
        }
    }

    public void createPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // get a session object from the request
        HttpSession session = request.getSession();
        //RequestDispatcher requestDispatcher =  request.getRequestDispatcher("timeline.jsp");

        int userID = (int) session.getAttribute("userID");

        String message = request.getParameter("post_text");

        PostDAO postDAO = new PostDAO();

        if (!message.isEmpty()) {
            // store the post int he database
            Post post = new Post(userID, message);
            boolean createPost = postDAO.createPost(post);
            if (createPost) {
                System.out.println("Post Created");

                refreshAndViewTimeLine(request, response, postDAO, userID);
            }
        } else {
            refreshAndViewTimeLine(request, response, postDAO, userID);
        }
    }


    // method to display user posts
    public static void showPosts(HttpServletRequest request, HttpServletResponse response) {
        System.out.println("inside  view post get");

        Map<Post, List<Comment>> userPosts;
        HttpSession session = request.getSession();
        // get the user id from  the session
        int userID = (int) session.getAttribute("user_id");
        String userFirstName = (String) session.getAttribute("userFirstName");
        System.out.println("UserID=======" + userID);
        System.out.println("userFirstName===" + userFirstName);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("timeline.jsp");
        try {
            PostDAO postDAO = new PostDAO();

            userPosts = postDAO.getUserPosts(userID);
            if (userPosts.size() <= 0) {
                // pass an array list to the jsp page
                request.setAttribute("userPosts", userPosts);
                requestDispatcher.forward(request, response);
                return;
            }
            //  store the list of post in the  req object
            request.setAttribute("userPosts", userPosts);
            requestDispatcher.forward(request, response);
        } catch (ServletException | IOException | SQLException e) {
            e.printStackTrace();
            System.out.println("Unable to display posts");

        }
    }


    // method to create a  new comment
    public void createComment(HttpServletRequest request, HttpServletResponse response) {

        // will implement latter
        HttpSession session = request.getSession();

        int userID = (int) session.getAttribute("userID");


        int postID = Integer.parseInt(request.getParameter("postID"));
        String comment = request.getParameter("comment");
        PostDAO postDAO = new PostDAO();
        if (!comment.isEmpty()) {

            //create a new comment object
            Comment comment1 = new Comment(postID, userID, comment);

            boolean createComment = postDAO.createComment(comment1);
            if (createComment) {
                System.out.println("comment created");
            } else {
                System.out.println("Could not create comment");
            }
            refreshAndViewTimeLine(request, response, postDAO, userID);
        } else {
            refreshAndViewTimeLine(request, response, postDAO, userID);
        }
    }

    public void likeOrUnlikePost(HttpServletRequest request, HttpServletResponse response) {
        int postID = Integer.parseInt(request.getParameter("postID"));
        HttpSession session = request.getSession();
        // get the user id from the session
        int userID = (int) session.getAttribute("userID");
        // create the like
        try {
            PostDAO postDAO = new PostDAO();

            postDAO.likeOrUnlikePost(postID, userID);

            refreshAndViewTimeLine(request, response, postDAO, userID);

        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Unable To perform Like operation");
        }

    }

    // method to delete a post
    public void deletePost(HttpServletRequest request, HttpServletResponse response) {
        HttpSession httpSession = request.getSession();
        PostDAO postDAO = new PostDAO();
        try {
            int postID = Integer.parseInt(request.getParameter("postID"));


            // delete the post
            boolean deletePost = postDAO.deletePost(postID);
            if (deletePost) {
                System.out.println("Post Deleted");
            } else {
                System.out.println("Unable to delete post");
            }
        } finally {
            refreshAndViewTimeLine(request, response, postDAO, (Integer) httpSession.getAttribute("userID"));
        }


    }


    // method to update a  post
    public void editPost(HttpServletRequest request, HttpServletResponse response) {
        // get the http Session Object
        HttpSession httpSession = request.getSession();
        // get the userID from the session
        int userID = (int) httpSession.getAttribute("userID");
        String postIDD = request.getParameter("post_id");

        System.out.println("THE POST ID IS: "+postIDD);

        int postID = Integer.parseInt(postIDD);

        //String newPostContent = request.getParameter("postbody");
        String BodytobeEdited = request.getParameter("postbody");
        request.setAttribute("oldPost", BodytobeEdited);
        request.setAttribute("thePostID", postIDD);
        try {
            request.getRequestDispatcher("editThePost.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

        //Post editedPost = new Post(postID, userID, BodytobeEdited);

        //PostDAO postDAO = new PostDAO();
        // update the post content
                                      //boolean updatePost = postDAO.updatePost(editedPost);
//        if (updatePost) {
//            System.out.println("post updated");
//        } else {
//            System.out.println("unable to  update post");
//        }
        // redirect the user

        //String getPostContent = postDAO.getPostContentById(postID);

//        try {
//            // create a request dispatcher obj to render the edit post page
//            RequestDispatcher requestDispatcher = request.getRequestDispatcher("editThePost.jsp");
//            Post post = new Post(postID, userID, getPostContent);
//            // add the post obj to the request object
//            request.setAttribute("postToEdit", post);
//            // render the page
//            requestDispatcher.forward(request, response);
//        } catch (ServletException | IOException e) {
//            e.printStackTrace();
//        }

    }

    public void updatedPost(HttpServletRequest request, HttpServletResponse response){

        HttpSession session = request.getSession();
        String newMessage = request.getParameter("postMessage");

        String postID = request.getParameter("postID");
        Object userID = session.getAttribute("userID");

        System.out.println("MY POST ID IS: "+postID);
        System.out.println("My USER ID IS: "+userID);
        System.out.println("AND THE NEW MESSAGE IS THIS : "+newMessage);

        PostDAO postDAO = new PostDAO();
        Post post = new Post(postID, newMessage);

        boolean b = postDAO.updatePost(post);

        String postContentById = postDAO.getPostContentById(Integer.parseInt(postID));
        System.out.println(postContentById);
        if (b) {
            refreshAndViewTimeLine(request, response, postDAO, (Integer) userID);
            System.out.println("Post updated successfully");
        }else {
            System.out.println("Post failed to update");
        }

    }




    public void refreshAndViewTimeLine(HttpServletRequest request, HttpServletResponse response, PostDAO postDAO, int userID) {
        System.out.println("inside  view post get");

        Map<Post, List<Comment>> userPosts;
//                    HttpSession session =  request.getSession();
        // get the user id from  the session
//                    int userID  =  (int) session.getAttribute("user_id");
//                    String userFirstName = (String)session.getAttribute("userFirstName");
//                    System.out.println("UserID=======" +  userID);
//                    System.out.println("userFirstName===" +  userFirstName);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("timeline.jsp");
        try {
            //PostDAO postDAO = new PostDAO();
            UserDAO userDAO = new UserDAO();

            //userPosts =  postDAO.getUserPosts(userDB.getUser_id());
            userPosts = postDAO.getUserPosts(userID);

            if (userPosts.size() <= 0) {
                // pass an array list to the jsp page
                request.setAttribute("userPosts", userPosts);
                requestDispatcher.forward(request, response);
                return;
            }
            //  store the list of post in the  req object
            request.setAttribute("userPosts", userPosts);
            requestDispatcher.forward(request, response);
        } catch (ServletException | IOException | SQLException e) {
            e.printStackTrace();
            System.out.println("Unable to display posts");
        }
    }
}
