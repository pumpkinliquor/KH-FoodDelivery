package com.kh.food.customer.pay.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.food.customer.pay.service.CustomerPayService;

@Controller
public class CustomerPay {

	
	 @Autowired CustomerPayService service;
	 
	
	/*
	 * @RequestMapping("/customer/pay.do") public ModelAndView customerPay(int
	 * totalPrice, String title) { ModelAndView mv= new ModelAndView();
	 * Map<String,String> map=service.pay(); mv.addObject("totalPrice",totalPrice);
	 * mv.addObject("title",title); mv.setViewName("/customer/payEnd");
	 * 
	 * return mv; }
	 */
	
	@RequestMapping("/customer/payEnd.do")
	public String customerPayEnd() {
		return "customer/payEnd";
	}
}
