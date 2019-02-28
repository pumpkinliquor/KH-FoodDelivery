package com.kh.food.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AppStoreController {

	@RequestMapping("/admin/appStoreList.do")
	public String appStoreList() {
		return "admin/appStoreList";
	}
}
