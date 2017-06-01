package com.demo.servelet.listener;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

public class ServletContexListenerDemo implements ServletContextListener {

	@Override
	public void contextInitialized(ServletContextEvent sce) {
		System.out.println("Servlet containter init evnt handle");
		ServletContext servletContext = sce.getServletContext();
		System.out.println("Get servletContext from event:" + servletContext);
	}

	@Override
	public void contextDestroyed(ServletContextEvent sce) {
		System.out.println("Servlet containter destory evnt handle");
		ServletContext servletContext = sce.getServletContext();
		System.out.println("Get servletContext from event:" + servletContext);
	}

}
