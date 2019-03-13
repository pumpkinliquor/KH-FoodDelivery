package com.kh.food.admin.model.service;

import java.util.List;
import java.util.Map;

public interface MemberListService {

	List<Map<String,String>> selectListMember(); //회원 리스트
	int memCount();
	
	List<Map<String,String>> selectListOwner(); //사장님 리스트
	int ownCount();
	/*int memberDel(int memberNum);*/
	Map<String,String> memberOne(int memberNum); //회원 상세보기
	Map<String,String> ownerOne(int businessCode); //사장님 상세보기
	int memberDel(String[] rowCheck); //회원삭제
	int ownerDel(String[] rowCheck);
}
