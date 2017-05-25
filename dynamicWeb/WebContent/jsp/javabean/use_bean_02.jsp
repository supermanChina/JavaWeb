<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.jsp.demo.bean.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Use Java Bean</title>
</head>
<body>
	<%
		SimpleBean bean = new SimpleBean();
		bean.setName("名字");
		bean.setAge(24);
	%>
	<h3>
		姓名：<%=bean.getName()%>
	</h3>
	<h3>
		年龄：<%=bean.getAge()%>
	</h3>
</body>
</html>