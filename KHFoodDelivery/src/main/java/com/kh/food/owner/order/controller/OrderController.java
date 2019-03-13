package com.kh.food.owner.order.controller;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.food.owner.order.model.service.OrderService;

@Controller
public class OrderController {

	private Logger logger = LoggerFactory.getLogger(OrderController.class);
	
	@Autowired
	OrderService service;
	
	//주문관리 화면진입
	@RequestMapping("owner/orderService.do")
	public ModelAndView selectOrderList()
	{
		List<Map<String,String>> orderList = service.selectOrderList();
		logger.debug("주문내역"+orderList);
/*		int orderCount = service.selectOrderCount();*/		
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("orderList",orderList);
		mv.setViewName("owner/ownerOrderList");
		return mv;
			
	}
	
	// payordernum 번호로 주문리스트 가져오기
	@RequestMapping("owner/selectPayOrderNum.do")
	@ResponseBody
	public List selectPayOrderNum(String payOrderNum)
	{
		logger.debug("페이오더넘버"+payOrderNum);
		List list = service.selectPayOrderNum(payOrderNum);
		logger.debug("페이오더넘버리스트"+list);
		return list;
	}
	
}
