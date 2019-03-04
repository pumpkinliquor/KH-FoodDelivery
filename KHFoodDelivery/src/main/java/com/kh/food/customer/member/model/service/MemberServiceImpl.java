package com.kh.food.customer.member.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.food.customer.member.model.dao.MemberDao;
import com.kh.food.customer.member.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	MemberDao dao;
	
	@Override
	public int memberEnroll(Member m) {
		
		return dao.memberEnroll(m);
	}

	
	
}
