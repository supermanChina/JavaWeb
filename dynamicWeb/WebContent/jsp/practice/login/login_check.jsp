<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>DB connect demo</title>
</head>
<body>
	<%!public static final String DBDRIVER = "org.gjt.mm.mysql.Driver";
	public static final String DBURL = "jdbc:mysql://localhost:3306/mldn";
	public static final String DBUSER = "root";
	public static final String DBPASS = "123456";%>

	<%
		//JDBC方式连接mySQL数据库执行查询
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		boolean found = false;
		String name = null;
	%>
	<%
		try {
			Class.forName(DBDRIVER);
			conn = DriverManager.getConnection(DBURL, DBUSER, DBPASS);
			String sql = "SELECT name FROM member where mid=? AND password=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, request.getParameter("id"));
			pstmt.setString(2, request.getParameter("password"));
			rs = pstmt.executeQuery();
			if (rs.next()) {
				name = rs.getString(1);
				found = true;
			}
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			rs.close();
			pstmt.close();
			conn.close();
		}
	%>

	<%
		if (found) {
			String value = request.getParameter("remember");
			if ("Y".equals(value)) {
				Cookie cookiePwd = new Cookie("password", request.getParameter("password"));
				cookiePwd.setMaxAge(600);
				Cookie cookieId = new Cookie("id", request.getParameter("id"));
				cookieId.setMaxAge(600);
				response.addCookie(cookieId);
				response.addCookie(cookiePwd);
			} else {
				Cookie cookiePwd = new Cookie("password", "");
				cookiePwd.setMaxAge(0);
				Cookie cookieId = new Cookie("id", "");
				cookieId.setMaxAge(0);
				response.addCookie(cookieId);
				response.addCookie(cookiePwd);
			}
			//session设置属性不需要通过网络传参，而是在服务器内部对象传递
			session.setAttribute("loginUser", name);
			//Requset传参时指定编码格式，在目标页面getParam时设置同样的编码格式后再获取
			//避免乱码
			request.setCharacterEncoding("UTF-8");
			//如不指定则会用默认的编码方式
	%>
	<jsp:forward page="login_success.jsp">
		<jsp:param name="uname" value="<%=name%>" />
	</jsp:forward>
	<%
		} else {
	%>
	<jsp:forward page="login_failure.html" />
	<%
		}
	%>
</body>
</html>