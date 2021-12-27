/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

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
@WebServlet(name = "StudentMainController", urlPatterns = {"/StudentMainController"})
public class StudentMainController extends HttpServlet {

    private static final String ERROR = "error.jsp";
    private static final String STUDENT_LOGIN_ROOM_CONTROLLER = "StudentLoginRoomController";
    private static final String STUDENT_LOGIN_NAME_CONTROLLER = "StudentLoginNameController";
    private static final String STUDENT_SUBMIT_CONTROLLER = "StudentSubmitController";
    private static final String STUDENT_SHOW_RESULT_CONTROLLER = "StudentShowResult";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String action = request.getParameter("action");
            HttpSession session = request.getSession();
            // Use switch-case instead of if-else
            switch (action) {
                case "StudentLoginRoom":
                    url = STUDENT_LOGIN_ROOM_CONTROLLER;
                    break;
                case "StudentLoginName":
                    url = STUDENT_LOGIN_NAME_CONTROLLER;
                    break;
                case "StudentSubmit":
                    url = STUDENT_SUBMIT_CONTROLLER;
                    break;
                case "ShowResult":
                    url = STUDENT_SHOW_RESULT_CONTROLLER;
                    break;
                default:
                    session.setAttribute("ERROR_MESSAGE", "Function is not available");
                    break;
            }
        } catch (Exception e) {
            log("Error at StudentLoginRoomController: " + e.toString());
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
