package com.dbcp;

import java.sql.Connection;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class DbcpBean2 {
	private Connection conn;	
	public DbcpBean2(){
		try{
			Context initContext = new InitialContext();
			Context envContext = (Context) initContext.lookup("java:/comp/env");
			DataSource ds = (DataSource) envContext.lookup("jdbc/studentconn");
			conn = ds.getConnection(); // DBCP ( database connection pool)
 
			System.out.println("DbcpBean 작업성공!");
		}catch (Exception e) {
		    e.printStackTrace();
		}
	}
	public Connection getConn(){		return conn;	}
}