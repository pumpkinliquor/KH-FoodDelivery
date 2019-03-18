package com.kh.food.owner.order.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.food.owner.order.model.dao.OrderDao;
import com.kh.food.owner.order.model.vo.Pay;

@Service
public class OrderServiceImpl implements OrderService {

	@Autowired
	OrderDao dao;

	@Override
	public List<Map<String,String>> selectPayOrderNum(String payOrderNum) {
		return dao.selectPayOrderNum(payOrderNum);
	}

	@Override
	public List<Pay> selectOrderOneList(int cPage, int numPerPage,int businessCode1) {
		return dao.selectOrderOneList(cPage,numPerPage,businessCode1);
	}

	@Override
	public int selectOrderCount(int businessCode1) {
		return dao.selectOrderCount(businessCode1);
	}

	@Override
	public Map<String, String> selectTodayOrderCount(int businessCode1) {
		return dao.selectTodayOrderCount(businessCode1);
	}

	@Override
	public List<Map<String, String>> selectStoreList(String ownerId) {
		return dao.selectStoreList(ownerId);
	}

	@Override
	public List<Pay> selectOrderList(int businessCode) {
		return dao.selectOrderList(businessCode);
	}
	
	

	

	
	
}
