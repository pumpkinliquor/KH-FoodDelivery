package com.kh.food.owner.menu.model.dao;

import java.util.List;
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

	@Override
	public int deleteCategory(String menuCategory) {
		return sqlSession.delete("menu.deleteCategory",menuCategory);
	}

	@Override
	public List<Map<String, String>> selectMenuCategory() {
		return sqlSession.selectList("menu.selectMenuCategory");
	}

	@Override
	public List<Map<String, String>> selectMenuList() {
		return sqlSession.selectList("menu.selectMenuList");
	}

	@Override
	public int updateMenuPrice(Map<String, String> map) {
		// TODO Auto-generated method stub
		return sqlSession.update("menu.updateMenuPrice",map);
	}

	@Override
	public int deleteMenu(String menuCode) {
		return sqlSession.delete("menu.deleteMenu",menuCode);
	}

	@Override
	public Map selectOneMenu(String menuCode) {
		return sqlSession.selectOne("menu.selectOneMenu",menuCode);
	}

	@Override
	public int updateMenu(Menu m) {
		return sqlSession.update("menu.updateMenu",m);
	}
	
	
}
