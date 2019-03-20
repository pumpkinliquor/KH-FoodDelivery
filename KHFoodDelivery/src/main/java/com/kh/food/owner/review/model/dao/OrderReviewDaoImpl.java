package com.kh.food.owner.review.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.food.owner.store.model.vo.Store;

@Repository
public class OrderReviewDaoImpl implements OrderReviewDao {

	@Autowired
	SqlSessionTemplate session;

	@Override
	public List<Map<String, String>> selectStoreList(String ownerId) {
		return session.selectList("ownerOrder.selectStoreList2",ownerId);
	}

	@Override
	public List<Store> storeList(String ownerId) {
		return session.selectList("store.selectStoreListTwo",ownerId);
	}
	
	
	
	
}
