package com.toroRosso.main;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MainController {

	@GetMapping("/")
	public String main() {
		return "index";
	}
	
	
	@GetMapping("/jqxgrid")
	public String jqxgrid() {
		return "/jqx/grid/demoJqxgrid";
	}
	
	
	@GetMapping("/dhxgrid")
	public String dhxgrid() {
		return "dhx/grid/demoDhxgrid";
	}
	
	@GetMapping("/toastgrid")
	public String toastgrid() {
		return "toast/grid/demoToastgrid";
	}
	
}
