<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>注销</title>
</head>
<body>
	<%
		response.setHeader("refresh", "2;URL=login.jsp");
		session.invalidate();
		//以下语句后报异常，因为session invalidate之后就不能够访问了了。
		//java.lang.IllegalStateException: getAttribute: Session already invalidated
		//String name = (String) session.getAttribute("userid");
	%>
	<h3>注销成功，2秒后跳转回登录首页</h3>
</body>
</html>