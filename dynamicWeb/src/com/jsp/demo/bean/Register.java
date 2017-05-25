/**
 * 
 */
package com.jsp.demo.bean;

import java.util.HashMap;
import java.util.Map;

/**
 * @author Xiaochao.Zhang
 *
 */
public class Register {

	private String name = "";
	private String age = "";
	private String email = "";
	private Map<String, String> errors = new HashMap<String, String>();

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAge() {
		return age;
	}

	public void setAge(String age) {
		this.age = age;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public boolean isValid() {
		boolean isValid = true;

		if (!name.matches("\\w{6,15}")) {
			isValid = false;
			name = "";
			errors.put("errName", "用户名必须是6~15位字母或数字");
		}

		if (!age.matches("\\d+")) {
			isValid = false;
			age = "";
			errors.put("errAge", "年龄必须是数字");
		}

		if (!email.matches("\\w+@\\w+\\.\\w+\\.?\\w*")) {
			isValid = false;
			email = "";
			errors.put("errEmail", "非法的邮件地址");
		}

		return isValid;
	}

	public String getErrorMsg(String key) {
		String msg = errors.get(key);
		return msg == null ? "OK" : msg;
	}
}
