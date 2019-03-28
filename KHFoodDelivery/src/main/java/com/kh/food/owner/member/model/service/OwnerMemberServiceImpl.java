package com.kh.food.owner.member.model.service;

import java.util.Map;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.kh.food.owner.member.model.dao.OwnerMemberDao;
import com.kh.food.owner.member.model.vo.Owner;

@Service
public class OwnerMemberServiceImpl implements OwnerMemberService {

	@Inject
	private JavaMailSender mailSender;
	
	@Autowired
	OwnerMemberDao dao;
	
	@Override
	public int insertOwner(Owner o){

		return dao.insertOwner(o);
		
	}

	@Override
	public Owner selectLogin(String ownerId) {
		return dao.selectLogin(ownerId);
	}

	@Override
	public Map<String, String> selectSearchId(Map<String, String> map) {
		return dao.selectSearchId(map);
	}
	
	

	@Override
	public int ownerCheckEmail(String ownerEmail) {
		// TODO Auto-generated method stub
		return dao.selectSearchEmail(ownerEmail);
	}

	@Override
	public Map<String, String> selectConfirmIdEmail(Map<String, String> map) {
		return dao.selectConfirmIdEmail(map);
	}

	@Override
	public int updateTempPw(Map<String, String> map) {
		return dao.updateTempPw(map);
	}

	@Override
	public int ownerCheckId(String ownerId) {
		
		return dao.ownerCheckId(ownerId);
	}

	@Override
	public int lastDate(int ownerNum) {
		return dao.lastDate(ownerNum);
	}

	@Override
	public String selectBusiness(String ownerId) {
		return dao.selectBusiness(ownerId);
	}


	
}
