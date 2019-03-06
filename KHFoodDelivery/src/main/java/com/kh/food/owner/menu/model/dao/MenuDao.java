package com.kh.food.owner.menu.model.dao;

import java.util.Map;

import com.kh.food.owner.menu.model.vo.Menu;

public interface MenuDao {

	int enrollCategory(Map<String, String> map);

	int insertMenu(Menu m);

}
