<%@ page contentType="text/html" pageEncoding="GBK"%>
<html>
<head>
<title>JSP Includes Demo: Dynamic with parameter</title>
</head>
<body>
	<%
		String username = "UserName";
	%>
	<h1>带参动态包含DEMO</h1>
	<jsp:include page="receive_param.jsp">
		<jsp:param name="name" value="<%=username%>" />
		<jsp:param name="info" value="www.jsp.demo" />
	</jsp:include>
</body>
</html>