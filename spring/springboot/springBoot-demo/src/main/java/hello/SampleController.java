package hello;

import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@EnableAutoConfiguration
public class SampleController {

	@RequestMapping("/hello")
	@ResponseBody
	String home(){
	return "Hello World!";	
	}
	
	@RequestMapping("/")
	public String index(ModelMap map){
		map.addAttribute("host", "http://www.baidu.com");
		return "index";
	}
}
