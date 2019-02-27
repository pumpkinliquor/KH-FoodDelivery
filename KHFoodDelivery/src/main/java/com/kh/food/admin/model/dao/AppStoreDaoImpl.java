package com.kh.food.admin.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AppStoreDaoImpl implements AppStoreDao {
	
	@Autowired
	SqlSessionTemplate session;
	
	@Override
	public int updateStoreConfirm(int no) {
		return session.update("store.updateStoreConfirm", no);
	}

}
