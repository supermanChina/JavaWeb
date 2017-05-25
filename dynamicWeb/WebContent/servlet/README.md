# Servlet


[TOC]



## 继承HttpServlet
- Overrride doGet()或doPost()等方法
- doGet()和doPost()一般共用一个实现体
- 传入参数HttpServletRequest, HttpServletResponse
```
public class HelloServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String info = req.getParameter("info");
		PrintWriter out = resp.getWriter();
		out.println("<html>");
		out.println("<body>");
		out.println("<h2>" + "Hello: " + info + "</h2>");
		out.println("</body>");
		out.println("</html>");
		out.close();
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}
```

## 配置
- web.xml  
为HelloServlet在应用的[web.xml](../WEB-INF/web.xml)中添加如下配置：
```	
    <servlet>
		<servlet-name>hello</servlet-name>
		<servlet-class>com.java.demo.servlet.HelloServlet</servlet-class>
	</servlet>
	<servlet-mapping>
		<servlet-name>hello</servlet-name>
		<url-pattern>/hello</url-pattern>
	</servlet-mapping>
```



添加servlet和servlet-mapping节点配置  
例如tomcat的default servlet配置  
```
<servlet>
        <servlet-name>default</servlet-name>
        <servlet-class>org.apache.catalina.servlets.DefaultServlet</servlet-class>
        <init-param>
            <param-name>debug</param-name>
            <param-value>0</param-value>
        </init-param>
        <init-param>
            <param-name>listings</param-name>
            <param-value>false</param-value>
        </init-param>
        <load-on-startup>1</load-on-startup>
</servlet>
```
例如tomcat的default servlet-mapping配置
url-pattern表示符合该url匹配的地址都指定该servlet处理
```
<servlet-mapping>
        <servlet-name>default</servlet-name>
        <url-pattern>/</url-pattern>
</servlet-mapping>
```
**注意：同一个sevlet定义可以映射到多个servlet-mapping**

## Servlet生命周期
### 加载
Web容器如Tomcat启动时，根据web.xml中配置的servlent节点加载指定的servlet Class. 
默认情况下servlet在第一次调用时初始化。  
可通过web.xml中配置load-on-startup指定在容器启动时初始化。  
`<load-on-startup>1</load-on-startup>`
### 初始化
调用 init()初始化  
init(ServletConfig config)方法通过config传入web.xml中该servlet的初始化配置参数。  
以下通过`init-param`指定的参数`listings`在sevlet中可通过`config.getInitParameter("listings")`来获取配置的value:`false`.  
```
<servlet>
        <servlet-name>default</servlet-name>
        <servlet-class>org.apache.catalina.servlets.DefaultServlet</servlet-class>
        <init-param>
            <param-name>debug</param-name>
            <param-value>0</param-value>
        </init-param>
        <init-param>
            <param-name>listings</param-name>
            <param-value>false</param-value>
        </init-param>
        <load-on-startup>1</load-on-startup>
</servlet>
```

### 提供服务
通过service()方法处理服务。  
HttpServlet.service()方法解析request，根据请求方法类型调用对应的doGet()和doPost()等方法处理。
### 销毁
WEB服务关闭时调用 destory()方法，在destory()中释放相关资源。

## 获取内置对象
### session
`req.getSession()`获取当前session  
`req.getSession(true)`获取当前session。如果当前session不存在则创建一个新session.  
### ServletContext
`getServletContext()`ServletContext就是JSP中的内置application对象

## forward
### 客户端跳转
`response.sendRedirect("target path")` 跳转传递session范围的属性，不能传递request范围属性。  
### 服务端跳转
通过request获取`RequestDispather`对象，使用该对象的`forward()`方法跳转。  
该跳转可以接收request和session范围的属性。
```
RequestDispather rd = req.getRequestDispatcher("target path");
rd.forward(req, resp);
```
