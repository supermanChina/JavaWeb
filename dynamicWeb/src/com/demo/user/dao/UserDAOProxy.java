package com.demo.user.dao;

import com.demo.user.vo.User;
import com.jsp.db.conn.DataBaseConnection;

public class UserDAOProxy implements IUserDAO {

	DataBaseConnection dataBaseConnection = null;
	private IUserDAO dao = null;

	public UserDAOProxy() {
		try {
			DataBaseConnection dataBaseConnection = new DataBaseConnection();
			dao = new UserDAOImpl(dataBaseConnection.getConn());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Override
	public boolean findLogin(User user) throws Exception {
		boolean found = dao.findLogin(user);
		
		return found;
	}

}
