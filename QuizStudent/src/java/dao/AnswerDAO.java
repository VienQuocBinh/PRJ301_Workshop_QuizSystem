/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import dataobj.Answer;
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
public class AnswerDAO {

    // Get all Ans of the Question (A, B, C, D)
    public ArrayList<Answer> getListAnswer(int questionID) throws SQLException {
        ArrayList<Answer> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = DBUtil.getConnection();
            if (conn != null) {
                String sql = "SELECT ID, QuestionID, IsCorrectAnswer, Content FROM Answer\n"
                        + "WHERE QuestionID = ?";
                ps = conn.prepareStatement(sql);
                ps.setInt(1, questionID);
                rs = ps.executeQuery();
                while (rs.next()) {
                    int id = rs.getInt(1);
                    int quesID = rs.getInt(2);
                    boolean isCorrectAns = rs.getBoolean(3);
                    String content = rs.getString(4);
                    list.add(new Answer(id, quesID, content, isCorrectAns));
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
        return list;
    }

    // When student submit then answer is add to this list
    public ArrayList<Answer> getStudentAnswerList(int studentID, int quizSessionId, int quizID) throws SQLException {
        ArrayList<Answer> listStudentAns = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = DBUtil.getConnection();
            if (conn != null) {
                String sql = "SELECT A.ID, A.QuestionID, A.IsCorrectAnswer, A.Content "
                        + " FROM StudentQuizAnswer SQA\n"
                        + "JOIN Answer A ON SQA.AnswerID = A.ID\n"
                        + "WHERE StudentID = ? AND QuizSessionID =? AND QuizID=?";
                ps = conn.prepareStatement(sql);
                ps.setInt(1, studentID);
                ps.setInt(2, quizSessionId);
                ps.setInt(3, quizID);
                rs = ps.executeQuery();
                while (rs.next()) {
                    int id = rs.getInt(1);
                    int quesID = rs.getInt(2);
                    boolean isCorrectAns = rs.getBoolean(3);
                    String content = rs.getString(4);
                    listStudentAns.add(new Answer(id, quesID, content, isCorrectAns));
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
        return listStudentAns;
    }
}
