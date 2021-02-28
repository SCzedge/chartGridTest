package com.toroRosso.data;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class DataController {
@Autowired DataService dataService;
	
	public void data() {
		
	}
}
