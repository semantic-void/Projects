package com.studentinfo.dao;

import com.studentinfo.service.DBCPDataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Sachin Sharma
 */
public class AdminDao {

    public boolean login(String name, String passwod) {
        boolean flag = false;

        try (Connection con = DBCPDataSource.getConnection()) {
        
            PreparedStatement stm = con.prepareStatement("select * from admin where username = ? and password = ? ");
            stm.setString(1, name);
            stm.setString(2, passwod);
            ResultSet resultSet = stm.executeQuery();
            while (resultSet.next()) {
                flag = true;
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(AdminDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return flag;
    }
}
