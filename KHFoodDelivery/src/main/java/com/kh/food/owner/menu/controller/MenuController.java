package com.kh.food.owner.menu.controller;

import java.util.HashMap;
import java.util.List;
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
	public ModelAndView menuEnroll()
	{
		ModelAndView mv = new ModelAndView();
		List<Map<String,String>> category = service.selectMenuCategory();		
		mv.addObject("category",category);
		mv.setViewName("owner/menuEnroll");
		return mv;
	}
	
	@RequestMapping("/owner/menuManage.do")
	public ModelAndView menuManage()
	{
		ModelAndView mv = new ModelAndView();
		List<Map<String,String>> category = service.selectMenuCategory();
		List<Map<String,String>> menuList = service.selectMenuList();
		logger.debug("카테고리리스트"+category);
		logger.debug("메뉴리스트"+menuList);
		mv.addObject("menuList",menuList);
		mv.addObject("category",category);
		mv.setViewName("owner/menuManage");
		return mv;
		
	}
	
	@RequestMapping("/owner/menuSoldOut.do")
	public String menuSoldOut()
	{
		return "owner/menuSoldOut";
	}
	
	@RequestMapping("/owner/enrollCategory.do")
	public ModelAndView enrollCategory(String menuCategory)
	{
		/*logger.debug("메뉴카테고리"+menuCategory);*/
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
		logger.debug("메뉴등록" + m);
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
	
	//카테고리삭제
	@RequestMapping("/menu/deleteCategory.do")
	public ModelAndView deleteCategory(String menuCategory)
	{	
		logger.debug("카테고리삭제");
		logger.debug("메뉴카테고리명"+menuCategory);
		ModelAndView mv = new ModelAndView();
		String msg ="";
		String loc = "/owner/menuManage.do";
		
		int result = service.deleteCategory(menuCategory);
		if(result>0)
		{
			msg = " 삭제성공";
		}
		else
		{
			msg = "삭제 실패";
		}
		
		mv.addObject("msg",msg);
		mv.addObject("loc",loc);
		mv.setViewName("common/msg");
		return mv;
		
	}
	
}
