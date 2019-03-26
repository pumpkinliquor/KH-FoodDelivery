package com.kh.food.owner.sale.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import com.kh.food.owner.menu.model.service.MenuService;
import com.kh.food.owner.order.model.service.OrderService;
import com.kh.food.owner.order.model.vo.Pay;
import com.kh.food.owner.sale.model.service.OrderStoreSalesService;

@Controller
public class OrderStoreSalesController {

	private Logger logger = LoggerFactory.getLogger(OrderStoreSalesController.class);
	@Autowired
	OrderStoreSalesService service;
	@Autowired
	OrderService orderService;
	@Autowired
	MenuService menuService;
	
	//매출관리 가게선택화면 진입
	@RequestMapping("owner/salesStoreChoice.do")
	public ModelAndView salesStoreChoice(String ownerId)
	{
		List<Map<String,String>> storeList = orderService.selectStoreList(ownerId);
		ModelAndView mv = new ModelAndView();
		logger.debug("owerId"+ownerId);
		logger.debug("storeList"+storeList);
		mv.addObject("storeList",storeList);
		mv.setViewName("owner/saleStoreChoice");
		return mv;
	}
	
	// 매출 관리 화면 진입
	@RequestMapping("owner/selectStoreSales.do")
	public ModelAndView selectStoreSales(@RequestParam(value="cPage",required=false,defaultValue="0") int cPage,String businessCode)
	{
		int numPerPage = 10;
		int businessCode1 = Integer.valueOf(businessCode); 
		logger.debug("bucODE"+businessCode1);
		ModelAndView mv = new ModelAndView();
		
		List<Pay> orderOneList = service.selectOrderOneList(cPage,numPerPage,businessCode1);
		
		int orderCount = service.selectOrderCount(businessCode1);
		List<Map<String,String>> payList = orderService.selectPayList(cPage,numPerPage,businessCode1);
		logger.debug("orderOneList"+orderOneList);
		for(int i=0; i<orderOneList.size(); i++)
		{
			orderOneList.get(i).setPrice(Integer.parseInt(String.valueOf((payList.get(i).get("PRICE")))));
		}
		String todaySales = "";
		String monthSales ="";
		String yearSales = "";
		String weekSales = "";
		try {
			todaySales = service.selectTodaySales(businessCode);
			if(todaySales.equals(""))
			{
				todaySales = "0";
			}
		}
		catch(NullPointerException e)
		{
			todaySales = "0";
		}
		try {
			monthSales = service.selectMonthSales(businessCode);
			if(monthSales.equals(""))
			{
				todaySales = "0";
			}
		}catch(NullPointerException e)
		{
			monthSales = "0";
		}
		try {
			yearSales = service.selectYearSales(businessCode);
			if(yearSales.equals(""))
			{
				todaySales = "0";
			}
		}catch(NullPointerException e)
		{
			yearSales = "0";
		}
		try {
			weekSales = service.selectWeekSales(businessCode);
			if(weekSales.equals(""))
			{
				weekSales = "0";
			}
		}
		catch(NullPointerException e)
		{
			weekSales = "0";
		}
		logger.debug("today"+todaySales);
		logger.debug("monthSales"+monthSales);
		logger.debug("yearSales"+yearSales);
		
		mv.addObject("weekSales",weekSales);
		mv.addObject("monthSales",monthSales);
		mv.addObject("yearSales",yearSales);
		mv.addObject("todaySales",todaySales);
		mv.addObject("oderCount",orderCount);
		mv.addObject("businessCode",businessCode1);
		mv.addObject("orderOneList",orderOneList);
		mv.addObject("pageBar",PagingFactory.getPageBar4(orderCount, cPage, numPerPage, "/food/owner/selectStoreSales.do?businessCode="+businessCode1));
		mv.setViewName("owner/ownerSales");
		
		return mv;
	}
	
	// 기간별 매출 화면
	@RequestMapping("owner/selectStoreSalesEnd.do")
	public ModelAndView selectStoreSalesEnd(@RequestParam(value="cPage",required=false,defaultValue="0") int cPage,String businessCode,String payDate1,String payDate2)
	{
		logger.debug("payDate1"+payDate1+"payDate2"+payDate2);
		logger.debug("bucODE"+businessCode);
		int numPerPage = 5;
		
		String todaySales = "";
		String monthSales ="";
		String yearSales = "";
		String weekSales = "";
		try {
			todaySales = service.selectTodaySales(businessCode);
			if(todaySales.equals(""))
			{
				todaySales = "0";
			}
		}
		catch(NullPointerException e)
		{
			todaySales = "0";
		}
		try {
			monthSales = service.selectMonthSales(businessCode);
			if(monthSales.equals(""))
			{
				todaySales = "0";
			}
		}catch(NullPointerException e)
		{
			monthSales = "0";
		}
		try {
			yearSales = service.selectYearSales(businessCode);
			if(yearSales.equals(""))
			{
				todaySales = "0";
			}
		}catch(NullPointerException e)
		{
			yearSales = "0";
		}
		try {
			weekSales = service.selectWeekSales(businessCode);
			if(weekSales.equals(""))
			{
				weekSales = "0";
			}
		}
		catch(NullPointerException e)
		{
			weekSales = "0";
		}
		Map<String,String> map = new HashMap<>();
		map.put("businessCode", businessCode);
		map.put("payDate1", payDate1);
		map.put("payDate2", payDate2);
		List<Map<String,String>> saleList = service.selectSalesDateList(cPage,numPerPage,map);
		List<Map<String,String>> salePriceList = service.selectSalePriceList(cPage,numPerPage,map);
		int saleCount = service.selectSaleDateCount(map);
		logger.debug("saleCount"+saleCount);
		logger.debug("saleList"+saleList.size());
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("salePriceList",salePriceList);
		mv.addObject("monthSales",monthSales);
		mv.addObject("yearSales",yearSales);
		mv.addObject("todaySales",todaySales);
		mv.addObject("saleList",saleList);
		mv.addObject("saleCount",saleCount);
		mv.addObject("businessCode",businessCode);
		mv.addObject("pageBar",PagingFactory.getPageBar4(saleCount, cPage, numPerPage, "/food/owner/selectStoreSalesEnd.do?businessCode="+businessCode+"&payDate1="+payDate1+"&payDate2="+payDate2));
		mv.setViewName("owner/ownerDateSales");
		return mv;
	}
	
	//상품별 매출 화면
	@RequestMapping("owner/selectStoreGoodsSales.do")
	public ModelAndView selectStoreGoodsSales(@RequestParam(value="cPage",required=false,defaultValue="0") int cPage,String businessCode)
	{
		int numPerPage = 10;
		int businessCode1 = Integer.valueOf(businessCode); 
		logger.debug("bucODE"+businessCode1);
		ModelAndView mv = new ModelAndView();
		
		List<Map<String,String>> category = menuService.selectMenuCategory(businessCode);
		List<Map<String,String>> menuList = menuService.selectMenuList(businessCode);
		List<Map<String,String>> goodsList = orderService.selectGoodsOrderList(cPage,numPerPage,businessCode);
		int goodsCount = orderService.selectGoodsCount(businessCode1);
		String todaySales = "";
		String monthSales ="";
		String yearSales = "";
		String weekSales = "";
		try {
			todaySales = service.selectTodaySales(businessCode);
			if(todaySales.equals(""))
			{
				todaySales = "0";
			}
		}
		catch(NullPointerException e)
		{
			todaySales = "0";
		}
		try {
			monthSales = service.selectMonthSales(businessCode);
			if(monthSales.equals(""))
			{
				todaySales = "0";
			}
		}catch(NullPointerException e)
		{
			monthSales = "0";
		}
		try {
			yearSales = service.selectYearSales(businessCode);
			if(yearSales.equals(""))
			{
				todaySales = "0";
			}
		}catch(NullPointerException e)
		{
			yearSales = "0";
		}
		try {
			weekSales = service.selectWeekSales(businessCode);
			if(weekSales.equals(""))
			{
				weekSales = "0";
			}
		}
		catch(NullPointerException e)
		{
			weekSales = "0";
		}
		logger.debug("today"+todaySales);
		logger.debug("monthSales"+monthSales);
		logger.debug("yearSales"+yearSales);
		logger.debug("goodsList"+goodsList);
		mv.addObject("menuList",menuList);
		mv.addObject("category",category);
		mv.addObject("monthSales",monthSales);
		mv.addObject("yearSales",yearSales);
		mv.addObject("todaySales",todaySales);
		mv.addObject("oderCount",goodsCount);
		mv.addObject("businessCode",businessCode1);
		mv.addObject("goodsList",goodsList);
		mv.addObject("pageBar",PagingFactory.getPageBar4(goodsCount, cPage, numPerPage, "/food/owner/selectStoreGoodsSales.do?businessCode="+businessCode1));
		mv.setViewName("owner/ownerGoodsSales");
		
		return mv;
	}
	
	//메뉴 선택 카테고리 ajax
	@RequestMapping("owner/selectCaMenuList.do")
	@ResponseBody
	public List selectCaMenuList(int menuCategorycode,HttpServletResponse response) throws IOException {
		
		logger.debug("menu"+menuCategorycode);
		List menuList1 = service.selectCaMenuList(menuCategorycode);
		logger.debug("me"+menuList1);
		/*response.getWriter().println(menuList1);*/
		return menuList1;
	}
	
	
	//선택한 메뉴 카테고리와 메뉴로 리스트 가져오기
	@RequestMapping("owner/selectStoreGoodsSalesEnd.do")
	public ModelAndView selectStoreGoodsSalesEnd(@RequestParam(value="cPage",required=false,defaultValue="0") int cPage,String menuCategory1,String menuCategory2,String businessCode)
	{
		int numPerPage = 10;	
		List<Map<String,String>> category = menuService.selectMenuCategory(businessCode);
		List<Map<String,String>> menuList = menuService.selectMenuList(businessCode);
		
		
		String todaySales = "";
		String monthSales ="";
		String yearSales = "";
		String weekSales = "";
		try {
			todaySales = service.selectTodaySales(businessCode);
			if(todaySales.equals(""))
			{
				todaySales = "0";
			}
		}
		catch(NullPointerException e)
		{
			todaySales = "0";
		}
		try {
			monthSales = service.selectMonthSales(businessCode);
			if(monthSales.equals(""))
			{
				todaySales = "0";
			}
		}catch(NullPointerException e)
		{
			monthSales = "0";
		}
		try {
			yearSales = service.selectYearSales(businessCode);
			if(yearSales.equals(""))
			{
				todaySales = "0";
			}
		}catch(NullPointerException e)
		{
			yearSales = "0";
		}
		try {
			weekSales = service.selectWeekSales(businessCode);
			if(weekSales.equals(""))
			{
				weekSales = "0";
			}
		}
		catch(NullPointerException e)
		{
			weekSales = "0";
		}
		Map<String,String> map = new HashMap<>();
		map.put("menuCategoryCode", menuCategory1);
		map.put("menuCode", menuCategory2);
		map.put("businessCode", businessCode);
		logger.debug("menu"+menuCategory1 + "menu2"+menuCategory2 + "BU" + businessCode);
		List<Map<String,String>> list = service.menuCateList(cPage,numPerPage,map);
		int menuCount = service.selectMenuCount(map);
		logger.debug("list"+list.size());
		logger.debug("menuCount"+menuCount);
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("monthSales",monthSales);
		mv.addObject("yearSales",yearSales);
		mv.addObject("todaySales",todaySales);
		mv.addObject("menuCount",menuCount);
		mv.addObject("list",list);
		mv.addObject("menuList",menuList);
		mv.addObject("category",category);
		mv.addObject("businessCode",businessCode);
		mv.setViewName("owner/ownerGoodsList");
		mv.addObject("pageBar",PagingFactory.getPageBar4(menuCount, cPage, numPerPage, "/food/owner/selectStoreGoodsSalesEnd.do?businessCode="+businessCode+"&menuCategory1="+menuCategory1+"&menuCategory2="+menuCategory2));
		return mv;
		
	}
}
