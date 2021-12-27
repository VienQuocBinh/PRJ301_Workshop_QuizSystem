/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.AnswerDAO;
import dao.QuestionDAO;
import dao.StudentQuizAnswerDAO;
import dataobj.Answer;
import dataobj.Question;
import dataobj.Quiz;
import dataobj.QuizSession;
import dataobj.Student;
import java.io.IOException;
import java.util.ArrayList;
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
@WebServlet(name = "ProgressQuizController", urlPatterns = {"/ProgressQuizController"})
public class ProgressQuizController extends HttpServlet {

    private static final String SUCCESS = "quiz.jsp";
    private static final String ERROR = "error.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            HttpSession session = request.getSession();
            Quiz quiz = (Quiz) session.getAttribute("QUIZ");
            Student student = (Student) session.getAttribute("STUDENT");
            QuizSession quizSession = (QuizSession) session.getAttribute("QUIZ_SESSION");

            QuestionDAO quesionDao = new QuestionDAO();
            ArrayList<Question> listQuestion = quesionDao.getListQuestion(quiz.getId());
            session.setAttribute("LIST_QUESTION", listQuestion);

            StudentQuizAnswerDAO sqadao = new StudentQuizAnswerDAO();
            ArrayList<Integer> listDone = sqadao.getListQuestionID(student.getId(), quizSession.getQuizID(), quiz.getId());
            session.setAttribute("LIST_QUESTION_DONE", listDone);

            AnswerDAO answerDao = new AnswerDAO();
            ArrayList<Answer> listAnswer = answerDao.getStudentAnswerList(student.getId(), quizSession.getId(), quiz.getId());
            session.setAttribute("LIST_ANSWER", listAnswer);

            url = SUCCESS;

        } catch (Exception e) {
            log("Error at ProgressQuizController " + e.toString());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
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
