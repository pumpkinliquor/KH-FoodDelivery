package com.kh.food.customer.pay.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.food.customer.member.model.vo.WishList;
import com.kh.food.customer.pay.service.CustomerPayService;
import com.kh.food.owner.menu.model.vo.Menu;

@Controller
  public class CustomerPayController {

   @Autowired
   CustomerPayService service;
  @RequestMapping("/customer/pay.do")
  public ModelAndView customerPay(HttpServletRequest request, String businessCode) 
  { 
     String memberId=(String) request.getSession().getAttribute("logined");
     Map<String,String> setPay=new HashMap();
     setPay.put("businessCode",businessCode);
     setPay.put("memberId",memberId);
     ModelAndView mv= new ModelAndView();
     
     Map<String,String> payReady=service.customerPayService(setPay);
     
     List<Map<String,String>> payWishList=service.payWishList(setPay);
     
     
     for(int i=0; i<payWishList.size(); i++) {
    	 System.out.println(payWishList.get(i));
     }
     
     mv.addObject("businessCode", businessCode);
     mv.addObject("payWishList", payWishList);
     mv.addObject("payReady",payReady);
     mv.setViewName("/customer/pay");
     return mv;
  }
  
  
  
  
  @RequestMapping("/customer/payEnd.do") 
  public String customerPayEnd() 
  {
  return "customer/payEnd"; } 
  
  }
 