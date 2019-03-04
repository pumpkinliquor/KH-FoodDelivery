package com.kh.food.admin.notice.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.food.admin.notice.model.service.NoticeService;

@Controller
public class NoticeController {

	
	@Autowired
	NoticeService service;
	
	//회원리스트
	@RequestMapping("/admin/memberNoticeList.do")
	public ModelAndView memberNoticeList()
	{
		ModelAndView mv=new ModelAndView();
		List<Map<String,String>>list=service.selectMemberNoticeList();
		mv.addObject("list",list);
		mv.setViewName("admin/memberNoticeList");
		return mv;
	}
	
	@RequestMapping("/admin/ownerNoticeList.do")
	public String ownerNoticeList() {
		return "admin/ownerNoticeList";
	}
	
	@RequestMapping("/admin/noticeForm.do")
	public String noticeInsert() {
		return "admin/noticeForm";
	}
	
	//회원공지사항 뷰
	@RequestMapping("/admin/noticeView.do")
	public ModelAndView noticeView(int noticeNum) {
		ModelAndView mv=new ModelAndView();
		Map<String,String> map=service.selectMemberNotice(noticeNum);
		mv.addObject("notice",map);
		System.out.println(map +"맵");
		mv.setViewName("notice/noticeView");
		return mv;
	}
	
	@RequestMapping("admin/noticeUpdateForm.do")
	public String noticeUpdateForm() {
		
		return "admin/noticeUpdateForm";
	}
	
}
