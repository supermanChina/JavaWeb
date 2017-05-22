<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Response设置header</title>
</head>
<body>
<%!
	int count=0;
%>
<%
	response.setHeader("refresh", "8");
%>
<h3>自动刷新计数：<%=count++ %></h3>
</body>
</html>