/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import util.DBUtil;

/**
 *
 * @author LucasBV
 */
public class StudentDAO {

    
    //When student login add student to Student DB
    public int insertStudentAndGetID(String name) throws SQLException, ClassNotFoundException {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        int id = -1;
        try {
            conn = DBUtil.getConnection();
            String sql = "INSERT INTO Student (Name) \n"
                    + "VALUES (" + name + ");"
                    + "SELECT TOP 1 * FROM Student\n"
                    + "ORDER BY ID DESC";
            ps = conn.prepareStatement("INSERT INTO Student (Name) \n"
                    + "VALUES (?)", Statement.RETURN_GENERATED_KEYS);
            ps.setString(1, name);
            int rowAffected = ps.executeUpdate();
            if (rowAffected == 1) {
                rs = ps.getGeneratedKeys();
                if (rs.next()) {
                    id = rs.getInt(1);
                }
            }
        } catch (Exception e) {
        } finally {
            rs.close();
            ps.close();
            conn.close();
        }
        return id;
    }

}
