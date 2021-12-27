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
import util.DBUtil;

/**
 *
 * @author LucasBV
 */
public class QuizSessionDAO {

    
    // Get quizSession info
    public QuizSession getQuizSession(String Code) throws SQLException {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        QuizSession qs = null;
        try {
            conn = DBUtil.getConnection();
            if (conn != null) {
                String sql = "SELECT * FROM QuizSession\n"
                        + "WHERE Code = ?";
                ps = conn.prepareStatement(sql);
                ps.setString(1, Code);
                rs = ps.executeQuery();
                if (rs.next()) {
                    int id = rs.getInt("ID");
                    String code = rs.getString("Code");
                    int quizID = rs.getInt("QuizID");
                    int startedBy = rs.getInt("StartedBy");
                    Date startedDate = rs.getDate("StartedDate");
                    Date endDate = rs.getDate("EndDate");
                    boolean isInProgress = rs.getBoolean("IsInProgress");
                    qs = new QuizSession(id, code, quizID, startedBy, startedDate, endDate, isInProgress);
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
        return qs;
    }

}
