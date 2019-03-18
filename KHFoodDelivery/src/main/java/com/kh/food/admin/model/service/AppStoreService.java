package com.kh.food.admin.model.service;

import java.util.List;
import java.util.Map;

import com.kh.food.owner.store.model.vo.Store;

public interface AppStoreService {

	int updateStoreConfirm(int no);										// 입점 승인 메소드
	List<Store> selectAppStoreList(int cPage, int numPerPage);			// 입점 신청 리스트
	Store selectAppStore(int no);										// 입점 신청 선택하여 모달 띄우기
	int appStoreCount();												// 입점 신청 Count
	List<Store> selectAppStoreList();									// 입점 신청 리스트
	List<Store> selectStoreList(int cPage, int numPerPage);				// 전체 리스트
	List<Store> selectSearchStore(Map map, int cPage, int numPerPage);	// 입점 리스트 검색
	int selectSearchStoreCount(Map map);								// 입점 검색 Count
}
