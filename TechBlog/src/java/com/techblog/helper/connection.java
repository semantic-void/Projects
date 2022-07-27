
package com.techblog.helper;

import com.techblog.dao.comment_dao;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JOptionPane;

public class connection {

    public static Connection con;

    public static Connection connect() throws SQLException {
        try {
            con = DriverManager.getConnection("jdbc:sqlite:D:/Programing/Projects/WebProjects/TechBlog/TechBlogDB/TechBlog.db");
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "SQL Exception" + ex.getSQLState());
            Logger.getLogger(comment_dao.class.getName()).log(Level.WARNING,null,ex);
        }
        return con;
    }
}
