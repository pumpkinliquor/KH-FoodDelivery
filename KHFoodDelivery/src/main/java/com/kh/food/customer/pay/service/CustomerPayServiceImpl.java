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
	@Override
	public int cusomerPayEnd(Map<String, Object> maps) {
		// TODO Auto-generated method stub
		return dao.customerPayEnd(maps);
	}
	@Override
	public List<Map<String, String>> selectWishList(String memberId) {
		return dao.selectWishList(memberId);
	}
	@Override
	public int insertPay(Map<String, String> map) {
		return dao.insertPay(map);
	}
	@Override
	public int insertPay2(Map<String, String> map) {
		return dao.insertPay2(map);
	}
	@Override
	public int deleteWishList(String memberId) {
		// TODO Auto-generated method stub
		return dao.deleteWishList(memberId);
	}
	@Override
	public Map<String, String> selectOnePay() {
		return dao.selectOnePay();
	}
	
	
	//결제 후 장바구니 삭제
	
	
	
}
