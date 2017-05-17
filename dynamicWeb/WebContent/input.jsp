<html>
<head>
	<title> Interactive demo JSP </title>
</head>

<body>
	<%
		String str = request.getParameter("info");
		out.println("<h1>" + str + "</h1>");
	%>
</body>

</html>