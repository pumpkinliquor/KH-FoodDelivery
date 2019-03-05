package com.kh.food.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.food.admin.model.service.AppStoreService;
import com.kh.food.owner.store.model.vo.Store;


@Controller
public class AppStoreController {

	@Autowired
	AppStoreService service;

	@RequestMapping("/admin/appStoreList.do")
	public ModelAndView appStoreList() {
		ModelAndView mv = new ModelAndView();
		
		List<Store> appStoreList = service.appStoreList();
		
		mv.addObject("appStoreList", appStoreList);
		mv.setViewName("admin/appStoreList");		
		return mv;
	}
}
