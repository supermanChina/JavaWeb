# Listener
[TOC]
## 监听application
### 监听application context
#### 实现ServletContextListener接口
```
public class ServletContexListenerDemo implements ServletContextListener {

	@Override
	public void contextInitialized(ServletContextEvent sce) {
		System.out.println("Servlet containter init evnt handle");
		ServletContext servletContext = sce.getServletContext();
		System.out.println("Get servletContext from event:" + servletContext);
	}

	@Override
	public void contextDestroyed(ServletContextEvent sce) {
		System.out.println("Servlet containter destory evnt handle");
		ServletContext servletContext = sce.getServletContext();
		System.out.println("Get servletContext from event:" + servletContext);
	}

}
```
#### web.xml添加listener配置
```
<listener>
		<listener-class>com.demo.servelet.listener.ServletContexListenerDemo</listener-class>
</listener>
```
**注意配置顺序**  
同一个web.xml配置元素的建议顺序  
1. 先配置filter  
2. 再配置listener  
3. 最后配置servlet  

### 监听application attribute
实现接口`ServletContextAttributeListener`监听如下事件：  
- attributeAdded
- attributeRemoved 
- attributeReplaced 

通过`ServletContextAttributeEvent`事件获取属性名称和值
在web.xml中添加对应的listener配置。

## 监听session
### 监听session状态
实现接口`HttpSessionListener`监听如下事件：
- sessionCreated
- sessionDestroyed  

`HttpSessionEvent`提供getSession()方法获取session对象  
**session销毁时的两种不同方式：**
- 通过`HttpSession.invalidate()`让session失效  
- 通过web.xml中配置session timeout(分钟)超时后自动失效  
```
<session-config>
	<session-timeout>30</session-timeout>
</session-config>
```

### 监听session属性
实现接口`HttpSessionAttributeListener`监听如下事件：  
- attributeAdded
- attributeRemoved
- attributeReplaced

通过`HttpSessionBindingEvent`事件接口获取sesssion及其属性。  
在web.xml中添加对应的listener配置。  

### 实现`HttpSessionBindingListener`接口获取监听session
这种方式监听session不需要在web.xml中配置listener。  
实现该接口的对象通过以下接口获得session状态变化（在该对象被setAttribute到session/或从session中removeAttribute时）通知：  
- `public void valueBound(HttpSessionBindingEvent event)`
- `public void valueUnbound(HttpSessionBindingEvent event)`

## 监听request
### ServletRequestListener接口
监听如下事件： 
- requestInitialized
- requestDestroyed

通过`ServletRequestEvent`事件获取通知。  
在web.xml中配置listener节点。

### ServletRequestAttributeListener接口
监听request属性的如下事件：  
- attributeAdded
- attributeRemoved
- attributeReplaced

