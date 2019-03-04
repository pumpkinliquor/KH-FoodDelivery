package com.kh.food.owner.onevsone.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class OnevsOneDaoImpl implements OnevsOneDao {

	@Autowired
	SqlSessionTemplate session;
	
	@Override
	public List<Map<String, String>> oneVSoneList() {
		return session.selectList("oneVSone.oneVSoneList");
	}

}
