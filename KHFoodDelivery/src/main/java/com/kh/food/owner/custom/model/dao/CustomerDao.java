package com.kh.food.owner.custom.model.dao;

import java.util.List;
import java.util.Map;

public interface CustomerDao {
	List<Map<String,String>> selectQnaList();
	List<Map<String,String>> selectNoticeList();
}
