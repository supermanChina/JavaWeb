<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加管理员</title>
</head>
<body>
	<form action="add.jsp" method="post">
		管理员ID：<input type="text" name="adminid"> <br> 
		管理员组：<select name="admingroup">
			<option value="0">系统管理员组</option>
			<option value="1">普通管理员组</option>
		</select> <br>
		<input type="submit" value="创建"> <input type="reset"
			value="重置">
	</form>

</body>
</html>