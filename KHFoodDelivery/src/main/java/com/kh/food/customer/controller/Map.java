package com.kh.food.customer.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Map {
	
	
	@RequestMapping("/map/test.do")
	public String admainMainView() {
		return "customer/main";
	}
	
	@RequestMapping("/customer/login.do")
	public String login()
	{
		return "customer/login";
	}

}
