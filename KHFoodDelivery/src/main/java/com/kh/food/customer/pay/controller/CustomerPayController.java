package com.kh.food.customer.pay.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

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
  public ModelAndView customerPay(HttpServletRequest request, String businessCode) 
  { 
     String memberId=(String) request.getSession().getAttribute("logined");
     Map setPay=new HashMap();
     setPay.put("businessCode",businessCode);
     setPay.put("memberId",memberId);
     ModelAndView mv= new ModelAndView();
     Map payReady=service.customerPayService(setPay);
     System.out.println(businessCode + "코코ㅗ코");
     mv.addObject("payReady",payReady);
     mv.setViewName("/customer/pay");
     return mv;
  }
  
  
  
  
  @RequestMapping("/customer/payEnd.do") 
  public String customerPayEnd() 
  {
  return "customer/payEnd"; } 
  
  }
 