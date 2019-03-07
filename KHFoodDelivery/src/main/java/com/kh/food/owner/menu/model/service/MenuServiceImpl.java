package com.kh.food.owner.menu.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.food.owner.menu.model.dao.MenuDao;
import com.kh.food.owner.menu.model.vo.Menu;

@Service
public class MenuServiceImpl implements MenuService {
	
	@Autowired
	MenuDao dao;

	@Override
	public int enrollCategory(Map<String,String> map) {
		return dao.enrollCategory(map);
	}

	@Override
	public int insertMenu(Menu m) {

		return dao.insertMenu(m);
	}

	@Override
	public int deleteCategory(String menuCategory) {
		return dao.deleteCategory(menuCategory);
	}

	@Override
	public List<Map<String, String>> selectMenuCategory() {
		return dao.selectMenuCategory();
	}

	@Override
	public List<Map<String, String>> selectMenuList() {
		return dao.selectMenuList();
	}
	
	
	
}
