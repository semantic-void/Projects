
package com.studentinfo.service;

import java.sql.SQLException;
import org.apache.tomcat.dbcp.dbcp2.BasicDataSource;

/**
 *
 * @author Sachin Sharma
 */
public class DBCPDataSource {

    private static BasicDataSource ds = new BasicDataSource();

    static {
        ds.setUrl("jdbc:mysql://localhost:3306/spring");
        ds.setUsername("Main");
        ds.setPassword("2336");
        ds.setMinIdle(5);
        ds.setMaxIdle(10);
        ds.setMaxOpenPreparedStatements(100);
        ds.setDriverClassName("com.mysql.cj.jdbc.Driver");
    }

    public static java.sql.Connection getConnection() throws SQLException {
     
        return (java.sql.Connection) ds.getConnection();
    }

    private DBCPDataSource() {
    
    } 
}
