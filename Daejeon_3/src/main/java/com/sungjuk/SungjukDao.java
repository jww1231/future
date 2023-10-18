package com.sungjuk;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import com.dbcp.*;

//...
//(이전 코드)
//...

public class SungjukDao {
 private Connection conn;

 public SungjukDao() {
     conn = new DbcpBean2().getConn();
 }

 public int registerMember(SungjukDto st) {
     CallableStatement stmt = null;
     int result = 0;

     try {
         String sql = "{call student_insert(?,?,?,?,?,?)}";
         stmt = conn.prepareCall(sql);
         stmt.setString(1, st.getName());
         stmt.setInt(2, st.getKor());
         stmt.setInt(3, st.getMat());
         stmt.setInt(4, st.getEng());
         stmt.setString(5, st.getSchoolcode());
         stmt.registerOutParameter(6, java.sql.Types.INTEGER);
         stmt.execute();
         result = stmt.getInt(6);
         stmt.close();

     } catch (Exception e) {
         result = 3;
         e.printStackTrace();
     } finally {
         try {
             this.conn.close();
         } catch (Exception e) {
             e.printStackTrace();
         } finally {
             this.close();
         }
     }
     return result;
 }

 public ArrayList<SungjukDto> selectMember() {
     CallableStatement stmt = null;
     ArrayList<SungjukDto> list = new ArrayList<SungjukDto>();

     try {
         stmt = conn.prepareCall("{call student_select()}");
         ResultSet rs = stmt.executeQuery();

         while (rs.next()) {
             String name = rs.getString("name");
             int kor = rs.getInt("kor");
             int mat = rs.getInt("mat");
             int eng = rs.getInt("eng");

             SungjukDto sungjuk = new SungjukDto();
             sungjuk.setName(name);
             sungjuk.setKor(kor);
             sungjuk.setMat(mat);
             sungjuk.setEng(eng);
             list.add(sungjuk);
         }

         stmt.close();
     } catch (Exception e) {
         e.printStackTrace();
     } finally {
         this.close();
     }

     return list;
 }

 public int updateMember(SungjukDto st) {
     CallableStatement stmt = null;
     int result = 0;

     try {
         // 수정된 부분: 'student_updete' 오타 수정
         String sql = "{call student_update(?,?,?,?,?,?)}";
         stmt = conn.prepareCall(sql);
         stmt.setInt(1, st.getBunho());
         stmt.setString(2, st.getName());
         stmt.setInt(3, st.getKor());
         stmt.setInt(4, st.getMat());
         stmt.setInt(5, st.getEng());
         stmt.registerOutParameter(6, java.sql.Types.INTEGER);

         int affectedRowCount = stmt.executeUpdate();
         System.out.println("변경된 행 수: " + affectedRowCount);

         result = stmt.getInt(6);
         stmt.close();
     } catch (Exception e) {
         e.printStackTrace();
     } finally {
         this.close();
     }
     return result;
 }

 public int deleteMember(SungjukDto st) {
     CallableStatement stmt = null;
     int result = 0;

     try {
         stmt = conn.prepareCall("{call student_delete(?,?)}");
         stmt.setString(1, st.getName());
         stmt.registerOutParameter(2, java.sql.Types.INTEGER);

         boolean success = stmt.execute();
         System.out.println(success);

         result = stmt.getInt(2);
     } catch (SQLException e) {
         e.printStackTrace();
     } finally {
         this.close();
     }

     return result;
 }

 // 나머지 코드는 이전 코드와 동일합니다.

 private void close() {
     try {
         if (conn != null && !conn.isClosed()) {
             conn.close();
         }
     } catch (SQLException e) {
         conn = null;
     }
 }
}
