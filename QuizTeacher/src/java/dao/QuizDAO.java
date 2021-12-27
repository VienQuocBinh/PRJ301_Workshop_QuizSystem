/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import util.DBUtil;

/**
 *
 * @author LucasBV
 */
public class QuizDAO {

    public String getTitleQuizSession(int id) throws SQLException {

        String title = null;
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = DBUtil.getConnection();
            if (conn != null) {
                String sql = "SELECT Title from Quiz "
                        + " WHERE ID=?";
                ps = conn.prepareStatement(sql);
                ps.setInt(1, id);
                rs = ps.executeQuery();
                if (rs.next()) {
                    title = rs.getString(1);
                }
            }
        } catch (Exception e) {
        } finally {
            rs.close();
            ps.close();
            conn.close();
        }
        return title;
    }

    public int getNumberOfQuestion(int quizID) throws SQLException {
        int num = -1;
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = DBUtil.getConnection();
            if (conn != null) {
                String sql = "SELECT COUNT(ID) FROM QuestionQuiz\n"
                        + "WHERE QuizID = ?";
                ps = conn.prepareStatement(sql);
                ps.setInt(1, quizID);
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
}
