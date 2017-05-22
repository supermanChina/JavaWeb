<%@ page language="java" contentType="text/html; charset=GBK"
	pageEncoding="GBK"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Page Scope</title>
</head>
<body>
	<%
		//page属性仅在当前JSP页面有效
		pageContext.setAttribute("name", "名字");
		pageContext.setAttribute("birthdate", new Date());
		String name = (String) pageContext.getAttribute("name");
		Date birth = (Date) pageContext.getAttribute("birthdate");
	%>

	<!-- 	forward传参可将page属性传入另一个页面 -->
	<jsp:forward page="page_scope_03.jsp" />

</body>
</html>