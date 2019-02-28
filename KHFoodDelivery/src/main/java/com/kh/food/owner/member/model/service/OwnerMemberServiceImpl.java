package com.kh.food.owner.member.model.service;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.kh.food.common.MailHandler;
import com.kh.food.common.TempKey;
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

	
}
