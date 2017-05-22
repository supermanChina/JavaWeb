<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Session Time</title>
</head>
<body>
	<%
		long start = session.getCreationTime(); //milli
		long now = session.getLastAccessedTime(); //milli
		long duration = (now - start) / 1000; //seconds
	%>
</body>
	<h3>停留时间：<%=duration %>s</h3>
</html>