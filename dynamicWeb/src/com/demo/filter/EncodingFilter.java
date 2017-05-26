package com.demo.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class EncodingFilter implements Filter {

	private String charset = "UTF-8"; // default charset

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		String charsetConfig = filterConfig.getInitParameter("charset");
		if (charsetConfig != null && charsetConfig.length() > 0) {
			charset = charsetConfig;
		}
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		request.setCharacterEncoding(charset);
		chain.doFilter(request, response);
	}

	@Override
	public void destroy() {

	}

}
