package com.kh.food.admin.notice.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.food.admin.notice.model.service.NoticeService;

@Controller
public class NoticeController {

	
	@Autowired
	NoticeService service;
	
	
	  @RequestMapping("/admin/memberNoticeList.do") 
	  public String memberNoticeList() { 
		  return "admin/memberNoticeList"; 
		  }
	 
	
	@RequestMapping("/admin/ownerNoticeList.do")
	public String ownerNoticeList() {
		return "admin/ownerNoticeList";
	}
	
	@RequestMapping("/admin/noticeForm.do")
	public String noticeInsert() {
		return "admin/noticeForm";
	}
	
	/*
	 * @RequestMapping("/admin/memberList.do") public String memberList() { return
	 * "admin/memberList"; }
	 */
	
	@RequestMapping("/admin/noticeView.do")
	public String noticeView() {
		return "admin/noticeView";
	}
	
	@RequestMapping("admin/noticeUpdateForm.do")
	public String noticeUpdateForm() {
		return "admin/noticeUpdateForm";
	}
	
}
