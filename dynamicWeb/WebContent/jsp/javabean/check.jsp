<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Check page</title>
<jsp:useBean id="reg" scope="request" class="com.jsp.demo.bean.Register"></jsp:useBean>
<jsp:setProperty name="reg" property="*" />
</head>
<body>

	<%
		if (reg.isValid()) {
	%>
	<jsp:forward page="success.jsp" />
	<%
		} else {
	%>
	<jsp:forward page="index.jsp" />
	<%
		}
	%>

</body>
</html>