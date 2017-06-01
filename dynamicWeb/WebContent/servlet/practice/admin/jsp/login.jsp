<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="loginAction" method="post">
		用户名： <input type="text" name="name"><br>
		 密&nbsp;&nbsp;码：<input	type="password" name="pwd"> <br> 
		<input type="submit"value="登录"> 
		<input type="reset" value="重置"> <br>
	</form>
	<%
		String result = (String)request.getAttribute("result");
		if(result !=null && result.length()>0){
	%>
		<font color="red"><%=result %></font>
	<%
		}
	%>
</body>
</html>