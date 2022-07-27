package com.techblog.servlets;

import com.techblog.dao.comment_dao;
import com.techblog.entities.Comment;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@MultipartConfig
@WebServlet(name = "CommentOnPost", urlPatterns = {"/Comment"})
public class CommentOnPost extends HttpServlet {
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String pid = request.getParameter("pid_sbp");
        String user_id = request.getParameter("user_id_sbp");
        String comment = request.getParameter("commenttxt_sbp");

        if (pid == null | user_id == null | comment == null) {
            response.getWriter().print("Empty Comment");
            return;
        }

        try {
            response.setContentType("text/html;charset=UTF-8");
            comment_dao commentDao = new comment_dao();
            Comment currentComment = commentDao.addAndGetComment(pid.trim(), user_id.trim(), comment.trim());

            if (currentComment != null) {
                try (PrintWriter out = response.getWriter()) {
                    out.print("success ");
//                    out.print(currentComment.getUsername() + " ");
//                    out.print(currentComment.getComment() + " ");
                    out.print(DateFormat.getDateTimeInstance().format(currentComment.getTimestamp()));          
                }
            } else {
               response.getWriter().print("Unable to comment, try again later.");
            }
        } catch (IOException exception) {
            Logger.getLogger(CommentOnPost.class.getName()).log(Level.SEVERE, null, exception);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        processRequest(req, resp);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
