package com.techblog.servlets;

import com.techblog.entities.User;
import com.techblog.servletObjects.CreateUser;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @MultipartConfig: It makes the servlet to access any type of data because we
 * have not define the content type in ajax of registration jsp form Also for
 * processing image or large data.
 */
@MultipartConfig
public class Register extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter();) {
            //this segment of checkbox checking is unrecahble as it is validated at frontend 
            String check = request.getParameter("check");
            if (check == null) {
                out.print("Please check tearms and conditions...");
                return;
            }

            new CreateUser().createUser(out, request);

        } catch (SQLException ex) {
            Logger.getLogger(Register.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    protected User createUser(HttpServletRequest request) {

        StringBuilder name = new StringBuilder();
        name.append(request.getParameter("user_name"));
        StringBuilder password = new StringBuilder();
        password.append(request.getParameter("user_password"));
        String e_mail = request.getParameter("user_email");
        String about = request.getParameter("about");
        String gender = request.getParameter("user_gender");

        return new User(name.toString().trim().toLowerCase(),
                password.toString().trim(), e_mail.trim().toLowerCase(),
                gender.trim().toLowerCase(), about.trim());
    }
}

            /*
              Connection con = connection.connect();
              User user = createUser(request);
              create Dao of User and pass it connection
              Connection con = connection.connect();
              System.out.println("ok`");
              user_dao UserDao = new user_dao(con);
              //pss it User object
            if (UserDao.saveUser(user,true)) {
                out.print("New User created");
            } else {
                if (UserDao.ERROR.getErrorCode().equals("19")) {
                    out.println("\nUser/E-mail name is allready taken.");
                }
                out.print("\nCreation faild: " + UserDao.ERROR.getErrorMessage());
            }
            */
