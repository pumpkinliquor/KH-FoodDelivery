package com.kh.food.admin.model.dao;

import java.util.List;

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
		return session.selectList("store.selectAppStoreList", rb);
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
}
