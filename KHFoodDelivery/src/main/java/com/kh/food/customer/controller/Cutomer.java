package com.kh.food.customer.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Cutomer {
	
	
	@RequestMapping("/cutomer/main.do")
	public String MainView() {
		return "customer/main";
	}
	
	@RequestMapping("/customer/login.do")
	public String login()
	{
		return "customer/login";
	}
	
	@RequestMapping("/map/test.do")
	public String map()
	{
		return "customer/test";
	}

}
