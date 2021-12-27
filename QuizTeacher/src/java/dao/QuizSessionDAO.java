/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import dataobj.QuizSession;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import util.DBUtil;

/**
 *
 * @author LucasBV
 */
public class QuizSessionDAO {

    public ArrayList<QuizSession> getQuizSession(int teacherID) throws SQLException {
        ArrayList<QuizSession> listQuizSession = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = DBUtil.getConnection();
            if (conn != null) {
                String sql = "SELECT qs.ID, qs.Code, qs.QuizID, qs.StartedBy, qs.StartedDate, qs.EndDate, qs.IsInProgress, q.Title\n"
                        + "FROM QuizSession qs\n"
                        + "JOIN Quiz q ON q.ID = qs.QuizID\n"
                        + "WHERE qs.StartedBy = ?";
                ps = conn.prepareStatement(sql);
                ps.setInt(1, teacherID);
                rs = ps.executeQuery();
                while (rs.next()) {
                    int qsID = rs.getInt("ID");
                    String qsCode = rs.getString("Code");
                    int quizID = rs.getInt("QuizID");
                    int startedBy = rs.getInt("StartedBy");
                    Date startedDate = rs.getDate("StartedDate");
                    Date endDate = rs.getDate("EndDate");
                    boolean isInProgress = rs.getBoolean("IsInProgress");
                    String title = rs.getString("Title");
                    listQuizSession.add(new QuizSession(qsID, qsCode, quizID, startedBy, startedDate, endDate, isInProgress, title));
                }
            }
        } catch (Exception e) {
        } finally {
            rs.close();
            ps.close();
            conn.close();
        }
        return listQuizSession;
    }

}
