package com.studentinfo.controller;

import com.studentinfo.dao.StudentDao;
import com.studentinfo.model.StudentModel;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Sachin Sharma
 */
@WebServlet(name = "Student", urlPatterns = {"/Student"})
public class Student extends HttpServlet {

    protected void processGetRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            StudentDao stdDao = new StudentDao();

            StudentModel stm = stdDao.login(request.getParameter("username"), request.getParameter("password"));

            if (stm.getRollno() == null) {
                out.println("Login faild");
                return;
            }
            if (Integer.parseInt(stm.getRollno()) > 0) {
                request.getSession().setAttribute("LoginAs", stm);
                RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/JSP/Student.jsp");
                dispatcher.forward(request, response);
            } else {
                out.println("Login faild");
            }
        }
    }

    protected void processPostRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            StudentDao std = new StudentDao();
            boolean flag = std.register(request.getParameter("name"), request.getParameter("fathersName"),
                    request.getParameter("phno"), request.getParameter("address"),
                    request.getParameter("course"),
                    request.getParameter("inst1"),request.getParameter("inst2"),
                    request.getParameter("password"),request.getParameter("gender"));
            if (flag) {
                RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/JSP/Admin.jsp");
                dispatcher.forward(request, response);
            } else {
                out.print("Faild");
            }
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processGetRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processPostRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
