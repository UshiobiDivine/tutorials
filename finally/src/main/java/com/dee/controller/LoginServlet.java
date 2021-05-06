package com.dee.controller;

import com.dee.dao.PostDAO;
import com.dee.dao.UserDAO;
import com.dee.entity.Comment;
import com.dee.entity.Post;
import com.dee.entity.User;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

@WebServlet(name = "LoginServlet", value = {"/signedup","/LoginServlet","/login", "/logout"})
public class LoginServlet extends HttpServlet {

    private UserDAO userDAO;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String contextPath = request.getServletPath();
        if (contextPath.equals("/logout")){
            HttpSession session = request.getSession();
            session.invalidate();
            response.sendRedirect("index.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String contextPath = request.getServletPath();

        System.out.println(contextPath);
        if (contextPath.equals("/signedup")){
            //response.setContentType("text/html");

            String firstname = request.getParameter("firstname");
            String lastname = request.getParameter("lastname");
            String email_num = request.getParameter("email_num");
            String password = request.getParameter("password");
            String birthdate = request.getParameter("birthdate");
            String gender = request.getParameter("gender");

            User user = new User(firstname,lastname, email_num, password, birthdate, gender);
            userDAO = new UserDAO();

            boolean b = userDAO.userSignup(user);

            if (b) {
                User user2 = userDAO.getUserDB(email_num);
                HttpSession httpSession = request.getSession();
                httpSession.setAttribute("userID", user2.getUser_id());
                httpSession.setAttribute("firsnameOfUser", user2.getFirstname());
                response.sendRedirect("timeline.jsp");

                //response.getWriter().print("<h1>Successfully registered</h1>");

                //System.out.println(firstname+" "+lastname+" "+email_num+" "+password+" "+birthdate+" "+gender);
            }else {
                request.setAttribute("errorMessage" , "A User With That Email Already Exist");
                RequestDispatcher requestDispatcher =  request.getRequestDispatcher("index.jsp");
                // forward the request to the
                requestDispatcher.forward(request, response);
            }
        }


        if (contextPath.equals("/login")){

            String email_num = request.getParameter("email");
            String password = request.getParameter("password");

            UserDAO userDAO = new UserDAO();
            HttpSession session = request.getSession();

            User userDB = userDAO.getUserDB(email_num);

            if (userDB == null){
                request.setAttribute("errorMessage" , "Invalid Email");
                RequestDispatcher requestDispatcher =  request.getRequestDispatcher("index.jsp");
                // forward the request to the
                requestDispatcher.forward(request, response);

            } else {
                String storedPassword  =  userDB.getPassword();
                if (!password.equals(storedPassword)){
                    request.setAttribute("errorMessage" , "Invalid Password");
                    RequestDispatcher requestDispatcher =  request.getRequestDispatcher("index.jsp");
                    // forward the request to the
                    requestDispatcher.forward(request, response);

                } else {
                    // store the object in the request session
                    session.setAttribute("userID", userDB.getUser_id());
                    session.setAttribute("userFirstName", userDB.getFirstname());
                    System.out.println("Valid Login");

                    //response.sendRedirect("viewPost");





                    System.out.println("inside  view post get");

                    Map<Post, List<Comment>> userPosts;
//                    HttpSession session =  request.getSession();
                    // get the user id from  the session
//                    int userID  =  (int) session.getAttribute("user_id");
//                    String userFirstName = (String)session.getAttribute("userFirstName");
//                    System.out.println("UserID=======" +  userID);
//                    System.out.println("userFirstName===" +  userFirstName);
                    RequestDispatcher  requestDispatcher =  request.getRequestDispatcher("timeline.jsp");
                    try {
                        PostDAO postDAO = new PostDAO();

                        userPosts =  postDAO.getUserPosts(userDB.getUser_id());
                        if (userPosts.size() <= 0){
                            // pass an array list to the jsp page
                            request.setAttribute("userPosts", userPosts);
                            requestDispatcher.forward(request, response);
                            return;
                        }
                        //  store the list of post in the  req object
                        request.setAttribute("userPosts", userPosts);
                        requestDispatcher.forward(request, response);
                    } catch(ServletException | IOException | SQLException e){
                        e.printStackTrace();
                        System.out.println("Unable to display posts");

                    }
                }
            }


        }


    }
}
