package com.dbcp;

import java.sql.Connection;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class DbcpBean2 {
	private Connection conn;

	public DbcpBean2() {
		try {
			Context initcontext = new InitialContext();
			Context envContext = (Context) initcontext.lookup("java:/comp/env");
			DataSource ds = (DataSource) envContext.lookup("jdbc/sungjukconn");
			conn = ds.getConnection();
			System.out.println("성정 디비에 접속 완료");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public Connection getConn() {
		return conn;
	}
}
