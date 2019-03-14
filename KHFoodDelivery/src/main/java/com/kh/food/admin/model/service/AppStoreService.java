package com.kh.food.admin.model.service;

import java.util.List;

import com.kh.food.owner.store.model.vo.Store;

public interface AppStoreService {

	int updateStoreConfirm(int no);			// 입점 승인 메소드
	List<Store> selectAppStoreList();		// 입점 신청 리스트
	Store selectAppStore(int no);			// 입점 신청 선택하여 모달 띄우기
	int appStoreCount();					// 입점 신청 Count
}
