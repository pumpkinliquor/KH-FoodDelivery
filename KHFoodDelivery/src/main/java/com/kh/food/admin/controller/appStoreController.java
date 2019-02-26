package com.kh.food.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class appStoreController {

	@RequestMapping("/admin/appStoreList.do")
	public String appStoreList() {
		return "admin/appStoreList";
	}
	
	@RequestMapping("/admin/appStoreView.do")
	public ModelAndView appStoreView() {
		ModelAndView mv = new ModelAndView();
		
		return mv;
	}
}
