package com.kh.food.owner.review.controller;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.food.owner.review.model.service.OrderReviewService;
import com.kh.food.owner.review.model.vo.OwnerReview;
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
	@ResponseBody
	public void test(HttpServletRequest request, HttpServletResponse response, ModelAndView mv , int stN ) throws IOException, Exception
	{
		System.out.println(stN);
		
//		
//		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		
		List<Map<String, String>> rv = service.selectReviewList(stN);
//		for(Map<String, String> r : rv) {
//			System.out.println(r);
//		}
		
		
		for(int i=0; i<rv.size(); i++) {
			System.out.println(rv.get(i));
		}
		
		try {	
		List<OwnerReview> or = service.selectOwnerRevie(stN);
		System.out.println("or : " + or);
		request.setAttribute("orr", or);
		}
		catch(NullPointerException e)
		{
			e.printStackTrace();
		}
		
		request.setAttribute("rv", rv);
		request.getRequestDispatcher("/WEB-INF/views/owner/test.jsp").forward(request, response);
	}
	
	@RequestMapping("/owner/insertReviewRe.do")
	public ModelAndView insertReviewRe(ModelAndView mv , @RequestParam("context") String context,
															@RequestParam("qnaNo") int no,
															@RequestParam("qnaCode") int code,
															@RequestParam("ownerId") String ownerId,
															HttpServletRequest request , HttpServletResponse response)
	{
		
		Map map=new HashMap();
		map.put("context", context);
		map.put("no", no);
		map.put("code", code);
		
		int result = service.insertReviewRe(map);
		
		
		mv.setViewName("redirect:/owner/ownerReview.do?ownerId="+ownerId);
		
		return mv;
	}
	
}
