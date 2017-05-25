# 定义bean
`<jsp:useBean id="bean" scope="page" class="com.jsp.demo.bean.SimpleBean" />`

# 映射request参数到bean
## 自动匹配
`<jsp:setProperty property="*" name="bean" />`
## 指定属性
*property为java bean的属性*
`<jsp:setProperty property="name" name="bean" />`
## 指定参数:
*param为HTML FORM中的key/value的key*  
`<jsp:setProperty property="name" param="name" name="bean" />`

定义的bean根据scope不同，存放于对应的application, request, session和pageConText的属性中。
移除bean可以通过在对应的对象上调用removeAttribute(beanName)来实现。