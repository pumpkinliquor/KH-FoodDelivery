package com.kh.food.owner.menu.model.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.food.owner.menu.model.vo.Menu;

@Repository
public class MenuDaoImpl implements MenuDao {

	@Autowired
	SqlSessionTemplate sqlSession;

	@Override
	public int enrollCategory(Map<String,String> menuCategory) {
		// TODO Auto-generated method stub
		return sqlSession.insert("menu.insertCategory",menuCategory);
	}

	@Override
	public int insertMenu(Menu m) {
		return sqlSession.insert("menu.insertMenu",m);
	}
	
	
}
