<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登录</title>
<jsp:useBean id="reg" scope="request" class="com.jsp.demo.bean.Register"></jsp:useBean>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
	%>
	<!-- 	value中可以直接使用jsp tag,并且可以嵌套使用双引号 -->
	<form action="check.jsp" method="post">
		用户名： <input type="text" name="name"
			value="<jsp:getProperty name="reg" property="name"/>"><font color="RED"><%=reg.getErrorMsg("errName")%></font><br>
		年龄： <input type="text" name="age"
			value="<jsp:getProperty name="reg" property="age"/>"><%=reg.getErrorMsg("errAge")%><br>
		邮箱： <input type="text" name="email"
			value="<jsp:getProperty name="reg" property="email"/>"><%=reg.getErrorMsg("errEmail")%><br>
		<input type="submit" value="提交"> <input type="reset"
			value="重置">
	</form>
</body>
</html>