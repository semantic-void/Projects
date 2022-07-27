package com.techblog.dao;

import com.techblog.entities.Comment;
import com.techblog.helper.connection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayDeque;
import java.util.logging.Level;
import java.util.logging.Logger;

public class comment_dao {

    public comment_dao() {
    }

    /**
     * @param pid: pid is post_id
     * @return ArrayList of Comment entity.
     */
    public ArrayDeque<Comment> getCommentsOnPost(String pid) {
        ArrayDeque<Comment> comments = new ArrayDeque<>();
        try (Connection con = connection.connect();
                PreparedStatement ps = con.prepareStatement("select * from comments where pid=?")) {
            ps.setString(1, pid);
            try (ResultSet result = ps.executeQuery()) {
                while (result.next()) {
                    Comment comment = new Comment(result.getString("comment_id"),
                            result.getString("pid"), result.getString("user_id"), result.getString("comment"), result.getTimestamp("Date"));
                    comments.push(comment);
                }
            }
        } catch (SQLException exception) {
            Logger.getLogger(comment_dao.class.getName()).log(Level.SEVERE, null, exception);
        }
        return comments;
    }

    public Integer getNumberOfCommnets(String pid) {
        try (Connection con = connection.connect();
                PreparedStatement ps = con.prepareStatement("select count(comment_id) from comments where pid=?;");) {
            ps.setString(1, pid);
            Integer out;
            try (ResultSet result = ps.executeQuery()) {
                result.next();
                out = result.getInt(1);
            }
            return out;
        } catch (SQLException exception) {
            Logger.getLogger(comment_dao.class.getName()).log(Level.SEVERE, null, exception);
        }
        return null;
    }

    public boolean addComment(String pid, String user_id, String comment) {
        try (Connection con = connection.connect()) {
            con.setAutoCommit(false);
            con.prepareStatement("PRAGMA foreign_keys = ON;").execute();
            try (PreparedStatement ps = con.prepareStatement("insert into comments(pid,user_id,comment) Values (?,?,?)")) {
                ps.setString(1, pid);
                ps.setString(2, user_id);
                ps.setString(3, comment);
                ps.executeUpdate();
                con.commit();
            }
            return true;
        } catch (SQLException exception) {
            Logger.getLogger(comment_dao.class.getName()).log(Level.SEVERE, null, exception);
        }
        return false;
    }

    public Comment addAndGetComment(String pid, String user_id, String comment) {
        try (Connection con = connection.connect()) {
            con.setAutoCommit(false);
            con.prepareStatement("PRAGMA foreign_keys = ON;").execute();
            try (PreparedStatement ps = con.prepareStatement("insert into comments(pid,user_id,comment) Values (?,?,?)")) {
                ps.setString(1, pid);
                ps.setString(2, user_id);
                ps.setString(3, comment);
                ps.executeUpdate();
                con.commit();
            }
            Comment comment1 = null;
            try (PreparedStatement ps = con.prepareStatement("select * from comments where pid=? and user_id=? and comment=?;")) {
                ps.setString(1, pid);
                ps.setString(2, user_id);
                ps.setString(3, comment);
                ResultSet resultSet = ps.executeQuery();
                resultSet.next();
                comment1 = new Comment(new user_dao(con).getUsername(user_id), resultSet.getString("comment"), resultSet.getTimestamp("Date"));
            }
            return comment1;
        } catch (SQLException exception) {
            Logger.getLogger(comment_dao.class.getName()).log(Level.SEVERE, null, exception);
        }
        return null;
    }

}
