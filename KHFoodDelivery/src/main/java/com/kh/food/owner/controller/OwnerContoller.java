package com.kh.food.owner.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class OwnerContoller {

	private Logger logger = LoggerFactory.getLogger(OwnerContoller.class);
	
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
	
	@RequestMapping("/owner/login.do")
	public String ownerLogin()
	{
		logger.debug("로그인들어왔니?");
		return "owner/ownerlogin";
	}
}
