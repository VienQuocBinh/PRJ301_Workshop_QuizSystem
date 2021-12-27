/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.QuizDAO;
import dao.StudentDAO;
import dao.StudentQuizSessionDAO;
import dataobj.Quiz;
import dataobj.QuizSession;
import dataobj.Student;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author LucasBV
 */
@WebServlet(name = "StudentLoginNameController", urlPatterns = {"/StudentLoginNameController"})
public class StudentLoginNameController extends HttpServlet {

    private static final String ERROR = "loginName.jsp";
    private static final String SUCCESS = "ProgressQuizController";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String url = ERROR;
        try {
            HttpSession session = request.getSession();
            String studentName = request.getParameter("studentName");
            StudentDAO sdao = new StudentDAO();
            int studentID = sdao.insertStudentAndGetID(studentName);
            Student student = new Student(studentID, studentName);
            session.setAttribute("STUDENT", student);

            QuizSession qs = (QuizSession) session.getAttribute("QUIZ_SESSION");
            int quizID = qs.getId();

            QuizDAO quizDao = new QuizDAO();
            Quiz q = quizDao.getQuiz(quizID);
            session.setAttribute("QUIZ", q);

            StudentQuizSessionDAO sqsdao = new StudentQuizSessionDAO();
            sqsdao.insertStudentQuizSession(quizID, studentID);
            url = SUCCESS;
        } catch (Exception e) {
            log("Error at StudentLoginNameController: " + e.toString());
        } finally {
            response.sendRedirect(url);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
