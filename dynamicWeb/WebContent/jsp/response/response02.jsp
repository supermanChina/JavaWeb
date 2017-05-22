<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Response设置header指定秒数自动跳转</title>
</head>
<body>
<h3>5秒后自动跳转到repsonse01.jsp</h3>
<%
	response.setHeader("refresh", "5; URL=response01.jsp");
%>
</body>
</html>