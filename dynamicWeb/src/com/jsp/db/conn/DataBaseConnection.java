package com.jsp.db.conn;

import java.sql.DriverManager;
import java.sql.SQLException;

public class DataBaseConnection {

	private static final String DBDRIVER = "org.gjt.mm.mysql.Driver";
	private static final String DBURL = "jdbc:mysql://localhost:3306/mldn";
	private static final String DBUSER = "root";
	private static final String DBPASSWORD = "123456";

	private java.sql.Connection conn = null;

	public java.sql.Connection getConn() {
		return conn;
	}

	public DataBaseConnection() throws Exception {
		Class.forName(DBDRIVER);
		conn = DriverManager.getConnection(DBURL, DBUSER, DBPASSWORD);
	}

	public void close() throws SQLException {
		if (conn != null) {
			conn.close();
		}
	}
}
