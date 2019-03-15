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
		SimpleDateFormat df = new SimpleDateFormat("yyyyMMdd_HHmmssSSS");
		for(int i = 0; i < orderList.size(); i++) {
			orderList.get(i).setFormatDate(df.format(orderList.get(i).getPayDate()));
		}
		
		logger.debug("주문내역"+orderList);
/*		int orderCount = service.selectOrderCount();*/		
		ArrayList<Pay> list = new ArrayList<>();
		int payOrderNum = 0;
		int sum = 0;
		/*logger.debug("사이즈"+orderList.size());*/
		for(int i=0; i<orderList.size(); i++)
		{
			if(i<orderList.size()-1) {
				if(orderList.get(i).getPayOrderNum()==orderList.get(i+1).getPayOrderNum())
				{
					if(payOrderNum != orderList.get(i).getPayOrderNum()) {
					list.add(orderList.get(i));
					payOrderNum = orderList.get(i).getPayOrderNum();
					}
					
				}
				else
				{
					list.add(orderList.get(i));
					payOrderNum = orderList.get(i).getPayOrderNum();
				}
			}
			else
			{
				/*logger.debug("들어왔냐1");*/
				if(i!=0) {
					if(orderList.get(i).getPayOrderNum()!=orderList.get(i-1).getPayOrderNum())
					{
						/*logger.debug("들어왔냐");*/
						list.add(orderList.get(i));
					}
				}
				else
				{
					list.add(orderList.get(i));
				}
			}
		}
		
		ArrayList<Pay> price = new ArrayList<>();
		for(int i=0; i<list.size(); i++)
		{
			price.add(list.get(i));
		}
		
		/*for(int i=0; i<orderList.size(); i++)
		{
			for(int j=i; j<list.size(); j++)
			{
				if(orderList.get(i).getPayOrderNum() == list.get(j).getPayOrderNum())
				{
					sum = sum + orderList.get(i).getPrice();
				}
				else
				{
					list.get(i).setPrice(sum);
					sum = 0 ;
					i=j;
					break;
				}
			}
		}*/
		logger.debug("orderList"+orderList);
		logger.debug("list"+list);
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
		logger.debug("주문하나만내역"+list);
		logger.debug("오더리스트"+orderList);
		ModelAndView mv = new ModelAndView();
//		request.setAttribute("orderList1", orderList);
		mv.addObject("list",list);
		mv.addObject("orderList",orderList);
		mv.addObject("price",price);
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
