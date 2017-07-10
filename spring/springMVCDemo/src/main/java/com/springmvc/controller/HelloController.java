package com.springmvc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/hello")
public class HelloController {

	@RequestMapping(value = "/mvc", method = RequestMethod.GET)
	public String helloWorld(Model model) {
		model.addAttribute("message", "Hello from MVC controller");

		return "hello";
	}

}
