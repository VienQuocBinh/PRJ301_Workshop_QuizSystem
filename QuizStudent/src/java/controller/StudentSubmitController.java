/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

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
@WebServlet(name = "StudentSubmitController", urlPatterns = {"/StudentSubmitController"})
public class StudentSubmitController extends HttpServlet {

    private static final String SUCCESS = "ProgressQuizController";
    private static final String ERROR = "error.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            HttpSession session = request.getSession();

            Student student = (Student) session.getAttribute("STUDENT");
            int studentID = student.getId();

            Quiz quiz = (Quiz) session.getAttribute("QUIZ");
            int quizID = quiz.getId();

            QuizSession quizSession = (QuizSession) session.getAttribute("QUIZ_SESSION");
            int sessionID = quizSession.getId();


            String ques = request.getParameter("question");
            if(ques!=null){
                String[] quesAns = ques.trim().split("-");
            String quesID = quesAns[0];
            String ansID = quesAns[1];

            int questionID = Integer.parseInt(quesID);
            int answerID = Integer.parseInt(ansID);
            StudentQuizAnswerDAO sqaDao = new StudentQuizAnswerDAO();

            // check exist then update/add new
            if (sqaDao.isQuestionDone(studentID, sessionID, quizID, questionID)) {
                sqaDao.updateStudentAnswer(studentID, sessionID, quizID, questionID, answerID);
            } else {
                sqaDao.addStudentQuizAnswer(studentID, sessionID, quizID, quesID, ansID);
            }

            url = SUCCESS;
            }
            session.setAttribute("ERROR_MESSAGE", "Please select an answer");
        } catch (Exception e) {
            log("Error at StudentSubmitController " + e.toString());
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
