package com.demo.user.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.demo.user.dao.DAOFactory;
import com.demo.user.vo.User;

public class LoginServlet extends HttpServlet {

	/*
	 * (non-Javadoc)
	 * 
	 * @see javax.servlet.http.HttpServlet#doGet(javax.servlet.http.
	 * HttpServletRequest, javax.servlet.http.HttpServletResponse)
	 */
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String path = "login.jsp";
		String userid = req.getParameter("userid");
		String userpass = req.getParameter("userpass");
		List<String> info = new ArrayList<String>();

		if (userid == null || userid.length() == 0) {
			info.add("用户ID不能为空");
		}
		if (userpass == null || userpass.length() == 0) {
			info.add("用户密码不能为空");
		}

		if (info.size() == 0) {
			User user = new User();
			user.setUserid(userid);
			user.setPassword(userpass);
			try {
				if (DAOFactory.getIUserDAOInstance().findLogin(user)) {
					info.add("用户登录成功。欢迎" + user.getName() + "光临");
				} else {
					info.add("用户登录失败。错误用户名或密码！");
				}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		req.setAttribute("info", info);
		req.getRequestDispatcher(path).forward(req, resp);

	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see javax.servlet.http.HttpServlet#doPost(javax.servlet.http.
	 * HttpServletRequest, javax.servlet.http.HttpServletResponse)
	 */
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}

}
