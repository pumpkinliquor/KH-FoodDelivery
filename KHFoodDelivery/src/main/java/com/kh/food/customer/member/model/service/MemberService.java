package com.kh.food.customer.member.model.service;

import com.kh.food.customer.member.model.vo.Member;

public interface MemberService {

	int memberEnroll(Member m);
	int checkId(String userId);
	
}
