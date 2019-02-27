package com.kh.food.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class qnaController {

	@RequestMapping("/admin/memberQnaList.do")
	public String memberQnaList() {
		return "admin/memberQnaList";
	}
	
	@RequestMapping("/admin/ownerQnaList.do")
	public String ownerQnaList() {
		return "admin/ownerQnaList";
	}
}
