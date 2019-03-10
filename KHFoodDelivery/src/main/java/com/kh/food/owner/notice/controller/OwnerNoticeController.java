package com.kh.food.owner.notice.controller;

import java.util.List;
import java.util.Map;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.food.owner.notice.model.service.OwnerNoticeService;


@Controller
public class OwnerNoticeController {
	

	@Autowired
	OwnerNoticeService service;
	
	//사장 공지사항 리스트
	@RequestMapping("/owner/ownerNoticeList.do")
	public ModelAndView noticeList(ModelAndView mv) {
		
		List<Map<String, String>> list=service.ownerNoticeList();
		mv.addObject("list", list);	
		mv.setViewName("owner/ownerNoticeList");
		return mv;
	}
	
	//사장 공지사항 뷰
	@RequestMapping("/owner/ownerNoticeView.do")
	public ModelAndView noticeView(int ownerNoticeNum) {
		ModelAndView mv=new ModelAndView();
		Map<String,String> map=service.selectOwnerNotice(ownerNoticeNum);
		mv.addObject("notice",map);
		mv.setViewName("owner/ownerNoticeView");
		return mv;
	}
}
