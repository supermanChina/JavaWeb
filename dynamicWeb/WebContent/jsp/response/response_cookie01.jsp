<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Cookie Add DMEO</title>
</head>
<body>
	<%
		//No age set在浏览器关闭后重新打开就不能访问了
		Cookie c1 = new Cookie("cookie1", "value1");
		Cookie c2 = new Cookie("cookie2", "value2");
		response.addCookie(c1);
		response.addCookie(c2);
	%>

</body>
</html>