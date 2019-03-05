package com.kh.food.customer.member.model.dao;

import com.kh.food.customer.member.model.vo.Member;

public interface MemberDao {

	int memberEnroll(Member m);
	int checkId(String userId);
}
