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
public class StudentQuizSessionDAO {

    // When student begin doing quiz
    public boolean insertStudentQuizSession(int quizSessionID, int studentID) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ps = null;

        try {
            conn = DBUtil.getConnection();
            if (conn != null) {
                String sql = "INSERT INTO StudentQuizSession(QuizSessionID, StudentID)\n"
                        + "VALUES (?,?)";
                ps = conn.prepareStatement(sql);
                ps.setInt(1, quizSessionID);
                ps.setInt(2, studentID);
                check = ps.executeUpdate() > 0;
            }
        } catch (Exception e) {
        } finally {
            ps.close();
            conn.close();
        }
        return check;
    }

    
}
