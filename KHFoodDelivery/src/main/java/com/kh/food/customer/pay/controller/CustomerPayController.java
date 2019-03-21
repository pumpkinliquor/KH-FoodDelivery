package com.kh.food.customer.pay.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.food.customer.member.model.vo.WishList;
import com.kh.food.customer.pay.service.CustomerPayService;
import com.kh.food.owner.menu.model.vo.Menu;

@Controller
  public class CustomerPayController {

	private Logger logger = LoggerFactory.getLogger(CustomerPayController.class);
	
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
//    	 System.out.println(payWishList.get(i));
     }
     
     mv.addObject("businessCode", businessCode);
     mv.addObject("payWishList", payWishList);
     mv.addObject("payReady",payReady);
     mv.setViewName("/customer/pay");
     return mv;
  }
  
  
  
  
  @RequestMapping("/customer/payEnd.do") 
  public ModelAndView customerPayEnd(int resultPrice, int businessCode, String payRequest, String payAddress,String memberId) 
  {
	  
	System.out.println("비즈니스"+businessCode+"콘텍스트"+payRequest+"주소 : "+payAddress+"가격  : " +resultPrice + "아이디" + memberId);
	ModelAndView mv=new ModelAndView();
	
	List<Map<String,String>> wishList = service.selectWishList(memberId);
	Map<String,String> map = new HashMap<>();
	for(int i=0; i<wishList.size(); i++)
	{
		map.put("businessCode", String.valueOf(businessCode));
		map.put("menuCode", String.valueOf(wishList.get(i).get("MENUCODE")));
		map.put("price",String.valueOf(wishList.get(i).get("PLUSMENUPRICE")));
		map.put("count", String.valueOf(wishList.get(i).get("MENUCOUNT")));
		map.put("memberNum", String.valueOf(wishList.get(i).get("MEMBERNUM")));
		map.put("payRequest", payRequest);
		map.put("payAddress", payAddress);
		logger.debug("mapmap"+map);
		if(i==0)
		{
			int result = service.insertPay(map);
			if(result>0)
			{
				logger.debug("처음꺼성공");
			}
			else
			{
				logger.debug("처음꺼실패");
			}
		}
		else
		{		
			int result1 = service.insertPay2(map);
			if(result1>0)
			{
				logger.debug("나머지성공");
			}
			else
			{
				logger.debug("나머지실패");
			}
		}
	}
	logger.debug("wishList"+wishList);
	//	System.out.println("아이디 : "+memberId);

	
	return mv; 
  } 
  
  }
 