package com.kh.food.owner.onevsone.model.service;

import java.util.List;
import java.util.Map;

public interface OnevsOneService {
	List<Map<String,String>> oneVSoneList();
	List<Map<String,String>> myQnaList(String ownerId);
	Map<String,String> oneVSoneView(int qnaCode);
	int selectOwnerForm(String ownerId);
//	int qnaFormEnd(Map<String, Object> qna);
	List<Map<String,String>> qnaSearch(Map<String,String> map);
}
