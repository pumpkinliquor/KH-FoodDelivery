package com.kh.food.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class qnaController {

	@RequestMapping("/admin/qnaList.do")
	public String qnaList() {
		return "admin/qnaList";
	}
}
