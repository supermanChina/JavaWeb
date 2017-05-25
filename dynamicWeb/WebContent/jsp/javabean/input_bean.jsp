<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="bean" scope="page" class="com.jsp.demo.bean.SimpleBean" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>使用bean映射输入表单</title>
</head>
<body>

	<%
		request.setCharacterEncoding("UTF-8");
	%>
	<jsp:setProperty property="*" name="bean" />
	<h3>
		姓名：<%=bean.getName()%></h3>
	<h3>
		年龄：<%=bean.getAge()%></h3>
	<h4>通过jsp:getProperty获取属性</h4>
	<h4>
		name:<jsp:getProperty property="name" name="bean" /></h4>
	<h4>
		age:<jsp:getProperty property="age" name="bean" /></h4>
</body>
</html>