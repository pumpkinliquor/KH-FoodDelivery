package com.kh.food.owner.menu.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MenuController {

	@RequestMapping("/owner/menuEnroll.do")
	public String menuEnroll()
	{
		return "owner/menuEnroll";
	}
	
	@RequestMapping("/owner/menuManage.do")
	public String menuManage()
	{
		return "owner/menuManage";
	}
	
	@RequestMapping("/owner/menuSoldOut.do")
	public String menuSoldOut()
	{
		return "owner/menuSoldOut";
	}
	
}
