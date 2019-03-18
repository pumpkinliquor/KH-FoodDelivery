package com.kh.food.owner.controller;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.food.owner.notice.model.service.OwnerNoticeService;

@Controller
public class OwnerContoller {
	@Autowired
	OwnerNoticeService service;
	private Logger logger = LoggerFactory.getLogger(OwnerContoller.class);
	
	//사장님 사이트 메인화면 진입
	@RequestMapping("/owner/ownerMain.do")
	public ModelAndView ownerMain()
	{
		ModelAndView mv= new ModelAndView();
		List<Map<String,String>> list=service.ownerNoticeList();
		
		mv.addObject("list",list);
		mv.setViewName("owner/ownerMain");
		return mv;
	}
	
	@RequestMapping("/owner/insertOwner.do")
	public String insertOwner()
	{
		return "owner/ownerEnroll";
	}
	
	@RequestMapping("/owner/login.do")
	public String ownerLogin()
	{
		return "owner/ownerlogin";
	}
	
	@RequestMapping("/owner/ownerIdSearch.do")
	public String ownerSearchId() 
	{
		return "owner/ownerIdSearch";
	}

}
