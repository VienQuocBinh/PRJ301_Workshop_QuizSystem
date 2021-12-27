/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.util.ArrayList;
import util.DBUtil;

/**
 *
 * @author LucasBV
 */
public class TotalClassDAO {

    // get number of student of each session    
    public int getNumberStudent(int quizSession) throws SQLException {
        int num = -1;
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = DBUtil.getConnection();
            if (conn != null) {
                String sql = "SELECT COUNT(QuizSessionID) \n"
                        + "FROM StudentQuizSession\n"
                        + "WHERE QuizSessionID = ?\n"
                        + "GROUP BY QuizSessionID";
                ps = conn.prepareStatement(sql);
                ps.setInt(1, quizSession);
                rs = ps.executeQuery();
                if (rs.next()) {
                    num = rs.getInt(1);
                }
            }
        } catch (Exception e) {
        } finally {
            rs.close();
            ps.close();
            conn.close();
        }
        return num;
    }

    // Get total number Student do each Question
    public ArrayList<String> listTotal(int numberStudent, int quizSession) throws SQLException {
        ArrayList<String> listTotal = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = DBUtil.getConnection();
            if (conn != null) {
                String sql = "SELECT COUNT(sqs.StudentID) FROM StudentQuizSession sqs\n"
                        + "JOIN Student s ON s.ID = sqs.StudentID\n"
                        + "JOIN StudentQuizAnswer sqa ON sqa.StudentID = s.ID\n"
                        + "AND sqs.QuizSessionID = sqa.QuizSessionID\n"
                        + "AND sqs.QuizSessionID = ?\n"
                        + "GROUP BY sqa.QuestionID";

                String sql1 = "SELECT COUNT(SQA.StudentID) from Question Q\n"
                        + "LEFT JOIN StudentQuizAnswer SQA ON Q.ID = SQA.QuestionID \n"
                        + "LEFT JOIN QuizSession QS ON QS.ID = SQA.QuizSessionID\n"
                        + "AND SQA.QuizSessionID = ?\n"
                        + "GROUP BY Q.ID, Q.Content";
                ps = conn.prepareStatement(sql1);
                ps.setInt(1, quizSession);
                rs = ps.executeQuery();
                while (rs.next()) {
                    double currentQues = rs.getDouble(1);
                    NumberFormat formatter = new DecimalFormat("#0.00");
                    String processQues = formatter.format((currentQues / numberStudent) * 100);
                    listTotal.add(processQues);
                }
            }
        } catch (Exception e) {
        } finally {
            rs.close();
            ps.close();
            conn.close();
        }
        return listTotal;
    }
}
