package com.kh.food.owner.menu.controller;

import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.food.owner.menu.model.service.MenuService;
import com.kh.food.owner.menu.model.vo.Menu;

@Controller
public class MenuController {

	private Logger logger = LoggerFactory.getLogger(MenuController.class);
	@Autowired
	MenuService service;
	
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
	
	@RequestMapping("/owner/enrollCategory.do")
	public ModelAndView enrollCategory(String menuCategory)
	{
		logger.debug("메뉴카테고리"+menuCategory);
		Map<String,String> map = new HashMap();
		map.put("menuCategory", menuCategory);
		ModelAndView mv = new ModelAndView();
		int result = service.enrollCategory(map);
		String msg = "";
		String loc = "/owner/menuEnroll.do";
		if(result > 0)
		{
			msg = "카테고리 등록 성공!";
		}
		else
		{
			msg = "카테고리 등록 실패!";
		}
		mv.addObject("msg",msg);
		mv.addObject("loc",loc);
		mv.setViewName("common/msg");
		return mv;
		
	}
	
	@RequestMapping("/owner/enrollMenu.do")
	public ModelAndView insertMenu(Menu m)
	{
		ModelAndView mv = new ModelAndView();
		String msg="";
		String loc="/owner/menuEnroll.do";
		
		int result = service.insertMenu(m);
		if(result > 0)
		{
			msg = "메뉴 등록 성공!";
		}
		else
		{
			msg = "메뉴 등록 실패!";
		}
		
		logger.debug("메뉴"+m);
		
		mv.addObject("msg",msg);
		mv.addObject("loc",loc);
		mv.setViewName("common/msg");
		return mv;
	}
}
