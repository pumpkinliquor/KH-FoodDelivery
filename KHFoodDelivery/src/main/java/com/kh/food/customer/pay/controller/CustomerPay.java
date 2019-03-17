package com.kh.food.customer.pay.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CustomerPay {

	/*
	 * @Autowired CustomerPayService service;
	 */
	
	@RequestMapping("/customer/pay.do")
	public String customerPay() {
		return "customer/pay";
	}
}
