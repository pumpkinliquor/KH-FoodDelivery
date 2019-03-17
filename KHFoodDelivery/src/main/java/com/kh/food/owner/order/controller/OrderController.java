package com.kh.food.owner.order.controller;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.util.ListIterator;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.food.common.PagingFactory;
import com.kh.food.owner.order.model.service.OrderService;
import com.kh.food.owner.order.model.vo.Pay;

@Controller
public class OrderController {

	private Logger logger = LoggerFactory.getLogger(OrderController.class);
	
	@Autowired
	OrderService service;
	
	//주문관리 화면진입
	@RequestMapping("owner/orderService.do")
	public ModelAndView selectOrderList(@RequestParam(value="cPage",required=false,defaultValue="0") int cPage) throws ServletException, IOException
	{
		int numPerPage = 5;
//		List<Map<String,String>> orderList = service.selectOrderList();
		List<Pay> orderList = service.selectOrderList();
		List<Pay> orderOneList = service.selectOrderOneList(cPage,numPerPage);
		Map<String,String> todayOrderCount = service.selectTodayOrderCount();
		
		int orderCount = service.selectOrderCount();
/*		SimpleDateFormat df = new SimpleDateFormat("yyyyMMdd_HHmmss");
		for(int i = 0; i < orderOneList.size(); i++) {
			orderOneList.get(i).setFormatDate(df.format(orderOneList.get(i).getPayDate()));
		}*/
		
		logger.debug("오늘날짜주문개수"+todayOrderCount);
		logger.debug("주문하나내역"+orderOneList);
		logger.debug("주문내역"+orderList);
		ArrayList<Pay> list = new ArrayList<>();
		int sum = 0;
		/*logger.debug("사이즈"+orderList.size());*/
		
		ArrayList<Pay> price = new ArrayList<>();
		for(int i=0; i<orderOneList.size(); i++)
		{
			price.add(orderOneList.get(i));
		}
		
		logger.debug("orderList"+orderList);
		logger.debug("orderOneList"+orderOneList);
		logger.debug("price"+price);
		logger.debug("price사이즈"+price.size());
		int count = 0;
		for(int i=0; i<price.size(); i++)
		{
			for(int j=count; j<orderList.size(); j++)
			{
				if(orderList.get(j).getPayOrderNum() == price.get(i).getPayOrderNum())
				{
					logger.debug("합계전"+sum);
					logger.debug("오더리스트가격"+orderList.get(j).getPrice()+"IIII"+i);
					sum = sum + orderList.get(j).getPrice();
					price.get(i).setPrice(sum);
					logger.debug("합계후"+sum);
				}
				else
				{
					logger.debug("else문"+i+":::"+j);
					logger.debug("가격"+price.get(i).getPrice());
					sum = 0 ;
					count = j;
					break;
				}
			}
		}
		logger.debug("가격내역"+price);
		logger.debug("오더리스트"+orderList);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("todayOrderCount",todayOrderCount);
		mv.addObject("orderOneList",orderOneList);
		mv.addObject("orderList",orderList);
		mv.addObject("price",price);
		mv.setViewName("owner/ownerOrderList");
		mv.addObject("pageBar",PagingFactory.getPageBar(orderCount, cPage, numPerPage, "/food/owner/orderService.do"));
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
