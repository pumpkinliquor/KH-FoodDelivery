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
	
	@Override
	public List<Map<String,String>> selectListMember()
	{
	return dao.selectListMember();
	}
}
