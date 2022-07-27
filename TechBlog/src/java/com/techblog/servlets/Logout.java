package com.techblog.servlets;

import com.techblog.entities.Message;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * I can have just open the page "index or login" from Logout option of navbar
 * and relay on filter "stayClean" to recreate session. But i made a different
 * Logout servlet "The current servlet, from which this documentation belongs"
 * to be doubly sure, but honestly there is no need of it. However in this page
 * we are removing user object and in rest of pages stayClean creates a all new
 * session.
 *
 * Logic: 1. We are overriding session element message and removing the user
 * class object from session. 2. There is no direct way to clean cookies in
 * Servlet or JSP. If you want to delete a cookie you have to create a cookie
 * that have the same name with the cookie that you want to delete and set the
 * value to an empty string. You also need to set the max age of the cookie to
 * 0. And then add this cookie to the servlet’s response object.
 *
 * // // To delete a cookie, we need to create a cookie that have the same //
 * name with the cookie that we want to delete. We also need to set // the max
 * age of the cookie to 0 and then add it to the Servlet's // response method.
 * // 
 * Cookie cookie = new Cookie("username", ""); 
 * cookie.setMaxAge(0);
 * response.addCookie(cookie);
 */
@WebServlet(name = "Logout", urlPatterns = {"/Logout"})
public class Logout extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        HttpSession session = request.getSession();
        session.removeAttribute("user");
        Message msg = new Message("Logout Successfuly", "success", "alert-success");
        session.setAttribute("message", msg);
        response.sendRedirect("login");
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        processRequest(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

}
