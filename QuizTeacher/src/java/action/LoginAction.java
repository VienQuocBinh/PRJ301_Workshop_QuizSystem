/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package action;

import com.opensymphony.xwork2.ActionSupport;
import dao.QuizSessionDAO;
import dao.TeacherDAO;
import dataobj.QuizSession;
import dataobj.Teacher;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Map;
import org.apache.struts2.interceptor.SessionAware;

/**
 *
 * @author LucasBV
 */
public class LoginAction extends ActionSupport implements SessionAware {

    Map<String, Object> session;

    private String teacherName;

    public String execute() throws SQLException {
        String result = ERROR;
        TeacherDAO tDao = new TeacherDAO();
        int id = tDao.getIdTeacher(teacherName);
        if (id != -1) {
            Teacher teacher = new Teacher(id, teacherName);
            session.put("TEACHER", teacher);

            QuizSessionDAO qsDao = new QuizSessionDAO();
            ArrayList<QuizSession> listQuizSession = qsDao.getQuizSession(id);
            session.put("LIST_QUIZ_SESSION", listQuizSession);
            result = SUCCESS;

        }
        return result;


    }

    public String getTeacherName() {
        return teacherName;
    }

    public void setTeacherName(String teacherName) {
        this.teacherName = teacherName;
    }

    @Override
    public void setSession(Map<String, Object> session) {
        this.session = session;
    }

}
