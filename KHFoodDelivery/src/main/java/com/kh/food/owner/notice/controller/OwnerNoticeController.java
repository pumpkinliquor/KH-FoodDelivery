package com.kh.food.owner.notice.controller;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.food.owner.notice.model.service.OwnerNoticeService;


@Controller
public class OwnerNoticeController {
	private Logger logger=Logger.getLogger(OwnerNoticeController.class);

	@Autowired
	OwnerNoticeService service;
	
	@RequestMapping("/owner/noticeList.do")
	public ModelAndView noticeList(ModelAndView mv) {
		
		List<Map<String, String>> ownerNoticeList=service.ownerNoticeList();
		
//		System.out.println(ownerNoticeList);
		
		mv.addObject("ownerNoticeList", ownerNoticeList);
		
		mv.setViewName("owner/noticeList");
		return mv;
	}
}
