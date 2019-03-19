package com.kh.food.customer.pay.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.food.customer.pay.service.CustomerPayService;

@Controller
  public class CustomerPayController {

	@Autowired
	CustomerPayService service;
  @RequestMapping("/customer/pay.do")
  public ModelAndView customerPay(String memberId) 
  { 
	  ModelAndView mv= new ModelAndView();
	  int payReady=service.customerPayService(memberId);
	  mv.addObject("totalPrice",payReady);
	  mv.setViewName("/customer/pay");
	  return mv;
  }
  
  
  
  
  @RequestMapping("/customer/payEnd.do") 
  public String customerPayEnd() 
  {
  return "customer/payEnd"; } 
  
  }
 