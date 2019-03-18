package com.kh.food.admin.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.food.owner.store.model.vo.Store;

@Repository
public class AppStoreDaoImpl implements AppStoreDao {
	
	@Autowired
	SqlSessionTemplate session;
	
	// 입점 승인 메소드
	@Override
	public int updateStoreConfirm(int no) {
		return session.update("store.updateStoreConfirm", no);
	}

	// 입점 신청 리스트
	@Override
	public List<Store> selectAppStoreList(int cPage, int numPerPage) {
		RowBounds rb = new RowBounds((cPage - 1) * numPerPage, numPerPage);
		return session.selectList("store.selectAppStoreList", null, rb);
	}

	// 입점 신청 선택하여 모달 띄우기
	@Override
	public Store selectAppStore(int no) {
		return session.selectOne("store.selectAppStore", no);
	}

	// 입점 신청 count
	@Override
	public int appStoreCount() {
		return session.selectOne("store.selectAppStoreCount");
	}	
	
	// 입점 신청 리스트
	@Override
	public List<Store> selectAppStoreList() {
		return session.selectList("store.selectAppStoreList");
	}
	
	// wjsc

	// 전체 리스트
	@Override
	public List<Store> selectStoreList(int cPage, int numPerPage) {
		RowBounds rb = new RowBounds((cPage - 1) * numPerPage, numPerPage);
		return session.selectList("store.selectStoreList", null, rb);
	}

	// 입점 검색
	@Override
	public List<Store> selectSearchStore(Map map, int cPage, int numPerPage) {
		RowBounds rb = new RowBounds((cPage - 1) * numPerPage, numPerPage);
		return session.selectList("store.selectSearchStore", map, rb);
	}

	// 검색 Count
	@Override
	public int selectSearchStoreCount(Map map) {
		return session.selectOne("store.selectSearchStoreCount", map);
	}

	// 입점 Count
	@Override
	public int selectStoreCount() {
		return session.selectOne("store.selectStoreCount");
	}
	
}
