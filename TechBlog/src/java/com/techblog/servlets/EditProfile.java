package com.techblog.servlets;

import com.techblog.dao.user_dao;
import com.techblog.entities.Message;
import com.techblog.entities.User;
import com.techblog.helper.connection;
import com.techblog.helper.UserFilesManagement;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@WebServlet(name = "EditProfile", urlPatterns = {"/EditProfile"})
@MultipartConfig
public class EditProfile extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        HttpSession session = request.getSession();
        try (PrintWriter out = response.getWriter()) {
            String user_name = request.getParameter("user_name");
            String email = request.getParameter("email");
            String about = request.getParameter("about");

            User user = (User) session.getAttribute("user");
            String oldFile = user.getProfile_pic(); // capure old file name to delete
            //The user inside the sesssion is updated.
            user.setUser_name(user_name);
            user.setE_mail(email);
            user.setAbout(about);
            user_dao userDao = new user_dao(connection.connect());

            /**
             * Image capture...
             * The part never comes null the way we can check for file is by 
             * checking for files name
             */
            Part profile_pic = request.getPart("image");
            if (profile_pic != null && !"".equals(profile_pic.getSubmittedFileName())) {
                String pic_name = profile_pic.getSubmittedFileName();
                user.setProfile_pic(pic_name);
                System.out.println(profile_pic+" inn");
            }
            
                System.out.println(profile_pic+" out");
            /**
             * updating and processing.
             */
            User user1 = userDao.updateUser(user);
            if (user1 != null) {
                if (user1.getError() != null && user1.getError().getErrorCode().trim().equals("19")) {
                    System.out.println("error 19 here ");
                    Message msg = new Message("The username/E-mail is allready taken, please change.", "error", "alert-danger");
                    session.setAttribute("message", msg);
                    out.print("User Allready Exist");
                    return;
                }
                //delete old file
                String oldPath = request.getRealPath("/") + "pics" + File.separator + user.getUser_id() + File.separator + oldFile;
                UserFilesManagement.deleteFile(oldPath);
                //save new file
                String path = request.getRealPath("/") + "pics" + File.separator + user.getUser_id() + File.separator + user.getProfile_pic();
                UserFilesManagement.saveFlie(profile_pic.getInputStream(), path);
                Message msg = new Message("Updation Success.", "Success", "alert-success");
                session.setAttribute("message", msg);
            } else {
                out.print("Faild");
                Message msg = new Message("Updation faild.", "error", "alert-danger");
                session.setAttribute("message", msg);
            }

        } catch (IOException | SQLException | ServletException ex) {
            Logger.getLogger(EditProfile.class.getName()).log(Level.SEVERE, null, ex + "fine fine");
            Message msg = new Message("Error occur.", "error", "alert-danger");
            session.setAttribute("message", msg);
        }
    }

    @Override
    protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }
}
