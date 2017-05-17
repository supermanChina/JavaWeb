<html>
	<head>
		<title>www.jsp.com</title>
	</head>
	<body>
		<table border="1" width="100%">
		<%
			int rows=0;
			int cols=0;
			rows=Integer.parseInt(request.getParameter("row"));
			cols=Integer.parseInt(request.getParameter("col"));
			
			for(int x=0; x<rows; x++){
		%>
			<tr>
			<%
				for(int y=0; y<cols; y++){
			%>
				<td><%=(x*y)%></td>
				<%
				}
				%>
			</tr>
		<%
			}
		%>
		</table>
	</body>
</html>