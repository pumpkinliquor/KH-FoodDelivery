package com.kh.food.owner.custom.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.food.owner.custom.model.service.CustomerService;

@Controller
public class CustomerController {

	@Autowired
	CustomerService service;

	@RequestMapping("/owner/customService.do")
	public ModelAndView customerService(ModelAndView mv) {
		
		List<Map<String,String>> selectQnaList=service.selectQnaList();
		List<Map<String,String>> selectNoticeList=service.selectNoticeList();
		mv.addObject("selectQnaList", selectQnaList);
		mv.addObject("selectNoticeList", selectNoticeList);
		mv.setViewName("owner/customerService");
		
		return mv;
	}
	
}
