package com.kh.food.admin.notice.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.food.admin.notice.model.service.NoticeService;

@Controller
public class NoticeController {

	
	@Autowired
	NoticeService service;
	
	@RequestMapping("/admin/noticeList.do")
	public String noticeService() {
		return "admin/noticeList";
	}
	
	@RequestMapping("/admin/noticeForm.do")
	public String noticeInsert() {
		return "admin/noticeForm";
	}
	
	@RequestMapping("/admin/memberList.do")
	public String memberList() {
		return "admin/memberList";
	}
	
	
	@RequestMapping("/common/footer.do")
	public String fooer() {
		return "common/footer";
	}
}
