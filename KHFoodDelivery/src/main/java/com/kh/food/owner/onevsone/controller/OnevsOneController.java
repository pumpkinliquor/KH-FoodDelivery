package com.kh.food.owner.onevsone.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.food.owner.onevsone.model.service.OnevsOneService;

@Controller
public class OnevsOneController {

	@Autowired
	OnevsOneService service;
	
	@RequestMapping("/owner/oneVSoneList.do")
	public ModelAndView oneVSoneList(ModelAndView mv) {
		
		List<Map<String,String>> oneVSoneList=service.oneVSoneList();
		
		mv.addObject("oneVSoneList", oneVSoneList);
		mv.setViewName("owner/oneVSoneList");
		return mv;
	}
	
	@RequestMapping("/owner/oneVSoneQ.do")
	public String oneVSoneQ() {
		return "owner/oneVSoneForm";
	}
	
	@RequestMapping("/owner/myOneVSone")
	public ModelAndView myOneVSone(ModelAndView mv) {
		mv.setViewName("owner/myQna");
		return mv;
	}
	
	@RequestMapping("/owner/oneVSoneView.do")
	public ModelAndView oneVSoneView(ModelAndView mv) {
		mv.setViewName("owner/oneVSoneView");
		return mv;
	}
	
}
