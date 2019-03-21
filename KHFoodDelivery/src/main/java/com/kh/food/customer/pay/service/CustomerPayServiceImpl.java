package com.kh.food.customer.pay.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.food.customer.member.model.vo.WishList;
import com.kh.food.customer.pay.model.dao.CustomerPayDao;
import com.kh.food.owner.menu.model.vo.Menu;





@Service
public class CustomerPayServiceImpl implements CustomerPayService {

	@Autowired
	CustomerPayDao dao;
	@Override
	public Map<String,String> customerPayService(Map<String,String> setPay) {
		// TODO Auto-generated method stub
		return dao.customerPayDao(setPay);
	}
	@Override
	public List<Map<String,String>> payWishList(Map<String, String> setPay) {
		return dao.payWishList(setPay);
	}
	
}
