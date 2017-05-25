package com.demo.user.dao;

public class DAOFactory {

	public static IUserDAO getIUserDAOInstance() {
		return new UserDAOProxy();
	}
}
