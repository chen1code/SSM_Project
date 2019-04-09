package com.erp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MapController {
	

	@RequestMapping(value="/mapCheck",method = RequestMethod.GET)
    public String mapCheck() {
    	return "mapCheck";
    }
	
	
	@RequestMapping(value="/game",method = RequestMethod.GET)
    public String game() {
    	return "game";
    }
	
}
