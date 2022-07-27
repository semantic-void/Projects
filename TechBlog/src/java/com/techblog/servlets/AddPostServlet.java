package com.techblog.servlets;

import com.techblog.dao.post_dao;
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
import javax.servlet.http.Part;
import com.techblog.servletObjects.AddPost;

@WebServlet(name = "AddPostServlet", urlPatterns = {"/AddPostServlet"})
@MultipartConfig
public class AddPostServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     * @throws java.sql.SQLException
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter();) {
            AddPost post = new AddPost();
            Part post_pic = request.getPart("picture_");

            if (post_pic.getSize() == 0) {
                post.postWithoutImage(out, request);
            } else {
                post.postWithImage(out, request);
            }

        } catch (IOException | SQLException | ServletException ex) {
            response.getWriter().print("Exception");
            Logger.getLogger(post_dao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(AddPostServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
/*          
            PrintWriter out = response.getWriter();
            String title = request.getParameter("title");
            String content = request.getParameter("content");
            String program = request.getParameter("program");
            String category = request.getParameter("category");
            Part post_pic = request.getPart("picture_");
          
            HttpSession session = request.getSession();
            User user = (User) session.getAttribute("user");
            
            Posts post = new Posts(category, user.getUser_id(), title, content, program, post_pic.getSubmittedFileName());
            post_dao addPost = new post_dao(connection.connect());
            Posts postOut = addPost.post(post);
            
            if (postOut != null) {
                out.print("success");
                String path = request.getRealPath("/") + "pics" + File.separator + user.getUser_id() + File.separator + post_pic.getSubmittedFileName();
                profilePicManagement.saveFlie(post_pic.getInputStream(), path);
            } else {
                out.print("fail");
            }

 */