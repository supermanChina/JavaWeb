<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Login Success</title>
</head>
<body>
	<center>
		<h1>登录操作</h1>
		<h2>登录成功</h2>
		<%
			request.setCharacterEncoding("UTF-8");
			String uname = request.getParameter("uname");
		%>
		<h2>
			欢迎<font color="red"><%=uname%></font>光临！
		</h2>
	</center>
</body>
</html>