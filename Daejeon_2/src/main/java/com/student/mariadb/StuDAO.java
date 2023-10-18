package com.student.mariadb;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.dbcp.DbcpBean2;

public class StuDAO {
    public static Connection getConnection() {
        Connection con = null;
        con = new DbcpBean2().getConn();
        return con;
    }

    public static ArrayList<StuDTO> getRecords(int start, int total) {
        ArrayList<StuDTO> list = new ArrayList<StuDTO>();
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            con = getConnection();
            ps = con.prepareStatement("select name, kor, mat, eng from student");
            rs = ps.executeQuery();
            while (rs.next()) {
                StuDTO e = new StuDTO();
                e.setName(rs.getString("name"));
                e.setKor(rs.getInt("kor"));
                e.setEng(rs.getInt("eng"));
                e.setMat(rs.getInt("mat"));
                list.add(e);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // 연결, PreparedStatement, ResultSet 닫기
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
            }
            if (ps != null) {
                try {
                    ps.close();
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
            }
            if (con != null) {
                try {
                    con.close();
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
            }
        }
        return list;
    }

    public boolean registerStu(StuDTO sto) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        String query = "insert into student(name, kor, mat, eng) values (?, ?, ?, ?)";
        boolean success = false;

        try {
            conn = getConnection();
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, sto.getName());
            pstmt.setInt(2, sto.getKor());
            pstmt.setInt(3, sto.getMat());
            pstmt.setInt(4, sto.getEng());
            pstmt.executeUpdate();
            success = true;
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            // 연결과 PreparedStatement 닫기
            if (pstmt != null) {
                try {
                    pstmt.close();
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
            }
        }
        return success;
    }

    public boolean updateStu(StuDTO dto) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        boolean success = false;

        try {
            conn = getConnection();
            String query = "update student set kor=?, eng=?, mat=? where name=?";
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, dto.getKor());
            pstmt.setInt(2, dto.getEng());
            pstmt.setInt(3, dto.getMat());
            pstmt.setString(4, dto.getName());
            pstmt.executeUpdate();
            success = true;
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            // PreparedStatement 및 Connection 닫기
            if (pstmt != null) {
                try {
                    pstmt.close();
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
            }
        }
        return success;
    }

    public boolean deleteStu(StuDTO dto) {
        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            conn = getConnection();
            String query = "DELETE FROM student WHERE name=?";
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, dto.getName());
            pstmt.executeUpdate();
            return true;
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            // PreparedStatement 및 Connection 닫기
            if (pstmt != null) {
                try {
                    pstmt.close();
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
            }
        }
        return false;
    }
}
