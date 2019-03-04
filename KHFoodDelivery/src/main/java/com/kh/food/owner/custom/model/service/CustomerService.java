package com.kh.food.owner.custom.model.service;

import java.util.List;
import java.util.Map;

public interface CustomerService {
	List<Map<String,String>> selectQnaList();
	List<Map<String,String>> selectNoticeList();
}
