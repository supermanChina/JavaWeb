<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.jsp.db.conn.*"%>
<%@ page import="com.jsp.dao.*"%>
<%@ page import="com.jsp.vo.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Show all employees</title>
</head>
<body>
	<%
		DataBaseConnection conn = new DataBaseConnection();
		IEmpDAO dao = new EmpDAOImpl(conn.getConn());
		Emp emp = dao.queryById(6060);
	%>
	<h3>No.6060: <%=emp.getEname() %></h3>
</body>
</html>