package com.kh.food.customer.member.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.food.customer.member.model.dao.MemberDao;
import com.kh.food.customer.member.model.vo.Member;
import com.kh.food.owner.store.model.vo.Store;

@Service
public class MemberServiceImpl implements MemberService {

	

	@Autowired
	MemberDao dao;
	
	
	@Override
	public List<Store> menuInfo(int businessCode) {
		return dao.menuInfo(businessCode);
	}
	
	@Override
	public int drop(String memberId) {
		return dao.drop(memberId);
	}
	@Override
	public int selectMenuCount() {
		return dao.selectMenuCount();
	}
	
	
	@Override
	public List<Store> selectStore(String category,int cPage,int numPerPage){
		return dao.selectStore(category,cPage,numPerPage);
	}
	
	@Override
	public Member selectMember(String memberId) {
		// TODO Auto-generated method stub
		return dao.selectMember(memberId);
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
	@Override
	public int update(Member m) {
		return dao.update(m);
	}

	
	
}
