package com.techblog.servlets;

import com.techblog.dao.user_dao;
import com.techblog.entities.GenerateCookies;
import com.techblog.entities.Message;
import com.techblog.entities.User;
import com.techblog.helper.connection;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@MultipartConfig
public class Login extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {

        try (PrintWriter out = response.getWriter();
                Connection con = connection.connect();) {

            StringBuilder username = new StringBuilder();
            username.append(request.getParameter("user_name").trim());
            StringBuilder password = new StringBuilder();
            password.append(request.getParameter("password").trim());
            String checkbox = request.getParameter("userOrEmail");

            user_dao UserDao = new user_dao(con);
            User user = checkbox == null ? UserDao.getUserByUsername(username.toString(),
                    password.toString()) : UserDao.getUserByEmail(username.toString(), password.toString());

            if (user != null) {
                out.print("Login Success.");
                GenerateCookies generateC = new GenerateCookies(user);
                generateC.setCookiesToSend(response);
                HttpSession session = request.getSession();
                session.setAttribute("user", user);
            } else {
                Message msg = new Message("Invalid details !", "error", "alert-danger");
                HttpSession session = request.getSession();
                session.setAttribute("message", msg);
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(Login.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

}
