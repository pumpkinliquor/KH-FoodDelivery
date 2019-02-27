package com.kh.food.owner.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class OwnerContoller {

	@RequestMapping("/owner/ownerMain.do")
	public String ownerMain()
	{
		
		return "owner/ownerMain";
	}
	
	@RequestMapping("/owner/insertOwner.do")
	public String insertOwner()
	{
		return "owner/ownerEnroll";
	}
}
