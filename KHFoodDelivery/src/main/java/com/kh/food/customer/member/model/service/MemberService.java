package com.kh.food.customer.member.model.service;

import java.util.Map;

import com.kh.food.customer.member.model.vo.Member;

public interface MemberService {

	int memberEnroll(Member m);
	int checkId(String memberId);
	Map<String,String> login(Map<String,String> map);
	int checkNick(String nickName);
	int selectMember(int memberNum);
}
