# AJAX
## XMLHttpRequest
1. 通过`new XMLHttpRequest()`创建xmlHttp对象
2. `open("POST", "content.html")`设置一个请求对象
3. `onreadystatechange`属性设置响应回调函数
4. `send()`向服务端发出请求，然后在设置的回调函数中进行相应处理
5. `readyState` 返回当前请求的状态（共5种）：
	- 0 请求未初始化（还未调用`open()`）
	- 1 请求已创建但未发出（已调用`open()`但还未调用`send()`）
	- 2 请求已经发出正在处理（该状态下可以从响应中得到响应头信息）
	- 3 请求已经处理，正在接收服务器信息。仅有部分数据可用，还未完成全部响应数据接收
	- 4 响应已完成，可以获取服务器响应数据进行处理
6. `responseText`接收以文本返回的数据
7. `responseBody`回应正文以unsigned byte数组形式返回
8. `responseXML`接收以XML返回的数据
9. `status`返回当前请求的HTTP状态码
10. `statusText`返回当前请求的响应行状态
## responseText示例
[ajax_receive_content.html](ajax_receive_content.html)
## responseXMLt示例
[ajax_select.html](ajax_select.html)