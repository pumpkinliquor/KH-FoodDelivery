package com.kh.food.admin.model.dao;

import java.util.List;
import java.util.Map;

public interface MemberListDao {

	
	List<Map<String,String>> selectListMember(); //회원 리스트
	List<Map<String,String>> selectListOwner(); //사장 리스트
//	int memberDel(int memberNum);
	Map<String,String>memberOne(int memberNum); //회원 상세보기
	Map<String,String>ownerOne(int businessCode); //사장 상세보기
}
