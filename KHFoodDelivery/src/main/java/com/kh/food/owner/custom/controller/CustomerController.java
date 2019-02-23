package com.kh.food.owner.custom.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.food.owner.custom.model.service.CustomerService;

@Controller
public class CustomerController {

	@Autowired
	CustomerService service;

	@RequestMapping("/owner/customService.do")
	public String customerService() {
		return "owner/CustomerService";
	}
	
}
