package com.demo.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class LoginFilter implements Filter {

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {

	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpSession session = req.getSession();
		if (validteUser(session)) {
			// 继续访问
			chain.doFilter(request, response);
		} else {
			// 跳转请求登录
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}
	}

	private boolean validteUser(HttpSession session) {
		// TODO: 根据session中保存的登录验证信息
		return false;
	}

	@Override
	public void destroy() {

	}

}
