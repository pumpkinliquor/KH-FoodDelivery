package com.kh.food.owner.review.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.food.owner.review.model.service.OrderReviewService;
import com.kh.food.owner.store.model.vo.Store;
import com.kh.food.review.model.vo.Review;

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
	@ResponseBody
	public void test(HttpServletRequest request, HttpServletResponse response, ModelAndView mv , String stN) throws IOException, Exception
	{
		System.out.println(stN);
		List<Map<String, String>> rv = service.selectReviewList(stN);
//		for(Map<String, String> r : rv) {
//			System.out.println(r);
//		}
		for(int i=0; i<rv.size(); i++) {
			System.out.println(rv.get(i));
		}
		
		request.setAttribute("rv", rv);
		request.getRequestDispatcher("/WEB-INF/views/owner/test.jsp").forward(request, response);
	}
	
	
}
