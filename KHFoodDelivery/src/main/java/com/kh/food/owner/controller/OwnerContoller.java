package com.kh.food.owner.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.food.owner.notice.model.service.OwnerNoticeService;
import com.kh.food.owner.store.model.vo.Store;

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
	
	@RequestMapping("/owner/memberMain.do")
	public ModelAndView memberMain()
	{
		ModelAndView mv= new ModelAndView();
		mv.setViewName("customer/memberMain");
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
	
	@RequestMapping("/owner/homePage.do")
	@ResponseBody
	public Map homePageCount(ModelAndView mv){
		
		int memberCount=service.memberCount();
		int ownerCount=service.ownerCount();
		int todayPayCount=service.todayPayCount();
		
		Map<String,Object> mm=new HashMap<String, Object>();
		mm.put("todayPayCount", todayPayCount);
		mm.put("memberCount", memberCount);
		mm.put("ownerCount", ownerCount);
		
		return mm;
	}

}
