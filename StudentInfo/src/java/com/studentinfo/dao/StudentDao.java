package com.studentinfo.dao;

import com.studentinfo.model.StudentModel;
import com.studentinfo.service.DBCPDataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Sachin Sharma
 */
public class StudentDao {

    public boolean register(String name, String fathersName, String phoneNo, String address, String course, String fee, String password) {
        boolean flag = false;
        try ( Connection con = DBCPDataSource.getConnection()) {
            PreparedStatement stm = con.prepareStatement("INSERT INTO `spring`.`student` (`name`, `fathersName`, `phoneNo`, `address`, `course`, `fee`, `password`)"
                    + " VALUES (?, ?, ?, ?, ?, ?, ?)");
            stm.setString(1, name);
            stm.setString(2, fathersName);
            stm.setString(3, phoneNo);
            stm.setString(4, address);
            stm.setString(5, course);
            stm.setString(6, fee);
            stm.setString(7, password);
            int v = stm.executeUpdate();
            if (v == 1) {
                flag = true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(StudentDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return flag;
    }

    public boolean register(String name, String fathersName, String phoneNo, String address, String course, String inst1, String inst2, String password, String gender) {
        boolean flag = false;
        try ( Connection con = DBCPDataSource.getConnection()) {
            PreparedStatement stm = con.prepareStatement("INSERT INTO `spring`.`student`"
                    + " (`name`, `fathersName`, `phoneNo`, `address`, `course`, `feeinst1`, `feeinst2`, `password`, `gender`)"
                    + " VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)");
            stm.setString(1, name);
            stm.setString(2, fathersName);
            stm.setString(3, phoneNo);
            stm.setString(4, address);
            stm.setString(5, course);
            stm.setString(6, inst1);
            stm.setString(7, inst2);
            stm.setString(8, password);
            stm.setString(9, gender);
            int v = stm.executeUpdate();
            if (v == 1) {
                flag = true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(StudentDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return flag;
    }

    public boolean delete(String rollno) {
        boolean flag = false;
        try ( Connection con = DBCPDataSource.getConnection();  PreparedStatement stm = con.prepareStatement(
                "Delete from student where rollno=?")) {
            stm.setString(1, rollno);
            int v = stm.executeUpdate();
            if (v == 1) {
                flag = true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(StudentDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return flag;
    }

    public boolean updateFee(String rollno, String fee) {
        boolean flag = false;
        try ( Connection con = DBCPDataSource.getConnection()) {
            PreparedStatement stm = con.prepareStatement("UPDATE `spring`.`student` SET `fee` = ? WHERE (`rollno` = ?);");
            stm.setString(1, fee);
            stm.setString(2, rollno);
            int v = stm.executeUpdate();
            if (v == 1) {
                flag = true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(StudentDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return flag;
    }

    public boolean updateFeeInstallment(String rollno, String inst1, String inst2) {
        boolean flag = false;
        try ( Connection con = DBCPDataSource.getConnection()) {
            PreparedStatement stm = con.prepareStatement("UPDATE `spring`.`student` SET `feeinst1` = ? , `feeinst2` = ? WHERE (`rollno` = ?)");
            stm.setString(1, inst1);
            stm.setString(2, inst2);
            stm.setString(3, rollno);
            int v = stm.executeUpdate();
            if (v == 1) {
                flag = true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(StudentDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return flag;
    }

    public StudentModel login(String rollno, String password) {
        StudentModel studentModel = new StudentModel();
        try ( Connection con = DBCPDataSource.getConnection()) {
            PreparedStatement stm = con.prepareStatement("SELECT * FROM spring.student where rollno =? and password = ? ");
            stm.setString(1, rollno);
            stm.setString(2, password);
            ResultSet resultSet = stm.executeQuery();
            while (resultSet.next()) {
                studentModel = new StudentModel(resultSet.getString(1),
                        resultSet.getString(2),
                        resultSet.getString(3),
                        resultSet.getString(4),
                        resultSet.getString(5),
                        resultSet.getString(6),
                        resultSet.getString(7));
            }
        } catch (SQLException ex) {
            Logger.getLogger(StudentModel.class.getName()).log(Level.SEVERE, null, ex);
        }
        return studentModel;
    }

    public List<StudentModel> fetchAllStudents2() {
        List<StudentModel> studentList = new ArrayList<>();
        try ( Connection con = DBCPDataSource.getConnection()) {
            PreparedStatement stm = con.prepareStatement("SELECT * from student");
            ResultSet resultSet = stm.executeQuery();
            while (resultSet.next()) {
                studentList.add(new StudentModel(resultSet.getString(1),
                        resultSet.getString(2),
                        resultSet.getString(3),
                        resultSet.getString(4),
                        resultSet.getString(5),
                        resultSet.getString(6),
                        resultSet.getString(7)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(StudentDao.class.getName()).log(Level.SEVERE, null, ex);
        }

        return studentList;
    }

    public List<StudentModel> fetchAllStudents() {
        List<StudentModel> studentList = new ArrayList<>();
        try ( Connection con = DBCPDataSource.getConnection()) {
            PreparedStatement stm = con.prepareStatement("SELECT * from student");
            ResultSet resultSet = stm.executeQuery();
            while (resultSet.next()) {
                studentList.add(new StudentModel(resultSet.getString(1),
                        resultSet.getString(2),
                        resultSet.getString(3),
                        resultSet.getString(4),
                        resultSet.getString(5),
                        resultSet.getString(6),
                        resultSet.getString(9),
                        resultSet.getString(10),
                        resultSet.getString(7)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(StudentDao.class.getName()).log(Level.SEVERE, null, ex);
        }

        return studentList;
    }

    public List<StudentModel> fetchStudent(String rollno) {
        List<StudentModel> studentList = new ArrayList<>();
        try ( Connection con = DBCPDataSource.getConnection()) {
            PreparedStatement stm = con.prepareStatement("SELECT * from student where rollno = ?");
            stm.setString(1, rollno);
            ResultSet resultSet = stm.executeQuery();
            while (resultSet.next()) {
                studentList.add(new StudentModel(resultSet.getString(1),
                        resultSet.getString(2),
                        resultSet.getString(3),
                        resultSet.getString(4),
                        resultSet.getString(5),
                        resultSet.getString(6),
                        resultSet.getString(7)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(StudentDao.class.getName()).log(Level.SEVERE, null, ex);
        }

        return studentList;
    }
}
