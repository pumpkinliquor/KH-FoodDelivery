package com.kh.food.admin.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.food.admin.model.dao.AppStoreDao;

@Service
public class AppStoreServiceImpl implements AppStoreService{

	@Autowired
	AppStoreDao dao;
	
	// 입점 승인 메소드
	@Override
	public int updateStoreConfirm(int no) {
		return dao.updateStoreConfirm(no);
	}
}
