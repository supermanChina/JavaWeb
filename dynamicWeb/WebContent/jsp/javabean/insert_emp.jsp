<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="com.jsp.db.conn.*,com.jsp.dao.*,com.jsp.vo.*,java.text.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>插入新雇员</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		DataBaseConnection conn = new DataBaseConnection();
		IEmpDAO dao = new EmpDAOImpl(conn.getConn());

		Emp emp = new Emp();
		emp.setEmpno(Integer.valueOf(request.getParameter("empno")));
		emp.setEname(request.getParameter("empname"));
		emp.setJob(request.getParameter("job"));
		emp.setHiredate((new SimpleDateFormat("yyyy-MM-dd")).parse(request.getParameter("hiredate")));
		emp.setSal(Float.valueOf(request.getParameter("sal")));
		try {
			if (dao.insert(emp)) {
	%>
	<h3>
		添加成功：<%=emp.getEname()%></h3>
	<%
		} else {
	%>
	<h3>
		添加失败！<a href="insert.jsp">请重试</a>
	</h3>
	<%
		}
		} catch (Exception e) {
	%>
	<h3>
		添加失败！<a href="insert.jsp">请重试</a>
	</h3>
	<%
		}
	%>
</body>
</html>