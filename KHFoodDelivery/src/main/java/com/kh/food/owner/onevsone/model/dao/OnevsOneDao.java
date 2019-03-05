package com.kh.food.owner.onevsone.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.food.owner.onevsone.model.vo.OwnerQnaReview;

public interface OnevsOneDao {
	List<Map<String,String>> oneVSoneList();
	List<Map<String,String>> myQnaList(String ownerId);
	Map<String,String> oneVSoneView(int qnaCode);
	int selectOwnerForm(String ownerId);
//	int qnaFormEnd(Map<String, Object> qna);
	List<Map<String,String>> qnaSearch(Map<String,String> map);
	int qnaReviewForm(OwnerQnaReview oqr);
	List<Map<String,String>> commentList(int qnaCode);
	int qnaReviewUpdate(Map<String,Object> reviewUp);
	int qnaReviewDelete(int qnaReviewCode);
}
