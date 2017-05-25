/**
 * 
 */
package com.demo.user.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.demo.user.vo.User;

/**
 * @author Xiaochao.Zhang
 *
 */
public class UserDAOImpl implements IUserDAO {
	private Connection conn = null;
	private PreparedStatement pstmt = null;

	public UserDAOImpl(Connection conn) {
		this.conn = conn;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.demo.user.dao.IUserDAO#findLogin(com.demo.user.vo.User)
	 */
	@Override
	public boolean findLogin(User user) throws Exception {
		boolean found = false;
		try {
			String sql = "SELECT name FROM user WHERE userid=? AND password=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user.getUserid());
			pstmt.setString(2, user.getPassword());
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				user.setName(rs.getString(1));
				found = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		} finally {
			pstmt.close();
		}
		return found;
	}

}
