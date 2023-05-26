package com.studentinfo.model;

/**
 * 
 * @author Sachin Sharma
 */
public class ResultModel {

    private String resultID;
    private String rollno;
    private String subject;
    private String marks;
    private String semester;

    public ResultModel(String resultID, String rollno, String subject, String marks, String semester) {
        this.resultID = resultID;
        this.rollno = rollno;
        this.subject = subject;
        this.marks = marks;
        this.semester = semester;
    }

    public ResultModel(String rollno, String subject, String marks, String semester) {
        this.rollno = rollno;
        this.subject = subject;
        this.marks = marks;
        this.semester = semester;
    }

    public String getSemester() {
        return semester;
    }

    public void setSemester(String semester) {
        this.semester = semester;
    }

    public String getRollno() {
        return rollno;
    }

    public void setRollno(String rollno) {
        this.rollno = rollno;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public String getMarks() {
        return marks;
    }

    public void setMarks(String marks) {
        this.marks = marks;
    }

    public String getResultID() {
        return resultID;
    }

    public void setResultID(String resultID) {
        this.resultID = resultID;
    }

}
