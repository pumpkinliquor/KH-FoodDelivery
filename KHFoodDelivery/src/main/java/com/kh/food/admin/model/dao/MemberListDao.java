package com.kh.food.admin.model.dao;

import java.util.List;
import java.util.Map;

public interface MemberListDao {

	
	List<Map<String,String>> selectListMember();
	List<Map<String,String>> selectListOwner();
//	int memberDel(int memberNum);
}
