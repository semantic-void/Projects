package com.techblog.servletObjects;

import com.techblog.dao.user_dao;
import com.techblog.entities.User;
import com.techblog.helper.UserFilesManagement;
import com.techblog.helper.connection;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.Part;

public class CreateUser {

    private String userId = null;

    public boolean createUser(PrintWriter out, HttpServletRequest request) throws SQLException, IOException, ServletException {

        User user = this.createUser(request);

        if ("boyTecHBlue.png".equals(user.getProfile_pic())
                || "girlTechPurple.png".equals(user.getProfile_pic())) {
            this.addUserToDB(user, out, false);
            return true;
        } else {
            if (addUserToDB(user, out, true)) {
                Part profilePic = request.getPart("profile_pic");
                UserFilesManagement.saveFlie(profilePic.getInputStream(),
                        String.valueOf(request.getRealPath("/") + "pics"
                                + File.separator + userId + File.separator
                                + profilePic.getSubmittedFileName()));
                return true;
            }
        }
        return false;
    }

    private boolean addUserToDB(User user, PrintWriter out,
            boolean isImageUserDefined) throws SQLException {
        user_dao userDao = new user_dao(connection.connect());
        //pss it User object
        if (userDao.saveUser(user, isImageUserDefined)) {
            out.print("New User created");
            userId = userDao.getUserId(user.getUser_name());
            return true;
        } else {
            if (userDao.ERROR.getErrorCode().equals("19")) {
                out.println("\nUser/E-mail name is allready taken.");
                return false;
            }
            out.print("\nCreation faild: " + userDao.ERROR.getErrorMessage());
            return false;
        }
    }

    private User createUser(HttpServletRequest request) throws IOException, ServletException {

        StringBuilder name = new StringBuilder();
        name.append(request.getParameter("user_name"));
        StringBuilder password = new StringBuilder();
        password.append(request.getParameter("user_password"));
        String e_mail = request.getParameter("user_email");
        String about = request.getParameter("about");
        String gender = request.getParameter("user_gender");
        Part profilePic = request.getPart("profile_pic");
        if (!"".equals(profilePic.getSubmittedFileName())) {
            return new User(name.toString().trim().toLowerCase(),
                    password.toString().trim(), e_mail.trim().toLowerCase(),
                    gender.trim().toLowerCase(), about.trim(), profilePic.getSubmittedFileName());
        }
        return new User(name.toString().trim().toLowerCase(),
                password.toString().trim(), e_mail.trim().toLowerCase(),
                gender.trim().toLowerCase(), about.trim(),
                ("male".equals(gender) ? "boyTecHBlue.png" : "girlTechPurple.png"));
    }
}
