<%
	String username="UserName";
%>

<jsp:forward page="forward_demo02.jsp">
	<jsp:param name="name" value="<%=username%>" />
	<jsp:param name="info" value="www.jsp.demo.forward" />
</jsp:forward>