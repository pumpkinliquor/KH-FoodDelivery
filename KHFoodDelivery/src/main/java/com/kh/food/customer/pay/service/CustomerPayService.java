package com.kh.food.customer.pay.service;

import java.util.List;
import java.util.Map;

import com.kh.food.customer.member.model.vo.WishList;
import com.kh.food.owner.menu.model.vo.Menu;

public interface CustomerPayService {

	Map<String,String> customerPayService(Map<String,String> setPay);
	List<Map<String,String>> payWishList(Map<String, String> setPay);
	int cusomerPayEnd(Map<String, Object> maps);

}
