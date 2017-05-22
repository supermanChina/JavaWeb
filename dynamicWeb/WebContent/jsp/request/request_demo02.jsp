<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Request接收一组参数</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("id");
		String name = request.getParameter("uname");
		//接收一组参数
		String inst[] = request.getParameterValues("inst");
		Enumeration<String> paramNames = request.getParameterNames();
		ArrayList<String> names = new ArrayList<String>();
		while (paramNames.hasMoreElements()) {
			names.add(paramNames.nextElement());
		}
	%>
	<h3>
		编号：<%=id%></h3>
	<h3>
		姓名：<%=name%></h3>
	<%
		if (inst != null && inst.length > 0) {
	%>
	<h3>
		兴趣：
		<%
		for (String in : inst) {
	%>
		<%=in%>
		<%
			}
		%>

	</h3>
	<%
		}
	%>
</body>
</html>