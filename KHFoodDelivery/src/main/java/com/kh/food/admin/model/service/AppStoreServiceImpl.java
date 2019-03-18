package com.kh.food.admin.model.service;

import java.util.List;
import java.util.Map;

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
	public List<Store> selectAppStoreList(int cPage, int numPerPage) {
		return dao.selectAppStoreList(cPage, numPerPage);
	}
	
	// 입점 신청 선택하여 모달 띄우기
	@Override
	public Store selectAppStore(int no) {
		return dao.selectAppStore(no);
	}

	// 입점 신청 count
	@Override
	public int appStoreCount() {
		return dao.appStoreCount();
	}

	// 입점 신청 리스트
	@Override
	public List<Store> selectAppStoreList() {
		return dao.selectAppStoreList();
	}

	// 전체 리스트
	@Override
	public List<Store> selectStoreList(int cPage, int numPerPage) {
		return dao.selectStoreList(cPage, numPerPage);
	}

	// 입점 검색
	@Override
	public List<Store> selectSearchStore(Map map, int cPage, int numPerPage) {
		return dao.selectSearchStore(map, cPage, numPerPage);
	}

	// 검색 Count
	@Override
	public int selectSearchStoreCount(Map map) {
		return dao.selectSearchStoreCount(map);
	}

	// 입점 Count
	@Override
	public int selectStoreCount() {
		return dao.selectStoreCount();
	}		
}
