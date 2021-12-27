/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package action;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.util.logging.Logger;
import dao.QuizDAO;
import dao.ResultRecordDAO;
import dao.TotalClassDAO;
import dataobj.ResultRecord;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Map;
import org.apache.struts2.interceptor.SessionAware;

/**
 *
 * @author LucasBV
 */
public class ShowResultAction extends ActionSupport implements SessionAware {

    Map<String, Object> session;
    private int quizSessionID;

    public String execute() throws SQLException {

        QuizDAO quizDao = new QuizDAO();
        String title = quizDao.getTitleQuizSession(quizSessionID);
        session.put("TITLE", title);

        ResultRecordDAO rrDao = new ResultRecordDAO();
        ArrayList<ResultRecord> listRR = rrDao.getListResult(quizSessionID);
        session.put("LIST_RR", listRR);

        int numberQuestion = quizDao.getNumberOfQuestion(quizSessionID);
        ArrayList<Integer> listNumberQuestion = new ArrayList<>();
        for (int i = 1; i <= numberQuestion; i++) {
            listNumberQuestion.add(i);
        }
        session.put("NUM_QUESTION", listNumberQuestion);

        TotalClassDAO tcDao = new TotalClassDAO();
        int numberStudent = tcDao.getNumberStudent(quizSessionID);
        ArrayList<String> listTotal = tcDao.listTotal(numberStudent, quizSessionID);
        session.put("LIST_TOTAL", listTotal);

        return SUCCESS;
    }

    public int getQuizSessionID() {
        return quizSessionID;
    }

    public void setQuizSessionID(int quizSessionID) {
        this.quizSessionID = quizSessionID;
    }

    @Override
    public void setSession(Map<String, Object> map) {
        this.session = map;
    }

}
