/**
 * 
 */
package com.jsp.db.conn;

import java.sql.Connection;

/**
 * @author Xiaochao.Zhang
 *
 */
public interface IDataBaseConnection {

	public Connection getConnection();
	
	public void close();
}
