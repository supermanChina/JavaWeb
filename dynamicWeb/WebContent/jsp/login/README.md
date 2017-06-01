# forward传递中文参数乱码问题
## 问题描述
login_check.jsp在查询DB后获取到用户的name值为中文，通过`jsp:forward`标签转发到`log_success.jsp`显示登录成功信息，但用户名称显示为乱码。
## 分析定位
乱码问题一般都是由于通过forward传参时的编码，与接收页面解码时的字符编码不一致造成的。  
查看`login_check.jsp`代码，发现`jsp:forward`参数跳转到`login_success.jsp`时没有指定编码格式，而在`login_success.jsp'中使用'UTF-8`解码则显示为乱码。
## 解决方案
在使用`jsp:forward`标签之前，调用`request.setCharacterEncoding("UTF-8");`设置传参编码。	
`login_check.jsp`  
```
	name＝"中文";
    ...
    request.setCharacterEncoding("UTF-8");
	%>

	<%
		if (found) {
	%>
	<jsp:forward page="login_success.jsp">
		<jsp:param name="uname" value="<%=name%>" />
	</jsp:forward>
	<%
		} else {
	%>
	<jsp:forward page="login_failure.html" />
	<%
```
然后在目标页面`login_success.jsp`中使用同样的编码解码取出参数，即可正常显示中文。  
`login_success.jsp`  
```
		<%
			request.setCharacterEncoding("utf-8");
			String uname = request.getParameter("uname");
		%>
		<h2>
			欢迎<font color="red"><%=uname%></font>光临！
		</h2>
```
