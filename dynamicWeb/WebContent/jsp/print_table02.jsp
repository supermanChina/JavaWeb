<html>
	<head>
		<title>JSP table</title>
	</head>
	<body>
		<table border="1" width="100%">
		<%
			int rows=10;
			int cols=10;
			for (int i=0; i<rows; i++){
		%>
			<tr>
			<%
				for (int j=0; j<cols; j++){
			%>
				<td><%=(i*j)%></td>
			<%
				}
			%>
		<%
			}
		%>		
			</tr>		
		</table>
	</body>
</html>