package com.dee.service;

import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebFilter(filterName = "SessionFilter", servletNames = {"TimelineServlet"})

public class SessionFilter implements Filter {
    public void init(FilterConfig config) throws ServletException {
    }

    public void destroy() {
    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain chain) throws ServletException, IOException {

        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpServletResponse response = (HttpServletResponse) servletResponse;

        if(request.getSession().getAttribute("userID") == null) {
            request.getRequestDispatcher("index.jsp").forward(request, response);
            //response.getWriter().println("You are not authorize to be here, go back adnd to logged in page!!!!");
        } else {

            chain.doFilter(request, response);
        }

    }
}
