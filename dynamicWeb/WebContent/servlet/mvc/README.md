# MVC开发

[TOC]

## 开发模式
- Servlet接收request
- 调用JavaBean操作Modle层数据
- 将数据传递给`RequestDispatcher`，转发到JSP页面显示View.
**由于只有一次请求转发，因此使用request scope传递属性提高性能**

## 问题处理
### 问题1：找不到login.jsp
访问`http://localhost:8080/dynamicWeb/mvc/loginServlet`报如下错误：
`HTTP Status 404 - /dynamicWeb/mvc/servlet/mvc/login.jsp`
#### 分析
servlet-mapping配置中`url-pattern`指向`/mvc/loginServlet`.
```
<servlet-mapping>
		<servlet-name>login</servlet-name>
		<url-pattern>/mvc/loginServlet</url-pattern>
</servlet-mapping>
```
Servlet实现中的dispatch目标URL为`String path = "servlet/mvc/login.jsp";`
```
String path = "servlet/mvc/login.jsp";
...
req.getRequestDispatcher(path).forward(req, resp);
```
则访问View展示页面时拼装路径为`/mvc/loginServlet`的父目录`/mvc` + `/servlet/mvc/login.jsp` = `/mvc/servlet/mvc/login.jsp`  
而login.jsp文件的实际存放位置在webroot的`servlet/mvc/login.jsp`路径下。
因此根据拼装后的路径找到login.jsp文件。
#### 解决方案
修改`servlet-mapping`中配置的`url-pattern`,指向`/servlet/mvc/loginServlet`  
```
	<servlet-mapping>
		<servlet-name>login</servlet-name>
		<url-pattern>/servlet/mvc/loginServlet</url-pattern>
	</servlet-mapping>
```
同时servlet中的target URL修改为相对于`/servlet/mvc`的路径，即`login.jsp`  
```
String path = "login.jsp";
...
```
这样拼装后的完整访问路径为`/servlet/mvc` ＝ `login.jsp` ＝ `/servlet/mvc/login.jsp`即可正确访问login.jsp资源。