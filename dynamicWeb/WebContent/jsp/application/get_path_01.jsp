<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Application Get Path</title>
</head>
<body>
	<%
		String path = application.getRealPath("/");
		//getServletContext（）获得同一个application对象	
		String path2 = getServletContext().getRealPath("/");
		ServletContext context = getServletContext();
		boolean isSameObject = application.equals(context);
	%>
	<h3>
		真实路径：<%=path%></h3>
	<h3>
		通过servletContext获取路径：<%=path2%></h3>
	<h3>
		application与ServletConext相同：<%=isSameObject%></h3>
</body>
</html>