package com.kh.food.admin.model.service;

import java.util.List;
import java.util.Map;

public interface MemberListService {

	List<Map<String,String>> selectListMember();
	List<Map<String,String>> selectListOwner();
	/*int memberDel(int memberNum);*/
	Map<String,String> memberOne(int memberNum);
}
