# Servlet
- 继承HttpServlet
- Overrride doGet()或doPost()等方法
- 传入参数HttpServletRequest, HttpServletResponse

## 配置
- web.xml
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

