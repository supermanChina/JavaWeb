<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>保存文件</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		String name = request.getParameter("filename");
		String content = request.getParameter("filecontent");
		String filePath = getServletContext().getRealPath("/") + "note" + File.separator + name;

		File f = new File(filePath);
		if (!f.getParentFile().exists()) {
			f.getParentFile().mkdirs();
		}

		PrintStream ps = null;
		ps = new PrintStream(new FileOutputStream(f));
		ps.println(content);
		ps.close();
	%>
	<%
		//读取出来显示
		Scanner scan = new Scanner(new FileInputStream(f));
		scan.useDelimiter("\n");
		StringBuffer buf = new StringBuffer();
		while (scan.hasNext()) {
			buf.append(scan.next()).append("<br>");
		}
		scan.close();
	%>
	<h2>
		文件<%=name%>
		内容：
	</h2>
	<h3><%=buf%></h3>
</body>
</html>