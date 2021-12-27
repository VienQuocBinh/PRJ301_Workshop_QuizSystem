/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import dataobj.ResultRecord;
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
public class ResultRecordDAO {

    public ArrayList<ResultRecord> getListResult(int quizSessionID) throws SQLException {
        ArrayList<ResultRecord> listResult = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = DBUtil.getConnection();
            if (conn != null) {
                String sql = "SELECT sqs.ID, sqs.QuizSessionID, sqs.StudentID, s.Name\n"
                        + "FROM StudentQuizSession sqs\n"
                        + "JOIN Student s ON s.ID = sqs.StudentID";
                ps = conn.prepareStatement(sql);
                rs = ps.executeQuery();
                while (rs.next()) {
                    int id = rs.getInt(1);
                    int questionID = rs.getInt(2);
                    int studentID = rs.getInt(3);
                    String name = rs.getString(4);
                    ArrayList<Boolean> listAns = listAnswer(studentID);
                    double process = process(studentID);
                    ResultRecord rr = new ResultRecord(id, questionID, studentID, name, process, listAns);
                    listResult.add(rr);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            rs.close();
            ps.close();
            conn.close();
        }
        return listResult;
    }

    public ArrayList<Boolean> listAnswer(int studentID) throws SQLException {
        ArrayList<Boolean> listAnswer = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = DBUtil.getConnection();
            if (conn != null) {
                String sql = "SELECT \n"
                        + "CASE WHEN qq.QuestionID = sqa.QuestionID\n"
                        + "THEN 1 ELSE 0\n"
                        + "END AS 'done'\n"
                        + "FROM QuestionQuiz qq\n"
                        + "LEFT OUTER JOIN StudentQuizAnswer sqa\n"
                        + "ON qq.QuestionID = sqa.QuestionID\n"
                        + "AND qq.QuizID = sqa.QuizID\n"
                        + "AND StudentID = ?";
                ps = conn.prepareStatement(sql);
                ps.setInt(1, studentID);
                rs = ps.executeQuery();
                while (rs.next()) {
                    listAnswer.add(rs.getBoolean(1));
                }
            }
        } catch (Exception e) {
        } finally {
            rs.close();
            ps.close();
            conn.close();
        }
        return listAnswer;
    }

    public double process(int studentID) throws SQLException {
        double percent = 0;
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = DBUtil.getConnection();
            if (conn != null) {
                String sql = "SELECT COUNT(qq.ID) AS 'ALL', COUNT(sqa.QuestionID) AS 'DONE' "
                        + "FROM QuestionQuiz qq \n"
                        + "LEFT OUTER JOIN StudentQuizAnswer sqa\n"
                        + "ON sqa.QuestionID = qq.QuestionID\n"
                        + "AND sqa.QuizID = qq.QuizID\n"
                        + "AND sqa.StudentID = ?";
                ps = conn.prepareStatement(sql);
                ps.setInt(1, studentID);
                rs = ps.executeQuery();
                while (rs.next()) {
                    int all = rs.getInt(1);
                    int done = rs.getInt(2);
                    percent = (double) done / all;
                    NumberFormat formatter = new DecimalFormat("#0.0000");
                    percent = Double.parseDouble(formatter.format(percent * 100));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            rs.close();
            ps.close();
            conn.close();
        }

        return percent;
    }
}
