<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Request请求</title>
</head>
<body>
	<%
		//从request提取表单参数
		//设置成与request页面对应的UTF-8或者GBK可以正确 显示中文
		String encoding = request.getCharacterEncoding();
		//原始encoding默认为null，因此不设置的话将使用浏览器默认的encoding解码从而导致乱码
		request.setCharacterEncoding("UTF-8");
		String content = request.getParameter("info");
	%>
	<h2>
		info=<%=content%></h2>
	<h3>
		原始request encoding=<%=encoding%>
	</h3>
</body>
</html>