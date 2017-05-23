<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login page</title>
<script>
	function loadFromCookie() {
		//获取cookie
		var id = getCookie("id");
		console.log("id=" + id);
		if (id != undefined && id != "") {
			document.getElementById("id").value = id;
		}
		var password = getCookie("password");
		console.log("password"+password);
		if (password != undefined && password != "") {
			document.getElementById("password").value = password;
		}
	}

	function setCookie(cname, cvalue, exdays) {
		var d = new Date();
		d.setTime(d.getTime() + (exdays * 24 * 60 * 60 * 1000));
		var expires = "expires=" + d.toGMTString();
		document.cookie = cname + "=" + cvalue + "；" + expires;
	}

	function getCookie(cname) {
		var name = cname + "=";
		var cookies = document.cookie.split(";");
		for (var i = 0; i < cookies.length; i++) {
			var c = cookies[i].trim();
			if (c.indexOf(name) == 0) {
				return c.substring(name.length, c.length);
			}
		}
	}

</script>
</head>
<body onLoad="loadFromCookie()">
	<center>
		<h1>用户登录</h1>
		<form action="login_check.jsp" method="post">
			<table border="1">
				<tr>
					<td colspan="2">用户登录</td>
				</tr>
				<tr>
					<td>用户ID:</td>
					<td><input type="text" name="id" id="id"></td>
				</tr>
				<tr>
					<td>登录密码：</td>
					<td><input type="password" name="password" id="password"></td>
				</tr>
				<tr>
					<td colspan="2">是否记住用户名和密码？<input type="radio" name="remember" value="Y"
						CHECKED>Y <input type="radio" name="remember" value="N">N
					</td>
				</tr>
				<tr>
					<td colspan="2"><input type="submit" value="提交"> <input
						type="reset" value="重置"></td>
				</tr>
			</table>
		</form>
	</center>
</body>
</html>