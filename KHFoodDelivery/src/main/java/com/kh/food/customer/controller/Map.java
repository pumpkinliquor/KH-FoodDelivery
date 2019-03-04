package com.kh.food.customer.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.food.customer.member.model.vo.Member;

@Controller
public class Map {
	

	
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
