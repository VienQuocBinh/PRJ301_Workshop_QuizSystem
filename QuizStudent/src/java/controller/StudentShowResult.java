/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.QuestionQuizDAO;
import dao.StudentQuizAnswerDAO;
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
@WebServlet(name = "StudentShowResult", urlPatterns = {"/StudentShowResult"})
public class StudentShowResult extends HttpServlet {

    private static final String SUCCESS = "result.jsp";
    private static final String ERROR = "error.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        HttpSession session = request.getSession();
        try {

            Student student = (Student) session.getAttribute("STUDENT");
            int studentID = student.getId();

            QuizSession quizSession = (QuizSession) session.getAttribute("QUIZ_SESSION");
            int quizSessionID = quizSession.getId();

            Quiz quiz = (Quiz) session.getAttribute("QUIZ");
            int quizID = quiz.getId();

            StudentQuizAnswerDAO sqaDao = new StudentQuizAnswerDAO();
            int rightAnswer = sqaDao.numberRightAnswer(studentID, quizSessionID, quizID);
            session.setAttribute("N_RIGHT_ANSWER", rightAnswer);

            QuestionQuizDAO qqDao = new QuestionQuizDAO();
            int numberQuestion = qqDao.getNumberQuestion(quizID);
            session.setAttribute("N_TOTAL_QUESTION", numberQuestion);

            double score = (double) rightAnswer * 10 / numberQuestion;
            session.setAttribute("SCORE", score);

            url = SUCCESS;
        } catch (Exception e) {
            session.setAttribute("ERROR_MESSAGE", e.toString());
            log("Error at StudentShowResult " + e.toString());
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