<%@ page language="java" contentType="text/html; charset=GBK"
	pageEncoding="GBK"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<title>Session Scope</title>
</head>
<body>
	<%
		//session属性在同一个浏览器中有效
		session.setAttribute("name", "名字");
		session.setAttribute("birthdate", new Date());
	%>
	<a href="session_scope_02.jsp">超链接客户端跳转通过session传递属性</a>
</body>
</html>