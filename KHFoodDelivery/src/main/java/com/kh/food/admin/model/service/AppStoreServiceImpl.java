package com.kh.food.admin.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.food.admin.model.dao.AppStoreDao;
import com.kh.food.owner.store.model.vo.Store;

@Service
public class AppStoreServiceImpl implements AppStoreService{

	@Autowired
	AppStoreDao dao;
	
	// 입점 승인 메소드
	@Override
	public int updateStoreConfirm(int no) {
		return dao.updateStoreConfirm(no);
	}

	// 입점 신청 리스트
	@Override
	public List<Store> selectAppStoreList() {
		return dao.selectAppStoreList();
	}
	
	// 입점 신청 선택하여 모달 띄우기
	@Override
	public Store selectAppStore(int no) {
		return dao.selectAppStore(no);
	}	
}
