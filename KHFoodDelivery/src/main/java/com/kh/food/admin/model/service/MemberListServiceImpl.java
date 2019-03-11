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
	public List<Map<String,String>> selectListMember()
	{
	return dao.selectListMember();
	}

	//사장 리스트
	@Override
	public List<Map<String, String>> selectListOwner() {
		// TODO Auto-generated method stub
		return dao.selectListOwner();
	}

	//회원 상세보기
	@Override
	public Map<String, String> memberOne(int memberNum) {
		// TODO Auto-generated method stub
		return dao.memberOne(memberNum);
	}

	//사장 상세보기
	@Override
	public Map<String, String> ownerOne(String ownerId) {
		// TODO Auto-generated method stub
		return dao.ownerOne(ownerId);
	}

	
	
	
	

//	@Override
//	public int memberDel(int memberNum) {
//		// TODO Auto-generated method stub
//		return dao.memberDel(memberNum);
//	}
	
	
}
