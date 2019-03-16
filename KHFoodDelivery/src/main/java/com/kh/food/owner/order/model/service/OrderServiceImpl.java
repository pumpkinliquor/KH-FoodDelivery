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
	public List<Pay> selectOrderList() {
		return dao.selectOrderList();
	}

	@Override
	public List<Map<String,String>> selectPayOrderNum(String payOrderNum) {
		return dao.selectPayOrderNum(payOrderNum);
	}

	@Override
	public List<Pay> selectOrderOneList(int cPage, int numPerPage) {
		return dao.selectOrderOneList(cPage,numPerPage);
	}

	@Override
	public int selectOrderCount() {
		return dao.selectOrderCount();
	}

	

	
	
}
