# Filter

## 实现javax.servlet.Filter接口
实现示例[SimpleFilter](../../../src/com/demo/filter/SimpleFilter.java)
### init(FilterConfig filterConfig)
初始化过滤器，通过config获取配置参数

### doFilter(request, response, filterChain)
过滤操作实现方法，通过filterChain继续传递请求
```
public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		System.out.println("doFilter here");
		chain.doFilter(request, response);
		System.out.println("doFilter done");
}
```
### destory()
销毁过滤器

## web.xml添加Filter配置  
[web.xml](../../../WEB-INF/web.xml)中配置Filter与Servlet配置类似：  
`<url-pattern>/*</url-pattern>`表示所有访问根目录下的资源都需要经过Filter处理
```
	<filter>
		<filter-name>simple</filter-name>
		<filter-class>com.demo.filter.SimpleFilter</filter-class>
		<init-param>
			<param-name>ref</param-name>
			<param-value>HelloFilter</param-value>
		</init-param>
	</filter>
	<filter-mapping>
		<filter-name>simple</filter-name>
		<url-pattern>/*</url-pattern>
	</filter-mapping>
```
## Filter应用
Filter以组件形式链式加载到用户访问与servlet服务之间，可通过Filter完成如用户验证、编码设置等Common的操作。  
### 统一设置编码
[EncodingFilter](../../../src/com/demo/filter/EncodingFilter.java)
- init()获取配置encoding参数
```
	private String charset = "UTF-8"; // default charset

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		String charsetConfig = filterConfig.getInitParameter("charset");
		if (charsetConfig != null && charsetConfig.length() > 0) {
			charset = charsetConfig;
		}
	}
```
- doFilter()统一设置配置encoding
```
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		request.setCharacterEncoding(charset);
		chain.doFilter(request, response);
	}
```
### 统一登录验证
[LoginFilter](../../../src/com/demo/filter/LoginFilter.java)
```
@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpSession session = req.getSession();
		if (validteUser(session)) {
			// 继续访问
			chain.doFilter(request, response);
		} else {
			// 跳转请求登录
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}
	}

	private boolean validteUser(HttpSession session) {
		// TODO: 根据session中保存的登录验证信息
		return false;
	}[^]
```


## 遇到的问题
### 配置filter后访问任何路径都报找404错误
```
HTTP Status 404 - /dynamicWeb/hello
type Status report
message /dynamicWeb/hello
description The requested resource is not available.
```
### 分析定位
在SimpleFilter方法中打断点尝试调试，结果访问任何地址都没有进入断点。  
采用排除分析法。怀疑是添加filter配置后导致的问题，将filter配置注释后重启tomcat，发现能够正常访问。  
再打开filter配置后重启tomcat，仔细观察tomcat后台console发现报告如下异常：  
```
SEVERE: Exception starting filter simple
java.lang.ClassNotFoundException: com.demo.filter.SimplteFilter
	at org.apache.catalina.loader.WebappClassLoaderBase.loadClass(WebappClassLoaderBase.java:1333)
...
```
原来是Filter的Class名称写错了 :(
### 解决方案
修改filter配置为正确的SimpleFilter类名后重启tomcat。