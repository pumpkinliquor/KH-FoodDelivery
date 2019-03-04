package com.kh.food.owner.onevsone.model.dao;

import java.util.List;
import java.util.Map;

public interface OnevsOneDao {
	List<Map<String,String>> oneVSoneList();
	List<Map<String,String>> myQnaList(String ownerId);
	Map<String,String> oneVSoneView(int qnaCode);
	int selectOwnerForm(String ownerId);
	int qnaFormEnd(Map<String, Object> qna);
}
