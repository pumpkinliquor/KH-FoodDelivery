package com.kh.food.customer.member.model.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.food.customer.member.model.dao.MemberDao;
import com.kh.food.customer.member.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService {

	

	@Autowired
	MemberDao dao;
	
	@Override
	public int selectMember(int memberNum) {
		// TODO Auto-generated method stub
		return dao.selectMember(memberNum);
	}
	
	@Override
	public int memberEnroll(Member m) {
		
		return dao.memberEnroll(m);
	}
	
	@Override
	public int checkId(String memberId) {
		return dao.checkId(memberId);
	}
	
	@Override
	public int checkNick(String nickName) {
		return dao.checkNick(nickName);
	}

	@Override
	public Map<String,String> login(Map<String,String> map){
		return dao.login(map);
	}

	
	
}
