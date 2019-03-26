package com.kh.food.customer.pay.controller;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
  public ModelAndView customerPay(HttpServletRequest request, String businessCode, HttpSession session) 
  { 
     String memberId=(String) request.getSession().getAttribute("logined");
     Map<String,String> setPay=new HashMap();
     setPay.put("businessCode",businessCode);
     setPay.put("memberId",memberId);
     ModelAndView mv= new ModelAndView();
     
     Map<String,String> payReady=service.customerPayService(setPay);
     
     List<Map<String,String>> payWishList=service.payWishList(setPay);
     
	String lat = (String)session.getAttribute("lat");
	String lng = (String)session.getAttribute("lng");
	BigDecimal lat1 = new BigDecimal(lat);
	BigDecimal lng1 = new BigDecimal(lng);
	
	Map<String,Object> delMap = new HashMap();
	delMap.put("lat", lat1);
	delMap.put("lng", lng1);
	delMap.put("businessCode", businessCode);
	int delivery = service.selectDistance(delMap);
     
     mv.addObject("businessCode", businessCode);
     mv.addObject("payWishList", payWishList);
     mv.addObject("delivery", delivery);
     mv.addObject("payReady",payReady);
     mv.setViewName("/customer/pay");
     return mv;
  }
  
  
  
  
  @RequestMapping("/customer/payEnd.do") 
  public ModelAndView customerPayEnd(int resultPrice, int businessCode, String payRequest, String payAddress,String memberId,String impUid,String deliveryPay) 
  {
	ModelAndView mv=new ModelAndView();
	
	List<Map<String,String>> wishList = service.selectWishList(memberId);
	Map<String,String> map = new HashMap<>();
	List<Map<String,String>> payList = new ArrayList<>();
	for(int i=0; i<wishList.size(); i++)
	{
		logger.debug("i"+i);
		map.put("businessCode", String.valueOf(businessCode));
		map.put("menuCode", String.valueOf(wishList.get(i).get("MENUCODE")));
		map.put("price",String.valueOf(wishList.get(i).get("PLUSMENUPRICE")));
		map.put("count", String.valueOf(wishList.get(i).get("MENUCOUNT")));
		map.put("memberNum", String.valueOf(wishList.get(i).get("MEMBERNUM")));
		map.put("payRequest", payRequest);
		map.put("payAddress", payAddress);
		map.put("impUid", impUid);
		map.put("deliveryPay", deliveryPay);
		logger.debug("impUid"+impUid);
		logger.debug("mapmap"+map);
		logger.debug("wishList"+wishList);
		if(i==0)
		{
			int result = service.insertPay(map);
			int update=service.menuSoldCount(map);
			Map<String,String> pay = service.selectOnePay(memberId);
			logger.debug("pay"+pay);
			payList.add(pay);
			if(result>0)
			{
				logger.debug("처음꺼성공");
				if(wishList.size()==1)
				{
					int result2=service.deleteWishList(memberId);
				}
			}
			else
			{
				logger.debug("처음꺼실패");
			}
		}
		else
		{		
			int result1 = service.insertPay2(map);
			int update=service.menuSoldCount(map);
			Map<String,String> pay = service.selectOnePay(memberId);
			logger.debug("pay"+pay);
			payList.add(pay);
			if(wishList.size()!=1)
			{
				int result2=service.deleteWishList(memberId);
			}
			
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
	logger.debug("payList"+payList);
	logger.debug("wishList"+wishList);
	//	System.out.println("아이디 : "+memberId);
	
	
	mv.addObject("deliveryPay",deliveryPay);
	mv.addObject("wishList",wishList);
	mv.addObject("payList",payList);
	mv.setViewName("customer/payEnd");
	return mv;
  } 
}
 