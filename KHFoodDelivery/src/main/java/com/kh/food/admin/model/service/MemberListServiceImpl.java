package com.kh.food.admin.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.food.admin.model.dao.MemberListDao;
@Service
public class MemberListServiceImpl implements MemberListService {

	
	@Autowired
	MemberListDao dao;
	
	//회원 리스트
	@Override
	public List<Map<String, String>> selectListMember(int cPage, int numPerPage) {
		// TODO Auto-generated method stub
		return dao.selectListMember(cPage,numPerPage);
	}

	
	
	@Override
	public int memCount() {
		// TODO Auto-generated method stub
		return dao.memCount();
	}




	



	@Override
	public List<Map<String, String>> selectListOwner(int cPage, int numPerPage) {
		// TODO Auto-generated method stub
		return dao.selectListOwner(cPage,numPerPage);
	}

	
	@Override
	public int ownCount() {
		// TODO Auto-generated method stub
		return dao.ownCount();
	}




	//회원 상세보기
	@Override
	public Map<String, String> memberOne(int memberNum) {
		// TODO Auto-generated method stub
		return dao.memberOne(memberNum);
	}
	
	//사장 상세보기
	@Override
	public Map<String, String> ownerOne(int businessCode) {
		// TODO Auto-generated method stub
		return dao.ownerOne(businessCode);
	}

	//회원 삭제
	@Override
	public int memberDel(String[] rowCheck) {
		// TODO Auto-generated method stub
		return dao.memberDel(rowCheck);
	}

	//사장 삭제
	@Override
	public int ownerDel(String[] rowCheck) {
		// TODO Auto-generated method stub
		return dao.ownerDel(rowCheck);
	}

	
}
