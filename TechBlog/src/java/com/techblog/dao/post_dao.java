/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.techblog.dao;

import com.techblog.entities.Category;
import com.techblog.entities.Posts;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Stack;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 */
public class post_dao implements Serializable{

    Connection con;

    public post_dao(Connection con) {
        this.con = con;
    }

    public ArrayList<Category> getCategories() throws SQLException {
        ArrayList<Category> cat = null;
        try {
            ArrayList<Category> cat2 = new ArrayList<>();
            con.setAutoCommit(false); //safety from sql injection
            con.prepareStatement("PRAGMA foreign_keys = ON;").execute();//waste line
            PreparedStatement ps = con.prepareStatement("select * from categories");
            ResultSet result = ps.executeQuery();
            while (result.next()) {
                Integer cid = result.getInt(1);
                Category category = new Category(cid.toString(), result.getString(2), result.getString(3));
                // cant add into "cat" first list directly because try block dosent propagate the statement.
                /*
                How this way of two varibales is'nt showing null pointer exception.
                Like cat.add(category) was throung null pointer exception.
                Eventho the value is not null. its list itself who isnt allowing.
                because another variables get upadtes inside try catch block.=
                 */
                cat2.add(category);
                cat = cat2;
            }
        } catch (SQLException ex) {
            Logger.getLogger(post_dao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (con != null) {
                con.close();
            }
        }
        return cat;
    }

    public Posts post(Posts post) throws SQLException {

        try {
            con.setAutoCommit(false);
            con.prepareStatement("PRAGMA foreign_keys = ON;").execute();
            PreparedStatement ps = con.prepareStatement("INSERT into posts (cid,title,user_id,content,picture,code) VALUES (?,?,?,?,?,?)");
            ps.setString(1, post.getCid());
            ps.setString(2, post.getTitle());
            ps.setString(3, post.getUser_id());
            ps.setString(4, post.getContent());
            ps.setString(5, post.getRelatedPic());
            ps.setString(6, post.getCode());
            ps.executeUpdate();
            con.commit();
            ps.close();
        } catch (SQLException ex) {
            post = null;
            Logger.getLogger(post_dao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (con != null) {
                con.close();
            }
        }
        return post;
    }

    public Posts getPostById(String pid) throws SQLException {
        Posts post = null;
        try {
            PreparedStatement ps = con.prepareStatement("select * from posts where pid =?");
            ps.setString(1, pid);
            ResultSet rs = ps.executeQuery();
//            pid|cid|title|content|picture|code|Date|user_id

            StringBuilder pid_ = new StringBuilder();
            StringBuilder cid = new StringBuilder();
            StringBuilder title = new StringBuilder();
            StringBuilder content = new StringBuilder();
            StringBuilder picture = new StringBuilder();
            StringBuilder code = new StringBuilder();
            StringBuilder user_id = new StringBuilder();
            pid_.append(rs.getString("pid"));
            cid.append(rs.getString("cid"));
            title.append(rs.getString("title"));
            content.append(rs.getString("content"));
            picture.append(rs.getString("picture"));
            code.append(rs.getString("code"));
            Timestamp Date = rs.getTimestamp("Date");
            user_id.append(rs.getString("user_id"));

            post = new Posts(cid.toString(), pid_.toString(), user_id.toString(), title.toString(), content.toString(), code.toString(), picture.toString(), Date);
            ps.close();
            rs.close();
        } catch (SQLException ex) {
        } finally {
            if (con != null) {
                con.close();
            }
        }
        return post;
    }

    public Stack<Posts> getAllPosts() throws SQLException {
        Stack<Posts> stack = new Stack<>();
        try {
            Stack<Posts> stackCap = new Stack<>();
            PreparedStatement pst = con.prepareStatement("Select * from posts");
            ResultSet rst = pst.executeQuery();
            while (rst.next()) {
//pid|cid|title|content|picture|code|Date|user_id
//public Posts(String cid, String pid, String user_id, String title, String content, String profile_pic, Timestamp DateTime) 
                Posts post
                        = new Posts(rst.getString("cid"), rst.getString("pid"), rst.getString("user_id"), rst.getString("title"), rst.getString("content"), rst.getString("picture"), rst.getTimestamp("Date"));
                stackCap.push(post);
            }
            stack = stackCap;
            pst.close();
            rst.close();
        } catch (SQLException ex) {
            System.out.println(ex);
        }finally {
            if (con != null) {
                con.close();
            }
        }

        return stack;
    }

    public Stack<Posts> getAllPostsById(String cat) throws SQLException {
//        String id = cat.getCid();
        String id = cat;
        Stack<Posts> stack = new Stack<>();
        try {
            Stack<Posts> stackCap = new Stack<>();
            PreparedStatement pst = con.prepareStatement("Select * from posts where cid = ? order by pid");
            pst.setString(1, id);
            ResultSet rst = pst.executeQuery();
            while (rst.next()) {
//pid|cid|title|content|picture|code|Date|user_id
//public Posts(String cid, String pid, String user_id, String title, String content, String profile_pic, Timestamp DateTime) 
                Posts post
                        = new Posts(rst.getString("cid"), rst.getString("pid"), rst.getString("user_id"), rst.getString("title"), rst.getString("content"), rst.getString("picture"), rst.getTimestamp("Date"));
                stackCap.push(post);
            }
            stack = stackCap;
            pst.close();
            rst.close();
        } catch (Exception ex) {
            System.out.println(ex);
            ex.printStackTrace();
        }finally {
            if (con != null) {
                con.close();
            }
        }

        return stack;
    }
}
