<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Express Language Demo</title>
</head>
<body>
	<%
		pageContext.setAttribute("info", "Value in page context scope");
		request.setAttribute("info", "Value in request scope");
		session.setAttribute("info", "Value in sessio scope");
		application.setAttribute("info", "value in application scope");
	%>
	<h2>
		Defautl scope is page scope: ${info}
		</h3>
		<h3>pageScope: ${pageScope.info}</h3>
		<h3>requestScope: ${requestScope.info}</h3>
		<h3>sessionScope: ${sessionScope.info}</h3>
		<h3>applicationScope: ${applicationScope.info}</h3>
</body>
</html>