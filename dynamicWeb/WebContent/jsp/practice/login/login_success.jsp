<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login Success</title>
</head>
<body>
	<center>
		<h1>登录操作</h1>
		<h2>登录成功</h2>
		<%
			request.setCharacterEncoding("UTF-8");
		%>
		<h2>
			From request: 欢迎<font color="red"><%=request.getParameter("uname")%></font>光临！<br>
			From session: 欢迎<font color="blue"><%=session.getAttribute("loginUser")%></font>光临！
			<br> session ID:
			<%=session.getId()%>
		</h2>
	</center>
</body>
</html>