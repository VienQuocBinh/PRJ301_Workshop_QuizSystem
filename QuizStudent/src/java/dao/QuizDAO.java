/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import dataobj.Quiz;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import util.DBUtil;

/**
 *
 * @author LucasBV
 */
public class QuizDAO {

    
    // Get Quiz info
    public Quiz getQuiz(int id) throws SQLException {
        Quiz q = null;
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = DBUtil.getConnection();
            if (conn != null) {
                String sql = "SELECT ID ,Title,CreatedDate,OwnedBy "
                        + " FROM Quiz"
                        + " WHERE ID=?";
                ps = conn.prepareStatement(sql);
                ps.setInt(1, id);
                rs = ps.executeQuery();

                while (rs.next()) {
                    String title = rs.getString(2);
                    Date createdDate = rs.getDate(3);
                    int ownedBy = rs.getInt(4);
                    q = new Quiz(id, title, createdDate, ownedBy);
                }
            }
        } catch (Exception e) {
        } finally {
            rs.close();
            ps.close();
            conn.close();
        }
        return q;
    }
}
