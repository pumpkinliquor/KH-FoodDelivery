package com.kh.food.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller	
public class QnaMngController {

	// 회원 문의 내역 리스트
	@RequestMapping("/admin/memberQnaList.do")
	public String memberQnaList() {
		return "admin/memberQnaList";
	}
	
	// 사장님 문의 내역 리스트
	@RequestMapping("/admin/ownerQnaList.do")
	public String ownerQnaList() {
		return "admin/ownerQnaList";
	}
	
	// 회원 문의 보기
	@RequestMapping("/admin/memberQnaView.do")
	public String memberQnaView() {
		return "admin/memberQnaView";
	}
}
