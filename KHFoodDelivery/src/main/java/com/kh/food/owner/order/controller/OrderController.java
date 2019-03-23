package com.kh.food.owner.order.controller;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
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
//github.com/pumpkinliquor/KH-FoodDelivery
import com.kh.food.owner.order.model.service.OrderService;
import com.kh.food.owner.order.model.vo.Pay;
import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.request.CancelData;
import com.siot.IamportRestClient.response.AccessToken;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;
import com.siot.IamportRestClient.response.PaymentCancelDetail;

@Controller
public class OrderController {
	IamportClient client;
	private Logger logger = LoggerFactory.getLogger(OrderController.class);
	
	@Autowired
	OrderService service;
	
	//가게 선택 화면 진입
	@RequestMapping("owner/storeChoice.do")
	public ModelAndView selectStoreList(String ownerId)
	{
		List<Map<String,String>> storeList = service.selectStoreList(ownerId);
		ModelAndView mv = new ModelAndView();
		logger.debug("owerId"+ownerId);
		logger.debug("storeList"+storeList);
		mv.addObject("storeList",storeList);
		mv.setViewName("owner/storeChoice1");
		return mv;
	}
	
	
	//주문관리 화면진입
	@RequestMapping("owner/orderService.do")
	public ModelAndView selectOrderList(@RequestParam(value="cPage",required=false,defaultValue="0") int cPage,String businessCode) throws ServletException, IOException
	
	{
		int numPerPage = 5;
		int businessCode1 = Integer.valueOf(businessCode); 
		logger.debug("businessCode"+businessCode);
//		List<Map<String,String>> orderList = service.selectOrderList();
		List<Pay> orderList = service.selectOrderList(businessCode1);
		logger.debug("주문내역"+orderList);
		List<Pay> orderOneList = service.selectOrderOneList(cPage,numPerPage,businessCode1);
		Map<String,String> todayOrderCount = service.selectTodayOrderCount(businessCode1);
		
		int orderCount = service.selectOrderCount(businessCode1);
/*		SimpleDateFormat df = new SimpleDateFormat("yyyyMMdd_HHmmss");
		for(int i = 0; i < orderOneList.size(); i++) {
			orderOneList.get(i).setFormatDate(df.format(orderOneList.get(i).getPayDate()));
		}*/
		
		logger.debug("오늘날짜주문개수"+todayOrderCount);
		logger.debug("주문하나내역"+orderOneList);
		logger.debug("주문내역"+orderList);
		logger.debug("orderCount"+orderCount);
		ArrayList<Pay> list = new ArrayList<>();
		int sum = 0;
		/*logger.debug("사이즈"+orderList.size());*/
		
		ArrayList<Pay> price = new ArrayList<>();
		for(int i=0; i<orderOneList.size(); i++)
		{
			price.add(orderOneList.get(i));
		}
		
		/*logger.debug("orderList"+orderList);*/
		logger.debug("orderOneList"+orderOneList);
		/*logger.debug("price"+price);
		logger.debug("price사이즈"+price.size());*/
		int count = 0;
		for(int i=0; i<price.size(); i++)
		{
			for(int j=count; j<orderList.size(); j++)
			{
				if(orderList.get(j).getPayOrderNum() == price.get(i).getPayOrderNum())
				{
					/*logger.debug("합계전"+sum);
					logger.debug("오더리스트가격"+orderList.get(j).getPrice()+"IIII"+i);*/
					sum = sum + orderList.get(j).getPrice();
					price.get(i).setPrice(sum);
					logger.debug("합계후"+sum);
				}
				else
				{
					/*logger.debug("else문"+i+":::"+j);
					logger.debug("가격"+price.get(i).getPrice());*/
					sum = 0 ;
					count = j;
					break;
				}
			}
		}
		/*logger.debug("가격내역"+price);
		logger.debug("오더리스트"+orderList);*/
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("todayOrderCount",todayOrderCount);
		mv.addObject("orderOneList",orderOneList);
		mv.addObject("orderList",orderList);
		mv.addObject("price",price);
		mv.setViewName("owner/ownerOrderList");
		mv.addObject("pageBar",PagingFactory.getPageBar4(orderCount, cPage, numPerPage, "/food/owner/orderService.do?businessCode="+businessCode1));

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
	
	//주문상태 업데이트
	@RequestMapping("order/updateOrderState.do")
	public void updateOrderState(String payOrderNum,int orderState,HttpServletResponse response) throws IOException
	{
		logger.debug("pay"+payOrderNum + "::: orderState" + orderState);
		
		Map<String,String> map = new HashMap();
		map.put("payOrderNum", payOrderNum);
		map.put("orderState", String.valueOf(orderState));
		int result = service.updateOrderState(map);
		logger.debug("result"+result);
		response.getWriter().print(result);
	}
	
	@RequestMapping("order/updateOrderState1.do")
	public void updateOrderState1(String payOrderNum,int orderState,HttpServletResponse response) throws IOException
	{
		
		String accessToken = null;

		String test_api_key = "1817419586150738";
		String test_api_secret = "Zka426NcWWWm3VRRx1nzLLrmS7bBdXLciWhl24xZ0ul3pdVXfix04YmW5xyjvjwNgN8iRGiSbEWBRRz6";
		client = new IamportClient(test_api_key, test_api_secret);
		
		try {
			IamportResponse<AccessToken> auth_response = client.getAuth();
			accessToken = auth_response.getResponse().getToken();

		} catch (IamportResponseException e) {
			System.out.println(e.getMessage());
			
			switch(e.getHttpStatusCode()) {
			case 401 :
				//TODO
				break;
			case 500 :
				//TODO
				break;
			}
		} catch (IOException e) {
			//서버 연결 실패
			e.printStackTrace();
		}
		
		Map<String,String> payOne = new HashMap<>();
		logger.debug("pay"+payOrderNum + "::: orderState" + orderState);
		int result = 0;
		Map<String,String> map = new HashMap();
		map.put("payOrderNum", payOrderNum);
		map.put("orderState", String.valueOf(orderState));
		try {
		 result = service.updateOrderState(map);
		 payOne = service.selectPayOne(payOrderNum);
		 logger.debug("payOne"+payOne);
		 
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		
		String imp_uid = payOne.get("IMPID");
		CancelData cancel_data = new CancelData(imp_uid, true); //imp_uid를 통한 전액취소
		
		try {
			IamportResponse<Payment> payment_response = client.cancelPaymentByImpUid(cancel_data);
			logger.debug(payment_response.getMessage());
			
		} catch (IamportResponseException e) {
			System.out.println(e.getMessage());
			
			switch(e.getHttpStatusCode()) {
			case 401 :
				//TODO
				break;
			case 500 :
				//TODO
				break;
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		logger.debug("result"+result);
		response.getWriter().print(result);
	}
	
	@RequestMapping("owner/payRefund.do")
	public void testCancelPaymentAlreadyCancelledImpUid() {
		String accessToken = null;

		String test_api_key = "1817419586150738";
		String test_api_secret = "Zka426NcWWWm3VRRx1nzLLrmS7bBdXLciWhl24xZ0ul3pdVXfix04YmW5xyjvjwNgN8iRGiSbEWBRRz6";
		client = new IamportClient(test_api_key, test_api_secret);
		
		try {
			IamportResponse<AccessToken> auth_response = client.getAuth();
			accessToken = auth_response.getResponse().getToken();

		} catch (IamportResponseException e) {
			System.out.println(e.getMessage());
			
			switch(e.getHttpStatusCode()) {
			case 401 :
				//TODO
				break;
			case 500 :
				//TODO
				break;
			}
		} catch (IOException e) {
			//서버 연결 실패
			e.printStackTrace();
		}
		
		
		String imp_uid = "imp_767449340705";
		CancelData cancel_data = new CancelData(imp_uid, true); //imp_uid를 통한 전액취소
		logger.debug("dd"+cancel_data);
		
		try {
			IamportResponse<Payment> payment_response = client.cancelPaymentByImpUid(cancel_data);
			logger.debug(payment_response.getMessage());
			
		} catch (IamportResponseException e) {
			System.out.println(e.getMessage());
			
			switch(e.getHttpStatusCode()) {
			case 401 :
				//TODO
				break;
			case 500 :
				//TODO
				break;
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
		
}
