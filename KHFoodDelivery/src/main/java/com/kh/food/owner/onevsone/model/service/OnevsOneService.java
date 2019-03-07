package com.kh.food.owner.onevsone.model.service;

import java.util.List;
import java.util.Map;

import com.kh.food.owner.onevsone.model.vo.OwnerQnaReview;

public interface OnevsOneService {
	List<Map<String,String>> oneVSoneList();
	List<Map<String,String>> myQnaList(String ownerId);
	Map<String,String> oneVSoneView(int qnaCode);
	List<Map<String,String>> qnaSearch(Map<String,String> map);
	int qnaReviewForm(OwnerQnaReview oqr);
	List<Map<String,String>> commentList(int qnaCode);
	int qnaReviewUpdate(Map<String,Object> reviewUp);
	int qnaReviewDelete(int qnaReviewCode);
}
