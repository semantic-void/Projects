<%-- 
    Document   : Admin
    Created on : Nov 21, 2022, 5:52:42 PM
    Author     : Sachin Sharma
--%>

<%@page import="com.studentinfo.model.ResultModel"%>
<%@page import="java.util.ArrayDeque"%>
<%@page import="com.studentinfo.dao.ResultDao"%>
<%@page import="java.util.List"%>
<%@page import="com.studentinfo.model.StudentModel"%>
<%@page import="com.studentinfo.dao.StudentDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin</title>
        <!--Bootstarp-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <!--Font Awesome-->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
            .primary-background-nav{
                background: #7CB342!important;
            }

            .primary-background-nav{
                background: #00897B!important;
            }

            .primary-background-body{
                background-color: #00838F;
            }

            .articleColor{
                background-color:#00838F;
            }

            .btn-color{
                background-color: #00838F;
                border-color: #ffcc80;
                color:#ffcc80;
            }
            .btn-color:hover{
                background: #ffcc80;
                color: black;
            }
            input[type=text] {
                width: 150px;
            }
        </style>
    </head>
    <body>

        <main class="primary-background-nav banner-background" style="height: 50vh;" >
            <!--banner-->
            <div class="container-fluid m-0 p-0 banner-background text-white">
                <div class="jumbotron primary-background-nav p-4">
                    <div class="container ">

                        <h3  class="display-3">Welcome Admin</h3>
                        <p>“Education is the passport to the future, for tomorrow belongs to those who prepare for it today.” —Malcolm X<br>
                        </p>
                        <!--Admission-->
                        <div>
                            <div class="card">
                                <div class="card-title text-secondary">
                                    <h3>Add, Edit or Delete Student</h3>
                                    <%
                                        StudentDao dao = new StudentDao();
                                        List<StudentModel> stuList = dao.fetchAllStudents();
                                    %>
                                    <table class="table">
                                        <thead>
                                            <tr>
                                                <th>Roll No.</th>
                                                <th>Name</th>
                                                <th>Fathers Name</th>
                                                <th>Course</th>
                                                <th>Fee Installments</th>
                                                <th>Address</th>
                                                <th>Phone No.</th>
                                                <th>Gender</th>
                                                <th>Action</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%
                                                for (StudentModel std : stuList) {
                                            %>
                                            <tr>
                                        <form name="info" action="FeeUpdate" method="post">
                                            <td>
                                                <%=std.getRollno()%>
                                            </td>
                                            <td><%=std.getName()%></td>
                                            <td><%=std.getFathersName()%></td>
                                            <td><%=std.getCourse()%></td>
                                            <%--                                      <td>    
                                                                                          <%
                                                                                              if (std.getFee().equals("Paid")) {
                                                                                          %>
                                                                                          <input type="radio" id="paid" name="fee" value="Paid" checked>
                                                                                          <label for="html">Paid</label>
                                                                                          <input type="radio" id="Unpaid" name="fee" value="Unpaid">
                                                                                          <label for="css">Unpaid</label>
                                                                                          <%
                                                                                          } else {
                                                                                          %> 
                                                                                          <input type="radio" id="paid" name="fee" value="Paid" >
                                                                                          <label for="html">Paid</label>
                                                                                          <input type="radio" id="Unpaid" name="fee" value="Unpaid" checked>
                                                                                          <label for="css">Unpaid</label>
                                                                                          <%}%>
                                                                                          <input type="text" name="rollno" value="<%=std.getRollno()%>" hidden>
                                                                                      </td> --%>

                                            <td> 
                                                <%
                                                    if (!std.getInst1().equals("") && std.getInst2().equals("")) {
                                                %>

                                                <input type="number" id="inst1" name="inst1" value="<%=std.getInst1()%>" style="width:50px;" readonly>
                                                <label for="inst1">Inst. 1</label>
                                                <input type="number" id="inst2" name="inst2" style="width:50px;">
                                                <label for="inst2">Inst. 2</label>

                                                <%
                                                } else if (!std.getInst2().equals("") && std.getInst1().equals("")) {
                                                %>
                                                <input type="number" id="inst1" name="inst1" style="width:50px;">
                                                <label for="inst1">Inst. 1</label>
                                                <input type="number" id="inst2" name="inst2" value="<%=std.getInst2()%>" style="width:50px;" readonly>
                                                <label for="inst2">Inst. 2</label>

                                                <%
                                                } else if (!std.getInst1().equals("") && !std.getInst2().equals("")) {
                                                %>
                                                <input type="number" id="inst1" name="inst1" value="<%=std.getInst1()%>" style="width:50px;" readonly>
                                                <label for="inst1">Inst. 1</label>
                                                <input type="number" id="inst2" name="inst2" value="<%=std.getInst2()%>" style="width:50px;" readonly>
                                                <label for="inst2">Inst. 2</label>

                                                <%} else {
                                                %>
                                                <input type="number" id="inst1" name="inst1" style="width:50px;">
                                                <label for="inst1">Inst. 1</label>
                                                <input type="number" id="inst2" name="inst2" style="width:50px;">
                                                <label for="inst2">Inst. 2</label>
                                                <%
                                                    }%> 
                                                <input type="text" name="rollno" value="<%=std.getRollno()%>" hidden>

                                            </td>
                                            <td><%=std.getAddress()%></td>
                                            <td><%= std.getPhoneNo()%></td>
                                            <td><%=std.getGender()%></td>
                                            <td> 
                                                <button type="submit" class="btn btn-primary btn-color mt-3"
                                                        id="submit-btn">Fee Update</button>
                                                <a href="Delete?rollno=<%=std.getRollno()%>" class="btn btn-primary btn-color mt-3"
                                                   id="delete-btn">Delete</a>
                                            </td>
                                        </form>
                                        </tr>
                                        <%}%>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>


                        <!--Result-->
                        <div>

                        </div>

                    </div>
                </div>
            </div>

            <div class="card" style="margin:20px;">
                <table class="table">
                    <thead>
                        <tr>
                            <th>Name</th>
                            <th>Fathers Name</th>
                            <th>Course</th>
                            <!--<th>Fee</th>-->
                            <th>Fee Installments</th>
                            <th>Address</th>
                            <th>Phone No.</th>
                            <th>Password</th>
                            <th>Gender</th>
                            <th>Action</th>

                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                    <form name="register" action="Student" method="post">
                        <td><input type="text" name="name" placeholder="name" required></td>
                        <td><input type="text" name="fathersName"placeholder="fName" required></td>
                        <td><select name="course" id="course" required>
                                <option value="B.C.A">B.C.A</option>
                                <option value="M.Sc IT">M.Sc IT</option>
                                <option value="B.Sc">B.Sc</option>
                                <option value="B.Com">B.Com</option>
                            </select></td>
                        <!--                        <td> <input type="radio" id="paid" name="fee" value="Paid">
                                                    <label for="html">Paid</label>
                                                    <input type="radio" id="Unpaid" name="fee" value="Unpaid">
                                                    <label for="css">Unpaid</label></td>-->
                        <td>
                            <input type="number" id="inst1" name="inst1" value="Paid" style="width:50px;">
                            <label for="inst1">Inst. 1</label>
                            <input type="number" id="inst2" name="inst2" value="Paid" style="width:50px;">
                            <label for="inst2">Inst. 2</label>
                        </td>
                        <td><input type="text" name="address" placeholder="address" required></td>
                        <td><input type="number" name="phno" placeholder="phone no" required></td>
                        <td><input type="password" name="password" placeholder="password" required></td>
                        <td>
                            <input type="radio" name="gender" value="Male" required>
                            Men<br>
                            <input type="radio" name="gender" value="Female">
                            Wom.<br>
                            <input type="radio" name="gender" value="Other">
                            Other<br>
                        </td>
                        <td>
                            <button type="submit" class="btn btn-primary btn-color mt-3"
                                    id="submit-btn">Submit</button>
                        </td>
                    </form>
                    </tr>
                    </tbody>
                </table>
                <caption>Add Student</caption>
            </div>
            <br>
            <br>

            <!--Results-->
            <%
                ResultDao result = new ResultDao();
                ArrayDeque<ResultModel> res = result.fetchAllResults();
            %>
            <div  class="card"style="margin:20px;">
                <table class="table">
                    <thead>
                        <tr class="primary-background-body">
                            <th>Roll no</th>
                            <th>Subject</th>
                            <th>Marks</th>
                            <th>Semester</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            for (ResultModel rm : res) {
                        %>
                        <tr>
                            <td><%=rm.getRollno()%></td>
                            <td><%=rm.getSubject()%></td>
                            <td><%=rm.getMarks()%></td>
                            <td><%=rm.getSemester()%></td>
                        </tr>
                        <%}%>
                    </tbody>
                    </tbody>
                    <caption>Result</caption>
                </table>
            </div>
            <div class="card" style="margin:20px;">
                <table class="table">
                    <thead>
                        <tr>
                            <th>Roll no</th>
                            <th>Subject</th>
                            <th>Marks</th>
                            <th>Semester</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>

                    <form action="Result" >
                        <tr>
                            <td><input type="number" name="rollno" placeholder="rollno" required></td>
                            <td><input type="text" name="subject" placeholder="subject" required></td>
                            <td><input type="text" name="marks" placeholder="marks" required></td>
                            <td><input type="number" name="semester" placeholder="semester" required></td>
                            <td>
                                <button type="submit" class="btn btn-primary btn-color mt-3"
                                        id="submit-btn">Submit</button>
                            </td>

                        </tr>
                    </form>
                    </tbody>
                    </tbody>
                    <caption>Add Result</caption>
                </table>
            </div>
            <div>
                <form action="logout" style="margin: 15px;">
                    <button type="submit" class="btn btn-danger">Logout</button>
                </form>
            </div>
        </main>
    </body>
</html>
