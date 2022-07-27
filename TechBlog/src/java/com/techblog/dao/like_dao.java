package com.techblog.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class like_dao {

    Connection con;

    public like_dao(Connection con) {
        this.con = con;
    }

    private boolean preExist(String pid, String user_id) {
        try (PreparedStatement stmnt = con.prepareStatement("select * from likes where pid=? and user_id =?");) {
            stmnt.setString(1, pid);
            stmnt.setString(2, user_id);
            try (ResultSet result = stmnt.executeQuery()) {
                if (result.next()) {
                    result.close();
                    stmnt.close();
                    return removeLike(pid, user_id);
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(like_dao.class.getName()).log(Level.SEVERE, null, ex);
        }

        return false;
    }

    private boolean removeLike(String pid, String user_id) {
        try {
            con.setAutoCommit(false);
            try (PreparedStatement stmnt = con.prepareStatement("delete from likes where pid=? and user_id =?")) {
                stmnt.setString(1, pid);
                stmnt.setString(2, user_id);
                stmnt.executeUpdate();
                con.commit();
            }
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(like_dao.class.getName()).log(Level.SEVERE, null, ex);
        }

        return false;
    }

    public boolean insertLike(String pid, String user_id) {
        try {
            if (preExist(pid, user_id)) {
                return false;
            }
            con.setAutoCommit(false);
            con.prepareStatement("PRAGMA foreign_keys = ON;").execute();
            try (PreparedStatement stmnt = con.prepareStatement("insert into likes(pid,user_id) values(?,?)")) {
                stmnt.setString(1, pid);
                stmnt.setString(2, user_id);
                stmnt.executeUpdate();
                con.commit();
            }
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(like_dao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                con.close();
            } catch (SQLException ex) {
                Logger.getLogger(like_dao.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return false;
    }

    public Integer totalLikes(String pid) {
        try (PreparedStatement stmnt = con.prepareStatement("select count(*) from likes where pid=?");) {
            stmnt.setString(1, pid);
            try (ResultSet result = stmnt.executeQuery()) {
                if (result.next()) {
                    return result.getInt("count(*)");
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(like_dao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                con.close();
            } catch (SQLException ex) {
                Logger.getLogger(like_dao.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return null;
    }

    public Boolean isLikedByUser(Integer pid, Integer user_id) {
        try( PreparedStatement stmnt = 
                con.prepareStatement("select * from likes where pid=? user_id=?");){
            stmnt.setInt(1, pid);
            stmnt.setInt(1, user_id);
            try (ResultSet result = stmnt.executeQuery()) {
                if (result.next()) {
                    return true;
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(like_dao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                con.close();
            } catch (SQLException ex) {
                Logger.getLogger(like_dao.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return false;
    }

    public Boolean deleteLike(Integer pid, Integer user_id) {
        try {
            con.setAutoCommit(false);
            con.prepareStatement("PRAGMA foreign_keys = ON;").execute();
            try (PreparedStatement stmnt = con.prepareStatement("delete from likes where pid=? user_id=?")) {
                stmnt.setInt(1, pid);
                stmnt.setInt(1, user_id);
                stmnt.executeUpdate();
                con.commit();
            }
            return true;

        } catch (SQLException ex) {
            Logger.getLogger(like_dao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                con.close();
            } catch (SQLException ex) {
                Logger.getLogger(like_dao.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return false;
    }

}
