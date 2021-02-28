package com.toroRosso.main;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MainController {

	@GetMapping("/")
	public String main() {
		return "index";
	}
	
	
	@GetMapping("/jqgrid")
	public String jqgird() {
		return "index";
	}
	
	
	@GetMapping("/dhxgrid")
	public String dhxgrid() {
		return "index";
	}
	
	@GetMapping("/toastgrid")
	public String toastgird() {
		return "index";
	}
	
}
