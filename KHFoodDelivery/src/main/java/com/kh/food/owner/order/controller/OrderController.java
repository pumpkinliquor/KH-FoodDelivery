package com.kh.food.owner.order.controller;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.food.owner.order.model.service.OrderService;

@Controller
public class OrderController {

	private Logger logger = LoggerFactory.getLogger(OrderController.class);
	
	@Autowired
	OrderService service;
	
	@RequestMapping
	public ModelAndView selectOrderList()
	{
		List<Map<String,String>> orderList = service.selectOrderList();
		
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("owner/ownerOrderList");
		return mv;
			
	}
	
}
