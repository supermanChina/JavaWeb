<%!public static final String INFO = "www.jsp.com"; //global var%>

<%!public int add(int x, int y) {
		return x + y;
	}%>

<%!class Person {
		private String name;
		private int age;

		public Person(String name, int age) {
			this.name = name;
			this.age = age;
		}

		public String toString() {
			return "name=" + name + "; age=" + age;
		}
	}%>

<%
	out.println("<h3>INFO=" + INFO + "</h3>");
	out.print("<h3>3+5=" + add(3, 5) + "</h3>");
	out.print("<h3>" + new Person("Zhang", 30) + "</h3>");
%>
