package com.studentinfo.dao;

import com.studentinfo.model.ResultModel;
import com.studentinfo.service.DBCPDataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Sachin Sharma
 */
public class ResultDao {

    public boolean result(String rollno, String subject, String marks, String semester) {
        boolean flag = false;
        try ( Connection con = DBCPDataSource.getConnection()) {
            PreparedStatement stm = con.prepareStatement("INSERT INTO `spring`.`result` (`rollno`, `subject`, `marks`, `semester`) VALUES (?,?,?,?);");
            stm.setString(1, rollno);
            stm.setString(2, subject);
            stm.setString(3, marks);
            stm.setString(4, semester);
            int v = stm.executeUpdate();
            if (v == 1) {
                flag = true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(ResultDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return flag;
    }

    public ArrayDeque<ResultModel> fetchAllResults() {
        ArrayDeque<ResultModel> resultList = new ArrayDeque<>();
        try ( Connection con = DBCPDataSource.getConnection()) {
            PreparedStatement stm = con.prepareStatement("SELECT * from result");
            ResultSet resultSet = stm.executeQuery();
            while (resultSet.next()) {
                resultList.push(new ResultModel(resultSet.getString(1),
                        resultSet.getString(2),
                        resultSet.getString(3),
                        resultSet.getString(4),
                        resultSet.getString(5)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(StudentDao.class.getName()).log(Level.SEVERE, null, ex);
        }

        return resultList;
    }

    public ArrayDeque<ResultModel> fetchStudentResults(String rollno) {
        if (rollno == null) {
            return null;
        }
        ArrayDeque<ResultModel> resultList = new ArrayDeque<>();
        try ( Connection con = DBCPDataSource.getConnection()) {
            PreparedStatement stm = con.prepareStatement("SELECT * from result where rollno=? order by semester");
            stm.setString(1, rollno);
            ResultSet resultSet = stm.executeQuery();
            while (resultSet.next()) {
                resultList.add(new ResultModel(resultSet.getString(1),
                        resultSet.getString(2),
                        resultSet.getString(3),
                        resultSet.getString(4),
                        resultSet.getString(5)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(StudentDao.class.getName()).log(Level.SEVERE, null, ex);
        }

        return resultList;
    }

}
