package com.kh.food.owner.review.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.food.owner.review.model.service.OrderReviewService;
import com.kh.food.owner.review.model.service.OrderReviewServiceImpl;
import com.kh.food.owner.store.model.vo.Store;

@Controller
public class OrderReviewController {
	
	@Autowired
	OrderReviewService service;
	

	@RequestMapping("/owner/ownerReview.do")
	public ModelAndView ownerReview(ModelAndView mv,String ownerId)
	{
		
		List<Map<String, String>> storeList = service.selectStoreList(ownerId);
		List<Store> selectStoreList=service.storeList(ownerId);
		
		mv.addObject("selectStoreList",selectStoreList);
		mv.addObject("storeList",storeList);
		mv.setViewName("owner/ownerReview");
		return mv;
	}
	@RequestMapping("/owner/test.do")
	public ModelAndView test(ModelAndView mv)
	{
		mv.setViewName("owner/test");
		return mv;
	}
	
}
