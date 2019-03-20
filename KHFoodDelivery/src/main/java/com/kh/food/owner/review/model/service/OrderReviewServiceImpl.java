package com.kh.food.owner.review.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.food.owner.review.model.dao.OrderReviewDao;
import com.kh.food.owner.store.model.vo.Store;

@Service
public class OrderReviewServiceImpl implements OrderReviewService {

	@Autowired
	OrderReviewDao dao;
	
	@Override
	public List<Map<String, String>> selectStoreList(String ownerId) {
		return dao.selectStoreList(ownerId);
	}

	@Override
	public List<Store> storeList(String ownerId) {
		
		return dao.storeList(ownerId);
	}

	
	
}
