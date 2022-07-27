package com.techblog.filters;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;

@WebFilter(filterName = "stayClean", urlPatterns = {"/login", "/index", "/RegisterPage"})
public class stayClean implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {

//        HttpServletRequest httpRequest = (HttpServletRequest) request;
//        HttpSession session = httpRequest.getSession();
//        User user = (User) session.getAttribute("user");
//
//        if (user != null) {
//            httpRequest.getSession(false).invalidate();
//            httpRequest.getSession(!httpRequest.getSession().isNew());
//        }

        chain.doFilter(request, response);
    }

    @Override
    public void destroy() {

    }

}
