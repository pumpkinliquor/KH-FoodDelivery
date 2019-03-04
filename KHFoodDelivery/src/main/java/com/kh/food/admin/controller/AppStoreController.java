package com.kh.food.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AppStoreController {

	@RequestMapping("/admin/appStoreList.do")
	public ModelAndView appStoreList() {
		ModelAndView mv = new ModelAndView();
		
		
		
		mv.setViewName("admin/appStoreList");		
		return mv;
	}
}
