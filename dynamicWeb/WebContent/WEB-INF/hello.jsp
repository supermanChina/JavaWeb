<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>WEB-INF文件安全</title>
</head>
<body>
	<%
		out.println("<h2>存放于WEB-INF目录的文件不能直接访问 </h2");
		out.println("<h2>必须通过WEB-INF/web.xml配置映射才能访问</h2");
		//在web.xml中添加如下配置映射,访问hello.map
		// 	<servlet>
		// 		<servlet-name>hello</servlet-name>
		// 		<jsp-file>/WEB-INF/hello.jsp</jsp-file>
		// 	</servlet>
		// 	<servlet-mapping>
		// 		<servlet-name>hello</servlet-name>
		// 		<url-pattern>/hello.map</url-pattern>
		// 	</servlet-mapping>
	%>
</body>
</html>