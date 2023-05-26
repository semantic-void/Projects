package com.studentinfo.model;

/**
 * 
 * @author Sachin Sharma
 */
public class StudentModel {

    private String rollno;
    private String name;
    private String fathersName;
    private String phoneNo;
    private String address;
    private String course;
    private String gender;
    private String password;
    private String inst1;
    private String inst2;

    public StudentModel() {
    }

    public StudentModel(String rollno, String name, String fathersName, String phoneNo, 
            String address, String course, String inst1, String inst2, String gender) {
        this.rollno = rollno;
        this.name = name;
        this.fathersName = fathersName;
        this.phoneNo = phoneNo;
        this.address = address;
        this.course = course;
        this.gender = gender;
        this.inst1 = inst1;
        this.inst2 = inst2;
    }

    public StudentModel(String rollno, String name, String fathersName, String phoneNo,
            String address, String course, String inst1, String inst2) {
        this.rollno = rollno;
        this.name = name;
        this.fathersName = fathersName;
        this.phoneNo = phoneNo;
        this.address = address;
        this.course = course;
        this.inst1 = inst1;
        this.inst2 = inst2;
    }

    
    public StudentModel(String rollno, String name, String fathersName, String phoneNo,
            String address, String course, String gender) {
        this.rollno = rollno;
        this.name = name;
        this.fathersName = fathersName;
        this.phoneNo = phoneNo;
        this.address = address;
        this.course = course;
        this.gender = gender;
    }

    public String getRollno() {
        return rollno;
    }

    public void setRollno(String rollno) {
        this.rollno = rollno;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getFathersName() {
        return fathersName;
    }

    public void setFathersName(String fathersName) {
        this.fathersName = fathersName;
    }

    public String getPhoneNo() {
        return phoneNo;
    }

    public void setPhoneNo(String phoneNo) {
        this.phoneNo = phoneNo;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getCourse() {
        return course;
    }

    public void setCourse(String course) {
        this.course = course;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String fee) {
        this.gender = fee;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getInst1() {
        return inst1;
    }

    public void setInst1(String inst1) {
        this.inst1 = inst1;
    }

    public String getInst2() {
        return inst2;
    }

    public void setInst2(String inst2) {
        this.inst2 = inst2;
    }
    
    @Override
    public String toString() {
        return "StudentModel{" + "rollno=" + rollno + ", name=" + name + ", fathersName=" + fathersName + ", phoneNo=" + phoneNo + ", address=" + address + ", course=" + course + ", fee=" + gender + '}';
    }

}
