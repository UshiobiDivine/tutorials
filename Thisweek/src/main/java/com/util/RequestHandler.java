package com.util;

import com.dao.UserDAOImplementation;
import com.entity.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

public class RequestHandler {
    HttpServletRequest request;
    HttpServletResponse response;
    String servletPath;
    UserDAOImplementation userDAO = null;

    public RequestHandler(HttpServletRequest request, HttpServletResponse response, String servletPath) {
        this.request = request;
        this.response = response;
        this.servletPath = servletPath;
        userDAO = new UserDAOImplementation();
    }

    public void handleRequest() {
        switch (servletPath) {
            case "/userSignedup":
                insertUser();
                break;
            case "/signup":
                signup();
                break;
            case "/login":
                login();
                //deleteBook(request, response);
                break;
            case "/proceed":
                proceed();
                //showEditForm(request, response);
                break;
            case "/update":
                //updateBook(request, response);
                break;
            default:
                //listBook(request, response);
                break;
        }

    }

    private void insertUser() {
        String firstname = request.getParameter("firstname");
        String lastname = request.getParameter("lastname");
        String password = request.getParameter("password");
        String birthdate = request.getParameter("birthdate");
        String email_num = request.getParameter("email_num");
        String gender = request.getParameter("gender");

        User user = new User(firstname, lastname, birthdate, email_num, password, gender);
        userDAO = new UserDAOImplementation();
        userDAO.userSignup(user);

        response.setContentType("text/html");
        try {
            request.getRequestDispatcher("/views/welcome.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

    public void signup() {

        response.setContentType("text/html");
        try {
            request.getRequestDispatcher("/views/signup.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

    public void login(){

        String password = request.getParameter("pw");
        String email = request.getParameter("email");
        //String email_num = "Divineobi13@gmail.com";

        List<User> userList = userDAO.getUserList();
        boolean b = userList.stream().anyMatch(p -> p.getEmail().equals(email)&&p.getPassword().equals(password));
        if (b){
            response.setContentType("text/html");
            try {
                request.getRequestDispatcher("/views/profile.jsp").forward(request, response);
            } catch (ServletException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }else {
            try {
                PrintWriter out = response.getWriter();
                out.write("Sorry Can' Login");
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

        System.out.println("Email is :: "+email);

        /*User user = UserDAOImplementation.getUser(email);

        Optional.ofNullable(user).ifPresentOrElse(user1 -> {
            if (user1.getPassword().equals(password)&&user1.getEmail().equals(email)){
                response.setContentType("text/html");
                try {
                    request.getRequestDispatcher("/WEB-INF/views/profile.jsp").forward(request, response);
                } catch (ServletException e) {
                    e.printStackTrace();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }else {
                try {
                    PrintWriter out = response.getWriter();
                    out.write("Sorry Can' Login");
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }

        }, ()-> System.out.println("User is null"));
*/

    }

    public void proceed() {

        boolean b = true;
        if (b) {
            response.setContentType("text/html");
            try {
                request.getRequestDispatcher("/WEB-INF/views/profile.jsp").forward(request, response);
            } catch (ServletException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }
        } else {
            try {
                PrintWriter out = response.getWriter();
                out.write("Sorry Can' Login");
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    public void allUsers(){
        List<User> userList = userDAO.getUserList();
        userList.forEach(System.out::println);
    }

}
