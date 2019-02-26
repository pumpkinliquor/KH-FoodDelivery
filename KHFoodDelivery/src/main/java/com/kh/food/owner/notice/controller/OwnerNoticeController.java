package com.kh.food.owner.notice.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class OwnerNoticeController {

//	@Autowired
//	OwnerNoticeService service;
	
	@RequestMapping("/owner/noticeList.do")
	public ModelAndView noticeList(ModelAndView mv) {
		mv.setViewName("owner/noticeList");
		return mv;
	}
}
