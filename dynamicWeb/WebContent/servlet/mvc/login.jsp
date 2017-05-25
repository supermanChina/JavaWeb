<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登录</title>
<script>
	function validate(f) {

		if (!(/^\w{5,15}$/.test(f.userid.value))) {
			alert("用户名必须为5~15位字符！");
			f.userid.focus();
			return false;
		}

		if (!(/^\w{5,15}$/.test(f.userpass.value))) {
			alert("用户密码必须为5~15位字符！");
			f.userpass.focus();
			return false;
		}

		return true;
	}
</script>
</head>
<body>
	<h2>用户登录</h2>
	<%
		request.setCharacterEncoding("UTF-8");
		List<String> info = (List<String>) request.getAttribute("info");
		if (info != null) {
			for (String str : info) {
	%>
	<h3>
		提示信息：<%=str%></h3>
	<%
			}
		}
	%>
	<form action="loginServlet" method="post" onsubmit="return validate(this)">
		用户ID： <input type="text" name="userid"> <br>
		密&nbsp;&nbsp;码： <input type="password" name="userpass"> <br>
		<input type="submit" name="提交"> <input type="reset" name="重置">
	</form>
</body>
</html>