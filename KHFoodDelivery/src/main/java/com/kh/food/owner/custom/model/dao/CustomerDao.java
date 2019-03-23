package com.kh.food.owner.custom.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.food.mark.model.vo.Mark;

public interface CustomerDao {
	List<Map<String,String>> selectQnaList();
	List<Map<String,String>> selectNoticeList();
	int storeFormEnd(Map<String,Object> store);
	int insertMark(Map<String,Object> maps);
	int updateMark(Map<String,Object> maps);
	Mark selectMark(Map<String,Object> maps);
}
