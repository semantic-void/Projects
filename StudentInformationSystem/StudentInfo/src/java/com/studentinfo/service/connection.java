
package com.studentinfo.service;

import java.sql.SQLException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Sachin Sharma
 */
public class connection {
    private static Connection con;
    
    public static Connection connect(){
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/spring","root","Sachin#*9888");
        }
        catch(SQLException | ClassNotFoundException ex){
          Logger.getLogger(connection.class.getName()).log(Level.SEVERE, null, ex);
        }
        return con;
    }
}
