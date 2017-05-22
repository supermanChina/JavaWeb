<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登录</title>
</head>
<body>
	<form action="login.jsp" method="post">
		用户名： <input type="text" name="uname"> <br>
		密&nbsp;&nbsp;码： <input type="password" name="upass"> <br>
		<input type="submit" value="登录"> <input type="reset"
			value="重置">
	</form>
	<%
		String name = request.getParameter("uname");
		String password = request.getParameter("upass");
		if (name != null && name.length() > 0 && password != null && password.length() > 0) {
			if ("user1".equals(name) && "pwd1".equals(password)) {
				response.setHeader("refresh", "2;URL=welcome.jsp");
				session.setAttribute("userid", name);
	%>
	<h3>
		用户<%=name%>登录成功，2秒后跳转欢迎页面
	</h3>
	<%
		} else {
	%>
	<h3>
		用户<%=name%>登录失败！
	</h3>
	<%
		}
		}
	%>
</body>
</html>