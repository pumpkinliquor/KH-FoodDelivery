package com.kh.food.admin.model.service;

import java.util.List;

import com.kh.food.owner.store.model.vo.Store;

public interface AppStoreService {

	int updateStoreConfirm(int no);			// 입점 승인 메소드
	List<Store> appStoreList();				// 입점 신청 리스트
}
