package com.emp.mariadb;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;

import com.dbcp.DbcpBean;

public class EmpDAO2 {
	public static Connection getConnection() {
		Connection con = null;
		con = new DbcpBean().getConn();
		return con;
	}

	public static ArrayList<EmpDTO> getRecords(int start, int total) {
		ArrayList<EmpDTO> list = new ArrayList<EmpDTO>();
		try {
			Connection con = getConnection();
			PreparedStatement ps = con
					.prepareStatement("select EMPNO, ENAME, SAL  from emp limit " + (start - 1) + "," + total);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				EmpDTO e = new EmpDTO();
				e.setId(rs.getInt(1));
				System.out.println(rs.getInt(1));
				e.setName(rs.getString(2));
				e.setSalary(rs.getFloat(3));
				list.add(e);
			}
			rs.close();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return list;
	}

	public boolean registerEmp(EmpDTO dto) throws ServletException {
		Connection conn = getConnection();
		String query = "insert into emp(EMPNO,ENAME,SAL) values (?,?,?) ";
		System.out.println(dto.getId());
		boolean success = false;
		try {
			PreparedStatement pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, dto.getId());
			pstmt.setString(2, dto.getName());
			pstmt.setFloat(3, dto.getSalary());
			pstmt.executeUpdate();
			pstmt.close();
			conn.close();
			success = true;

		} catch (SQLException ex) {
			success = false;
			// throw new ServletException("등록 실패!");

		} finally {
		}
		if (success == true)
			return true;
		return true;
	}

	// Update와 Delete를 구현하시오
	// EMPNO를 key 이름하고 salary를 수정하는 것으로 합니다
	// 삭제는 이름을 기준으로 삭제

	public boolean updateEmp(EmpDTO dto) throws ServletException {
		Connection conn = getConnection();
		String query = "UPDATE emp SET ENAME=?, SAL=? WHERE EMPNO=?";
		System.out.println(dto.getId());
		boolean success = false;
		try {
			PreparedStatement pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1, dto.getName());
			pstmt.setFloat(2, dto.getSalary());
			pstmt.setInt(3, dto.getId());

			int affectedRows = pstmt.executeUpdate();

			if (affectedRows > 0) {
				success = true;
			}

		} catch (SQLException ex) {
			throw new ServletException("수정 실패!");

		} finally {
			try {
				if (conn != null && !conn.isClosed()) {
					conn.close();
				}
			} catch (SQLException ex) {
				ex.printStackTrace();
			}
		}

		return success;
	}
	public boolean deleteEmp(EmpDTO dto) throws ServletException {
		Connection conn = getConnection();
		String query = "Delete from emp WHERE ENAME=? ";
		System.out.println(dto.getId());
		boolean success = false;
		try {
			PreparedStatement pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1, dto.getName());
			 
			int affectedRows = pstmt.executeUpdate();

			if (affectedRows > 0) {
				success = true;
			}

		} catch (SQLException ex) {
			throw new ServletException("삭제 실패!");

		} finally {
			try {
				if (conn != null && !conn.isClosed()) {
					conn.close();
				}
			} catch (SQLException ex) {
				ex.printStackTrace();
			}
		}

		return success;
	}
}