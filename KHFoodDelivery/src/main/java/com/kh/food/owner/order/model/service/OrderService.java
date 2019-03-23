package com.kh.food.owner.order.model.service;

import java.util.List;
import java.util.Map;

import com.kh.food.owner.order.model.vo.Pay;

public interface OrderService {

	List<Pay> selectOrderList(int businessCode1);

	List<Map<String,String>> selectPayOrderNum(String payOrderNum);

	List<Pay> selectOrderOneList(int cPage, int numPerPage, int businessCode1);

	int selectOrderCount(int businessCode1);

	Map<String, String> selectTodayOrderCount(int businessCode1);

	List<Map<String, String>> selectStoreList(String ownerId);

	int updateOrderState(Map<String, String> map);

	Map<String, String> selectPayOne(String payOrderNum);
	
}
