<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登录成功</title>
<jsp:useBean id="reg" scope="request" class="com.jsp.demo.bean.Register"></jsp:useBean>
<%
	request.setCharacterEncoding("UTF-8");
%>
</head>
<body>
	用户名： <jsp:getProperty property="name" name="reg"/> <br>
	年龄： <jsp:getProperty property="age" name="reg"/> <br>
	邮箱： <jsp:getProperty property="email" name="reg"/> <br>
</body>
</html>