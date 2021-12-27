/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import dataobj.Answer;
import dataobj.Question;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import util.DBUtil;

/**
 *
 * @author LucasBV
 */
public class QuestionDAO {

    // Get all Questions have in the Quiz
    public ArrayList<Question> getListQuestion(int quizID) throws SQLException {
        ArrayList<Question> listQuestion = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = DBUtil.getConnection();
            if (conn != null) {
                String sql = "SELECT Q.ID, Q.Content FROM QuestionQuiz QQ\n"
                        + "JOIN Question Q ON QQ.QuestionID = Q.ID "
                        + "WHERE QQ.QuizID = ?";
                ps = conn.prepareStatement(sql);
                ps.setInt(1, quizID);
                rs = ps.executeQuery();
                while (rs.next()) {
                    int questionID = rs.getInt(1);
                    String content = rs.getString(2);
                    AnswerDAO dao = new AnswerDAO();
                    ArrayList<Answer> listAns = dao.getListAnswer(questionID);

                    Question question = new Question(questionID, content, listAns);
                    listQuestion.add(question);
                }
            }
        } catch (Exception e) {
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return listQuestion;
    }

    public ArrayList<Question> getListQuestionNotDone(int quizID, ArrayList<Integer> questionDone) throws SQLException {
        ArrayList<Question> listQuestion = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = DBUtil.getConnection();
            if (conn != null) {
                String sql = "SELECT q.ID, q.Content from Question q\n"
                        + "JOIN QuestionQuiz qq ON q.ID = qq.QuestionID\n"
                        + "WHERE qq.QuizID = ?";
                ps = conn.prepareStatement(sql);
                rs = ps.executeQuery();
                while (rs.next()) {
                    int questionID = rs.getInt(1);
                    String content = rs.getString(2);
                    boolean check = true;
                    // Get all Done Question
                    for (Integer integer : questionDone) {
                        // if done then continue

                        if (questionID == integer) {
                            check = false;
                            break;
                        }
                    }
                    if (check == false) {
                        continue;
                    }
                    // else add to list Question Not Done
                    AnswerDAO dao = new AnswerDAO();
                    ArrayList<Answer> listAnswer = dao.getListAnswer(questionID);

                    Question question = new Question(questionID, content, listAnswer);
                    listQuestion.add(question);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return listQuestion;
    }
    
  
}
