package com.kh.food.owner.review.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.food.owner.review.model.vo.OwnerReview;
import com.kh.food.owner.store.model.vo.Store;

public interface OrderReviewDao {

	List<Map<String, String>> selectStoreList(String ownerId);
	List<Store> storeList(String ownerId);
	List<Map<String, String>> selectReviewList(int stN);
	int insertReviewRe(Map map);
	List<OwnerReview> selectOwnerRevie(int stN);
}
