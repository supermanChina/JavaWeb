<%@ page language="java" contentType="text/html; charset=GBK"
	pageEncoding="GBK"%>
<%@ page import="java.util.*"%>
<html>
<head>
<!-- <meta http-equiv="Content-Type" content="text/html; charset=utf-8"> -->
<title>Page Scope</title>
</head>
<body>
	<%
		String name = (String) pageContext.getAttribute("name");
		Date birth = (Date) pageContext.getAttribute("birthdate");
	%>
	<h2>
		аеУћЃК
		<%=name%></h2>
	<h2>
		ЩњШеЃК
		<%=birth%></h2>

</body>
</html>