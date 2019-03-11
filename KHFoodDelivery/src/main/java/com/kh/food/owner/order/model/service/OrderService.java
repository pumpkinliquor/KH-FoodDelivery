package com.kh.food.owner.order.model.service;

import java.util.List;
import java.util.Map;

public interface OrderService {

	List<Map<String, String>> selectOrderList();
	
}
