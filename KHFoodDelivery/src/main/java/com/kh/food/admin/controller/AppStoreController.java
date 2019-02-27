package com.kh.food.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.food.admin.model.service.AppStoreService;

@Controller
public class AppStoreController {

	@Autowired
	AppStoreService service;
	
	@RequestMapping("/admin/appStoreList.do")
	public String appStoreList() {
		return "admin/appStoreList";
	}
	
	@RequestMapping("/admin/appStoreView.do")
	public ModelAndView appStoreView() {
		ModelAndView mv = new ModelAndView();
		
		return mv;
	}
	
	@RequestMapping("/admin/confirmApp.do")
	public ModelAndView updateStoreConfirm(@RequestParam("no") int no) {
		ModelAndView mv = new ModelAndView();
		
		int result = service.updateStoreConfirm(no);
		
		String msg = "";
		String loc = "redirect:/admin/appStoreList.do";
		
		if(result > 0)	msg = "입점이 승인되었습니다!";
		else			msg = "입점 실패...";
		
		mv.addObject("msg", msg);
		mv.addObject("loc", loc);
		mv.setViewName("common/msg");
		return mv;
	}
}
