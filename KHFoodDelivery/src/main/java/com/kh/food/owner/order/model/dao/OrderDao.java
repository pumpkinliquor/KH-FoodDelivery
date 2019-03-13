package com.kh.food.owner.order.model.dao;

import java.util.List;
import java.util.Map;

public interface OrderDao {

	List<Map<String, String>> selectOrderList();

	List<Map<String,String>> selectPayOrderNum(String payOrderNum);

}
