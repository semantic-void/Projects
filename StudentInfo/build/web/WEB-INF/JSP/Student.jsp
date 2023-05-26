<%-- 
    Document   : Student
    Created on : Nov 22, 2022, 10:59:31 PM
    Author     : Sachin Sharma
--%>

<%@page import="com.studentinfo.model.ResultModel"%>
<%@page import="com.studentinfo.dao.ResultDao"%>
<%@page import="java.util.*"%>
<%@page import="com.studentinfo.model.StudentModel"%>
<%@page import="com.studentinfo.dao.StudentDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Student</title>
        <!--Bootstrap-->
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
        </style>
    </head>
    <body>

        <main class="primary-background-nav banner-background" style="height: 50vh;" >
            <!--banner-->
            <div class="container-fluid m-0 p-0 banner-background text-white">
                <div class="jumbotron primary-background-nav p-4">
                    <div class="container ">

                        <h3  class="display-3">Welcome Student</h3>
                        <p>“Education is the passport to the future, for tomorrow belongs to those who prepare for it today.” —Malcolm X<br>
                        </p>

                        <div>
                            <div class="card">
                                <div class="card-title text-secondary">
                                    <h3>Welcome </h3>
                                    <%
                                        StudentModel stm1 = (StudentModel) session.getAttribute("LoginAs");
                                        StudentDao dao = new StudentDao();
                                        List<StudentModel> stuList = dao.fetchStudent(stm1.getRollno());
                                    %>
                                    <table class="table">
                                        <thead>
                                            <tr>
                                                <th>Roll No.</th>
                                                <th>Name</th>
                                                <th>Fathers Name</th>
                                                <th>Course</th>
                                                <th>Gender</th>
                                                <th>Address</th>
                                                <th>Phone No.</th>
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
                                            <td><%=std.getGender()%></td>
                                            <td><%=std.getAddress()%></td>
                                            <td><%=std.getPhoneNo()%></td>
                                        </form>
                                        </tr>
                                        <%}%>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>

            <!--Results-->
            <%
                ResultDao result = new ResultDao();
                ArrayDeque<ResultModel> res = result.fetchStudentResults(stm1.getRollno());
            %>
            <div  class="card"style="margin:20px;">
                <table class="table">
                    <thead>
                        <tr>
                            <th>Roll no</th>
                            <th>Subject</th>
                            <th>Marks</th>
                            <th>Semester</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            int sem = 0, total = 0, subs = 0;

                            for (ResultModel rm : res) {
                                if (sem == 0) {
                                    sem = Integer.parseInt(rm.getSemester().trim());
                                }
                                if (sem < Integer.parseInt(rm.getSemester().trim())) {
                                    sem = Integer.parseInt(rm.getSemester().trim());
                                    subs = subs * 100;
                        %>
                        <tr>
                            <td>---</td>
                            <td>---</td>
                            <td>---</td>
                            <td><b>Total</b> <%=total%></td>
                        </tr>
                        <% float percentage = total * 100 / subs; %>
                        <tr>
                            <td>---</td>
                            <td>---</td>
                            <td>---</td>
                            <td><b>Percentage</b> <%=percentage%></td>
                        </tr>
                        <%
                                subs = 0;
                                total = 0;
                            }
                            subs++;
                            total = total + Integer.parseInt(rm.getMarks().trim());
                        %>
                        <tr>
                            <td><%=rm.getRollno()%></td>
                            <td><%=rm.getSubject()%></td>
                            <td><%=rm.getMarks()%></td>
                            <td><%=rm.getSemester()%></td>
                        </tr>
                        <%}%>
                        <tr>
                            <td>---</td>
                            <td>---</td>
                            <td>---</td>
                            <td><b>Total</b> <%=total%></td>
                        </tr>
                        <%
                            subs = subs * 100;
                            float percentage = total * 100 / subs;
                        %>
                        <tr>
                            <td>---</td>
                            <td>---</td>
                            <td>---</td>
                            <td><b>Percentage</b> <%=percentage%></td>
                        </tr>
                    </tbody>
                    </tbody>
                    <caption>Result</caption>
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
