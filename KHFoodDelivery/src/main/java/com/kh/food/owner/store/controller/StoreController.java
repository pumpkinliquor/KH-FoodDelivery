package com.kh.food.owner.store.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.food.owner.custom.model.service.CustomerService;

@Controller
public class StoreController {

	@Autowired
	CustomerService service;

	@RequestMapping("/owner/storeForm.do")
	public String storeForm() {
		return "owner/storeForm";
	}
	
}
