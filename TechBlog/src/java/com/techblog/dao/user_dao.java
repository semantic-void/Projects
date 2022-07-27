package com.techblog.dao;

import com.techblog.entities.sql_errors;
import java.sql.Connection;
import java.sql.PreparedStatement;
import com.techblog.entities.User;
import com.techblog.helper.connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class user_dao {

    private Connection con;
    public final sql_errors ERROR;

    /**
     * It will initialize one time connection which will close after each method
     * call. Have to re-pass connection manually through getters and setters.
     *
     * @param con
     */
    public user_dao(Connection con) {
        this.con = con;
        ERROR = new sql_errors();
    }

    /**
     * It will auto initialize connection, which will be closed after each DAO
     * method invoked. User have to re-pass connection manually through getters
     * and setters.
     *
     * @throws SQLException
     */
    public user_dao() throws SQLException {
        con = connection.connect();
        ERROR = new sql_errors();
    }

    public Connection getCon() {
        return con;
    }

    public void setCon(Connection con) {
        this.con = con;
    }

    /**
     * DAO method for SignUp
     *
     * @param user
     * @return
     * @throws SQLException
     */
    public Boolean saveUser(User user) throws SQLException {
        Boolean flag = false;
        try {
            String login = "insert into login values(?,?)";
            String user_spec = "insert into user_spec values(random(),?)";
            String user_info = "insert into user_info(user_id,e_mail,gender,about,profile_pic) values(?,?,?,?,?)";
            String user_id = "select user_id from user_spec where user_name = ?";
            user.setProfile_pic("male".equals(user.getGender()) ? "boyTecHBlue.png" : "girlTechPurple.png");

            con.setAutoCommit(false);
            con.prepareStatement("PRAGMA foreign_keys = ON;").execute();
            PreparedStatement ps = con.prepareStatement(login);
            ps.setString(1, user.getUser_name());
            ps.setString(2, user.getPassword());
            ps.executeUpdate();

            PreparedStatement ps2 = con.prepareStatement(user_spec);
            ps2.setString(1, user.getUser_name());
            ps2.executeUpdate();

            PreparedStatement psFind = con.prepareStatement(user_id);
            psFind.setString(1, user.getUser_name());
            String RandomNo;
            try (ResultSet result = psFind.executeQuery()) {
                RandomNo = result.getString(1);
            }

            try (PreparedStatement ps3 = con.prepareStatement(user_info)) {
                ps3.setString(1, RandomNo);
                ps3.setString(2, user.getE_mail());
                ps3.setString(3, user.getGender());
                ps3.setString(4, user.getAbout());
                ps3.setString(5, user.getProfile_pic());
                ps3.executeUpdate();
                con.commit();
            }
            flag = true;
        } catch (SQLException ex) {
            /*ERROR code 19 for unique and primary key constrain exception beause primary have same constarint.
              ex.setNextException(ex);
              System.out.println(ex.getNextException());
             */
            Logger.getLogger(comment_dao.class.getName()).log(Level.SEVERE, null, ex);
            Integer err = ex.getErrorCode();
            ERROR.setError(err.toString(), ex.getMessage());
            flag = false;
        } finally {
            con.close();

        }
        return flag;
    }

    /**
     *
     * @param user
     * @param Image ture == shave with image, false will be save without image.
     * @return
     * @throws SQLException
     */
    public Boolean saveUser(User user, Boolean Image) throws SQLException {
        if (Image == false) {
            return saveUser(user);
        }
        Boolean flag = false;
        try {
            String login = "insert into login values(?,?)";
            String user_spec = "insert into user_spec values(random(),?)";
            String user_info = "insert into user_info(user_id,e_mail,gender,about,profile_pic) values(?,?,?,?,?)";
            String user_id = "select user_id from user_spec where user_name = ?";

            con.setAutoCommit(false);
            con.prepareStatement("PRAGMA foreign_keys = ON;").execute();
            PreparedStatement ps = con.prepareStatement(login);
            ps.setString(1, user.getUser_name());
            ps.setString(2, user.getPassword());
            ps.executeUpdate();

            PreparedStatement ps2 = con.prepareStatement(user_spec);
            ps2.setString(1, user.getUser_name());
            ps2.executeUpdate();

            PreparedStatement psFind = con.prepareStatement(user_id);
            psFind.setString(1, user.getUser_name());
            String RandomNo;
            try (ResultSet result = psFind.executeQuery()) {
                RandomNo = result.getString(1);
            }

            PreparedStatement ps3 = con.prepareStatement(user_info);
            ps3.setString(1, RandomNo);
            ps3.setString(2, user.getE_mail());
            ps3.setString(3, user.getGender());
            ps3.setString(4, user.getAbout());
            ps3.setString(5, user.getProfile_pic());
            ps3.executeUpdate();
            con.commit();
            flag = true;
        } catch (SQLException ex) {
            /*ERROR code 19 for unique and primary key constrain exception beause primary have same constarint.
              ex.setNextException(ex);
              System.out.println(ex.getNextException());
             */
            Logger.getLogger(comment_dao.class.getName()).log(Level.SEVERE, null, ex);
            Integer err = ex.getErrorCode();
            ERROR.setError(err.toString(), ex.getMessage());
            flag = false;
        } finally {
            con.close();
        }
        return flag;
    }
   
    /**
     * DAO method to Login using username and password.
     *
     * @param username
     * @param password
     * @return
     * @throws SQLException
     */
    public User getUserByUsername(String username, String password) throws SQLException {
        User user = null;

        PreparedStatement ps = null;
        ResultSet result = null;
        String log = "Select * from login where user_name = ? and password = ?";
        try {
            ps = con.prepareStatement(log);
            ps.setString(1, username);
            ps.setString(2, password);
            result = ps.executeQuery();
            if (result.next()) {
                user = new User();

                user.setUser_name(username);

                ps = con.prepareStatement("select * from user_spec where user_name = ?");
                ps.setString(1, username);
                result = ps.executeQuery();

                ps = con.prepareStatement("select * from user_info where user_id = ?");
                ps.setString(1, result.getString("user_id"));
                result = ps.executeQuery();

                user.setUser_id(result.getString("user_id"));
                user.setE_mail(result.getString("e_mail"));
                user.setGender(result.getString("gender"));
                user.setRegistertime(result.getTimestamp("Timestamp"));
                user.setAbout(result.getString("about"));
                user.setProfile_pic(result.getString("profile_pic"));
            }
            result.close();
            ps.close();
        } catch (SQLException e) {
            Logger.getLogger(comment_dao.class.getName()).log(Level.SEVERE, null, e);
            Integer err = e.getErrorCode();
            System.out.println("Error at User DAO " + err);
            ERROR.setError(err.toString(), e.getMessage());
            user = new User();
            user.setError(ERROR);
        } finally {
            if (con != null) {
                con.close();
            }
            if (result != null) {
                result.close();
            }
            if (ps != null) {
                ps.close();
            }

        }
        return user;
    }

    /**
     * DAo method to login using E-mail and password.
     *
     * @param email
     * @param password
     * @return
     * @throws SQLException
     */
    public User getUserByEmail(String email, String password) throws SQLException {

        User userOut = null;
        PreparedStatement ps = null;
        ResultSet result = null;
        try {
            User user = new User();
            ps = con.prepareStatement("Select * from user_info where e_mail = ?");
            ps.setString(1, email);
            result = ps.executeQuery();
// check email is valid
            if (result.next()) {
                // add user data
                user.setUser_id(result.getString("user_id"));
                user.setE_mail(result.getString("e_mail"));
                user.setGender(result.getString("gender"));
                user.setRegistertime(result.getTimestamp("Timestamp"));
                user.setAbout(result.getString("about"));
                user.setProfile_pic(result.getString("profile_pic"));

                ps = con.prepareStatement("Select user_name from user_spec where user_id = ?");
                ps.setString(1, result.getString("user_id"));
                result = ps.executeQuery();
// check user id for email
                if (result.next()) {
                    ps = con.prepareStatement("Select * from login where user_name = ? and password = ?");
                    ps.setString(1, result.getString("user_name"));
                    ps.setString(2, password);
                    result = ps.executeQuery();
//    get user name password                
                    if (result.next()) {
                        user.setUser_name(result.getString("user_name"));
                        user.setPassword(password);
                        System.out.println("Login success");
                        userOut = new User(user);
                    }
                }
            }
            result.close();
            ps.close();
        } catch (SQLException e) {
            Logger.getLogger(comment_dao.class.getName()).log(Level.SEVERE, null, e);
            Integer err = e.getErrorCode();
            System.out.println("Error at User DAO " + err);
            ERROR.setError(err.toString(), e.getMessage());

        } finally {
            if (con != null) {
                con.close();
            }
            if (result != null) {
                result.close();
            }
            if (ps != null) {
                ps.close();
            }
        }
        return userOut;
    }

    public User getUserByUserID(String userId) throws SQLException {
        User user = null;
        try {
            PreparedStatement ps = con.prepareStatement("select * from user_spec where user_id =?");
            ps.setString(1, userId);
            ResultSet result = ps.executeQuery();
            if (result.next()) {
                String userName = result.getString("user_name");
                user = new User();
                user.setUser_name(userName);
                user.setUser_id(userId);
            }
            result.close();
            ps.close();
        } catch (SQLException e) {
            Logger.getLogger(comment_dao.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            if (con != null) {
                con.close();
            }
        }
        return user;
    }

    /**
     * DAO method to update user data.
     *
     * @param user_
     * @return
     * @throws SQLException
     */
    public User updateUser(User user_) throws SQLException {

        User userOut = null;
        PreparedStatement ps = null;
        try {
            con.setAutoCommit(false);
            con.prepareStatement("PRAGMA foreign_keys = ON;").execute(); //neded o be turned on explicitly
            if (user_.getProfile_pic() != null && !"".equals(user_.getProfile_pic())) {
                ps = con.prepareStatement("update user_info set e_mail=? , about=? , profile_pic=? where user_id=?");
                ps.setString(1, user_.getE_mail());
                ps.setString(2, user_.getAbout());
                ps.setString(3, user_.getProfile_pic());
                ps.setString(4, user_.getUser_id());
                ps.executeUpdate();
            } else {
                ps = con.prepareStatement("update user_info set e_mail=?, about=? where user_id=?");
                ps.setString(1, user_.getE_mail());
                ps.setString(2, user_.getAbout());
                ps.setString(3, user_.getUser_id());
                ps.executeUpdate();
            }
            ps = con.prepareStatement("select * from user_spec where user_id=?");
            ps.setString(1, user_.getUser_id());
            ResultSet result = ps.executeQuery();
            String user_found;
            if (result.next()) {
                user_found = result.getString("user_name");
            } else {
                System.out.println("User not found");
                return null;
            }

            ps = con.prepareStatement("update user_spec set user_name=? where user_id=?");
            ps.setString(1, user_.getUser_name());
            ps.setString(2, user_.getUser_id());
            ps.executeUpdate();

            ps = con.prepareStatement("update login set user_name=? where user_name=?");
            ps.setString(1, user_.getUser_name());
            ps.setString(2, user_found);
            ps.executeUpdate();
            userOut = user_;
            con.commit();
            result.close();
            ps.close();
        } catch (SQLException e) {
            Logger.getLogger(comment_dao.class.getName()).log(Level.SEVERE, null, e);
            Integer err = e.getErrorCode();
            System.out.println("Error at User DAO " + err);
            ERROR.setError(err.toString(), e.getMessage());
            userOut = new User();
            userOut.setError(ERROR);
        } finally {
            if (con != null) {
                con.close();
            }
            if (ps != null) {
                ps.close();
            }
        }
        return userOut;
    }

    public String getUsername(String userId) throws SQLException {
        String userName = null;
        try (Connection conect = connection.connect();
                PreparedStatement ps = conect.prepareStatement("select * from user_spec where user_id =?");) {
            ps.setString(1, userId);
            String user = null;
            try (ResultSet result = ps.executeQuery()) {
                if (result.next()) {
                    user = result.getString("user_name");
                }
            }
            userName = user;
        } catch (SQLException ex) {
            Logger.getLogger(comment_dao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return userName;
    }

    public String getUserId(String userName) throws SQLException {
        String userID = null;
        try (Connection conect = connection.connect();
                PreparedStatement ps = conect.prepareStatement("select * from user_spec where user_name = ?");) {
            ps.setString(1, userName);
            String user = null;
            try (ResultSet result = ps.executeQuery()) {
                if (result.next()) {
                    user = result.getString("user_id");
                }
            }
            userName = user;
        } catch (SQLException ex) {
            Logger.getLogger(comment_dao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return userName;
    }
  
}
