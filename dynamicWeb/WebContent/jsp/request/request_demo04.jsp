<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Request接收多种类型参数</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
	%>
	<table border="1">
		<tr>
			<th>参数名称</th>
			<th>参数内容</th>
		</tr>
		<%
			Enumeration<String> enu = request.getParameterNames();
			while (enu.hasMoreElements()) {
				String param = enu.nextElement();
		%>
		<tr>
			<td><%=param%></td>
			<td>
				<%
					if (param.startsWith("**")) {
							String values[] = request.getParameterValues(param);
							for (String value : values) {
				%>
								 <%=value%>,
				<%
				 			}
				 		} else {
						 String value=request.getParameter(param);
				 %>
				 	<%=value %>
				 <%		
				 		}
				 %>
			</td>
		</tr>
		<%
			}
		%>
	</table>
</body>
</html>