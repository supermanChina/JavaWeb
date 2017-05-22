<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登录欢迎页</title>
</head>
<body>
	<%
		String name = (String) session.getAttribute("userid");
		if (name != null) {
	%>
	<h3>
		欢迎用户<%=name%>光临！<br>
		点击<a href="logout.jsp">注销</a>退出
	</h3>
	<%
		} else {
	%>
	<h3>
		请点击<a href="login.jsp">登录</a>
	</h3>
	<%
		}
	%>

</body>
</html>