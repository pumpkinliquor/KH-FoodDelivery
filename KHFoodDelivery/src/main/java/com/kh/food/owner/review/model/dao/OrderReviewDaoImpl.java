package com.kh.food.owner.review.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.food.owner.review.model.vo.OwnerReview;
import com.kh.food.owner.store.model.vo.Store;
import com.kh.food.review.model.vo.Review;

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

	@Override
	public List<Map<String, String>> selectReviewList(int stN) {
		// TODO Auto-generated method stub
		return session.selectList("store.selectReviewList",stN);
	}

	@Override
	public int insertReviewRe(Map map) {
		
		return session.insert("store.insertReviewRe",map);
	}

	@Override
	public List<OwnerReview> selectOwnerRevie(int stN) {
		
		return session.selectList("store.selectOwnerRevie",stN);
	}
	
	
	
	
}
