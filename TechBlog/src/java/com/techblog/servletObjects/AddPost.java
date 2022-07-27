package com.techblog.servletObjects;

import com.techblog.dao.post_dao;
import com.techblog.entities.Posts;
import com.techblog.entities.User;
import com.techblog.helper.connection;
import com.techblog.helper.UserFilesManagement;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

public class AddPost {

    public void postWithImage(PrintWriter out, HttpServletRequest request) throws SQLException, IOException, ServletException {
        //fetch post data
        String title = request.getParameter("title");
        String content = request.getParameter("content");
        String program = request.getParameter("program");
        String category = request.getParameter("category");
        Part post_pic = request.getPart("picture_");
        //fetch user from session
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        //post the post
        Posts post = new Posts(category, user.getUser_id(), title, content, program, post_pic.getSubmittedFileName());
        post_dao addPost = new post_dao(connection.connect());
        Posts postOut = addPost.post(post);
        if (postOut != null) {
            out.print("success");
            String path = request.getRealPath("/") + "pics" + File.separator + user.getUser_id() + File.separator + post_pic.getSubmittedFileName();
            UserFilesManagement.saveFlie(post_pic.getInputStream(), path);
        } else {
            out.print("fail");
        }
    }

    public void postWithoutImage(PrintWriter out, HttpServletRequest request) throws SQLException, IOException, ServletException {

        //fetch post data
        String title = request.getParameter("title");
        String content = request.getParameter("content");
        String program = request.getParameter("program");
        String category = request.getParameter("category");
        //fetch user from session
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        //post the post
        Posts post = new Posts(category, user.getUser_id(), title, content, program, "post_default.png");
        post_dao addPost = new post_dao(connection.connect());
        Posts postOut = addPost.post(post);
        if (postOut != null) {
            out.print("success");
        } else {
            out.print("fail");
        }

    }

}
