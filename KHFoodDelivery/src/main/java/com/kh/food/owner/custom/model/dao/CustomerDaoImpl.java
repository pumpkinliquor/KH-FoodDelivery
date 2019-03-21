package com.kh.food.owner.custom.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CustomerDaoImpl implements CustomerDao {

	@Autowired
	SqlSessionTemplate session;
	
	@Override
	public List<Map<String, String>> selectQnaList() {
		return session.selectList("oneVSone.oneVSoneList");
	}

	@Override
	public List<Map<String, String>> selectNoticeList() {
		return session.selectList("ownerMember.ownerNoticeList");
	}

	@Override
	public int storeFormEnd(Map<String, Object> store) {
		return session.insert("store.addStore", store);
	}

	@Override
	public int insertMark(Map<String, Object> map) {
		return session.insert("store.insertMark", map);
	}

	@Override
	public int deleteMark(Map<String, Object> map) {
		return session.delete("store.deleteMark", map);
	}
}
