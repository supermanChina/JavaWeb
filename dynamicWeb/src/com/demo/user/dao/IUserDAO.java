package com.demo.user.dao;

import com.demo.user.vo.User;

public interface IUserDAO {

	/**
	 * 验证用户登录
	 * 
	 * @param user
	 * @return
	 * @throws Exception
	 */
	public boolean findLogin(User user) throws Exception;

}
