package com.controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "MainServlet", value = "/MainServlet")
public class MainServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String route =  request.getServletPath();
        System.out.println("user route " +  route);
        switch (route){
            case "/viewPosts":
                showPosts(request, response);
                break;
            case "/like":
                likeOrUnlikePost(request, response);
                break;
            case "/edit":
                showEditPostPage(request, response);
                break;
            case "/delete":
                deletePost(request, response);

        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            doGet(request,response);
    }

    private void deletePost(HttpServletRequest request, HttpServletResponse response) {
    }

    private void showEditPostPage(HttpServletRequest request, HttpServletResponse response) {
    }

    private void likeOrUnlikePost(HttpServletRequest request, HttpServletResponse response) {
    }

    private void showPosts(HttpServletRequest request, HttpServletResponse response) {
    }
}
