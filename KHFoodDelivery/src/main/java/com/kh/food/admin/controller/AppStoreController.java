package com.kh.food.admin.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.food.admin.model.service.AppStoreService;
import com.kh.food.owner.store.model.vo.Store;


@Controller
public class AppStoreController {

	@Autowired
	AppStoreService service;

	@RequestMapping("/admin/appStoreList.do")
	public ModelAndView appStoreList(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		
		List<Store> appStoreList = service.selectAppStoreList();
		
		// 입점 신청 날짜 포맷 (패턴 : yyyy-MM-dd)
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		for(int i = 0; i < appStoreList.size(); i++) {
			appStoreList.get(i).setFormatAppDate(df.format(appStoreList.get(i).getAppDate()));
		}
		
		mv.addObject("appStoreList", appStoreList);
		mv.setViewName("admin/appStoreList");		
		return mv;
		
	}
	
	@RequestMapping("/admin/selectAppStore.do")
	@ResponseBody
	public Store selectAppStore(@RequestParam("no") int no) {		
		Store store = service.selectAppStore(no);
		// 입점 신청 날짜 포맷 (패턴 : yyyy-MM-dd)
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");		
		store.setFormatAppDate(df.format(store.getAppDate()));
			
		return store;
	}
}