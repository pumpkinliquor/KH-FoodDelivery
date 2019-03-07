package com.kh.food.owner.menu.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.food.owner.menu.model.vo.Menu;

public interface MenuDao {

	int enrollCategory(Map<String, String> map);

	int insertMenu(Menu m);

	int deleteCategory(String menuCategory);

	List<Map<String, String>> selectMenuCategory();

	List<Map<String, String>> selectMenuList();

}
