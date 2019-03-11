package com.kh.food.owner.order.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.food.owner.order.model.dao.OrderDao;

@Service
public class OrderServiceImpl implements OrderService {

	@Autowired
	OrderDao dao;

	@Override
	public List<Map<String, String>> selectOrderList() {
		return dao.selectOrderList();
	}
	
	
}
