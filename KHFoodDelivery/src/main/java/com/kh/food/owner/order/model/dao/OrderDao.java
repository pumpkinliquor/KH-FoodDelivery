package com.kh.food.owner.order.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.food.owner.order.model.vo.Pay;

public interface OrderDao {

	List<Pay> selectOrderList();

	List<Map<String,String>> selectPayOrderNum(String payOrderNum);

}
