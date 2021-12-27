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
public class StudentQuizAnswerDAO {

    // The first time the question is checked
    public void addStudentQuizAnswer(int studentID, int sessionID, int quizID, String questionID, String answerID) throws SQLException {
        Connection conn = null;
        PreparedStatement ps = null;
        try {
            conn = DBUtil.getConnection();
            if (conn != null) {
                String sql = "INSERT INTO StudentQuizAnswer(StudentID, QuizSessionID, QuizID, QuestionID, AnswerID, CreatedTime)\n"
                        + "VALUES (?,?,?,?,?, GETDATE())";
                ps = conn.prepareStatement(sql);
                ps.setInt(1, studentID);
                ps.setInt(2, sessionID);
                ps.setInt(3, quizID);
                ps.setString(4, questionID);
                ps.setString(5, answerID);
                ps.executeUpdate();
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            ps.close();
            conn.close();
        }
    }

    // To create the table and check right answer of that question
    public ArrayList<Integer> getListQuestionID(int studentID, int quizSessionID, int quizID) throws SQLException {
        ArrayList<Integer> listQuestion = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = DBUtil.getConnection();
            if (conn != null) {
                String sql = "SELECT QuestionID FROM StudentQuizAnswer\n"
                        + "WHERE StudentID =? AND QuizSessionID =? AND QuizID=?";
                ps = conn.prepareStatement(sql);
                ps.setInt(1, studentID);
                ps.setInt(2, quizSessionID);
                ps.setInt(3, quizID);
                rs = ps.executeQuery();
                while (rs.next()) {
                    int id = rs.getInt(1);
                    listQuestion.add(id);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            rs.close();
            ps.close();
            conn.close();
        }
        return listQuestion;
    }

    // To check that question has already been checked and had in DB
    public boolean isQuestionDone(int studentId, int quizSessionID, int quizID, int questionID) throws SQLException {

        boolean check = false;
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            conn = DBUtil.getConnection();
            if (conn != null) {
                String sql = "SELECT ID FROM StudentQuizAnswer\n"
                        + "WHERE StudentID = ?\n"
                        + "AND QuizSessionID = ?\n"
                        + "AND QuizID = ?\n"
                        + "AND QuestionID = ?";
                ps = conn.prepareStatement(sql);
                ps.setInt(1, studentId);
                ps.setInt(2, quizSessionID);
                ps.setInt(3, quizID);
                ps.setInt(4, questionID);
                rs = ps.executeQuery();
                if (rs.next()) {
                    check = true;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            rs.close();
            ps.close();
            conn.close();
        }
        return check;
    }

    // In case the question is check more than 1 time then just update the DB
    public void updateStudentAnswer(int studentId, int quizSessionID, int quizID, int questionID, int answerID) throws SQLException {
        Connection conn = null;
        PreparedStatement ps = null;

        try {
            conn = DBUtil.getConnection();
            if (conn != null) {
                String sql = "UPDATE StudentQuizAnswer\n"
                        + "SET AnswerID = ?,\n"
                        + "UpdatedTime = GETDATE()\n"
                        + "WHERE StudentID = ?\n"
                        + "AND QuizSessionID = ?\n"
                        + "AND QuizID = ?\n"
                        + "AND QuestionID = ?";
                ps = conn.prepareStatement(sql);
                ps.setInt(1, answerID);
                ps.setInt(2, studentId);
                ps.setInt(3, quizSessionID);
                ps.setInt(4, quizID);
                ps.setInt(5, questionID);
                ps.executeUpdate();

            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            ps.close();
            conn.close();
        }
    }

    // To calc score: get student answer
    public ArrayList<Answer> getStudentAnswer(int studentID, int quizSessionID, int quizID, int questionID) throws SQLException {
        ArrayList<Answer> listAns = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = DBUtil.getConnection();
            if (conn != null) {
                String sql = "SELECT A.ID, A.QuestionID, A.IsCorrectAnswer, A.Content FROM StudentQuizAnswer SQA\n"
                        + "JOIN Answer A ON SQA.AnswerID = A.ID\n"
                        + "WHERE SQA.StudentID = ?\n"
                        + "AND SQA.QuizSessionID = ?\n"
                        + "AND SQA.QuizID = ?\n"
                        + "AND SQA.QuestionID = ?";

                ps = conn.prepareStatement(sql);
                ps.setInt(1, studentID);
                ps.setInt(2, quizSessionID);
                ps.setInt(3, quizID);
                ps.setInt(4, questionID);
                rs = ps.executeQuery();
                if (rs.next()) {
                    boolean isCorrectAnswer = false;
                    int isCorrectAnswer_a = rs.getInt("IsCorrectAnswer");
                    if (isCorrectAnswer_a == 1) {
                        isCorrectAnswer = true;
                    }
                    listAns.add(new Answer(rs.getInt("ID"), rs.getInt("QuestionID"), rs.getString("Content"), isCorrectAnswer));

                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            rs.close();
            ps.close();
            conn.close();
        }
        return listAns;
    }

    // To calc score: count the number of right answer
    public int numberRightAnswer(int studentID, int quizSessionID, int quizID) throws SQLException {
        int number = 0;
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = DBUtil.getConnection();
            if (conn != null) {
                String sql = "SELECT SQA.StudentID, COUNT(SQA.QuestionID) \n"
                        + "FROM StudentQuizAnswer SQA\n"
                        + "JOIN Question Q ON Q.ID = SQA.QuestionID\n"
                        + "JOIN Answer A ON SQA.AnswerID = A.ID\n"
                        + "WHERE A.IsCorrectAnswer = 1\n"
                        + "AND SQA.StudentID = ?\n"
                        + "AND SQA.QuizSessionID = ?\n"
                        + "AND SQA.QuizID = ?\n"
                        + "GROUP BY SQA.StudentID";

                ps = conn.prepareStatement(sql);
                ps.setInt(1, studentID);
                ps.setInt(2, quizSessionID);
                ps.setInt(3, quizID);
                rs = ps.executeQuery();
                if (rs.next()) {
                    number = rs.getInt(2);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            rs.close();
            ps.close();
            conn.close();
        }
        return number;
    }
}
