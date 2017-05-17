<%@ page language="java" contentType="text/html; charset=GBK"
	pageEncoding="GBK"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<title>DB connect demo</title>
</head>
<body>
	<%!public static final String DBDRIVER = "org.gjt.mm.mysql.Driver";
	public static final String DBURL = "jdbc:mysql://localhost:3306/mldn";
	public static final String DBUSER = "root";
	public static final String DBPASS = "123456";%>

	<%
		Connection conn = null;

		PreparedStatement pstmt = null;
		ResultSet rs = null;
	%>
	<%
		try {
			Class.forName(DBDRIVER);
			conn = DriverManager.getConnection(DBURL, DBUSER, DBPASS);
			String sql = "SELECT empno, ename, job, sal, hiredate FROM emp";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
	%>
	<center>
		<table border="1" width="80%">
			<tr>
				<td>雇员编号</td>
				<td>雇员姓名</td>
				<td>雇员工作</td>
				<td>雇员工资</td>
				<td>雇佣日期</td>
			</tr>
			<%
				while (rs.next()) {
						int empno = rs.getInt(1);
						String ename = rs.getString(2);
						String job = rs.getString(3);
						float sal = rs.getFloat(4);
						java.util.Date date = rs.getDate(5);
			%>
			<tr>
				<td><%=empno%></td>
				<td><%=ename%></td>
				<td><%=job%></td>
				<td><%=sal%></td>
				<td><%=date%></td>
			</tr>
			<%
				}
			%>
		</table>
	</center>
	<%
		} catch (Exception e) {

		} finally {
			rs.close();
			pstmt.close();
			conn.close();
		}
	%>

</body>
</html>