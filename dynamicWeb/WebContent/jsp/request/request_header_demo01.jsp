<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>头信息</title>
</head>
<body>
	<%
		String method = request.getMethod();
		String ip = request.getRemoteAddr();
		String path = request.getServletPath();
		String host= request.getRemoteHost();
		String contextPath= request.getContextPath();
		String localAddr = request.getLocalAddr();
		Enumeration<String> enu = request.getHeaderNames();
		while (enu.hasMoreElements()) {
			String headerName = enu.nextElement();
			String hederValue = request.getHeader(headerName);
	%>
	<%=headerName%>
	->
	<%=hederValue%>
	<br>
	<%
		}
	%>
	<h3>
		method=<%=method%></h3>
	<h3>
		ip=<%=ip%></h3>
	<h3>
		host=<%=host%></h3>
	<h3>
		path=<%=path%></h3>
	<h3>
		contextPath=<%=contextPath%></h3>
	<h3>
		localAddr=<%=localAddr%></h3>
</body>
</html>