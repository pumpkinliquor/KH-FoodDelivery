package com.kh.food.owner.menu.model.service;

import java.util.List;
import java.util.Map;

import com.kh.food.owner.menu.model.vo.Menu;

public interface MenuService {

	int enrollCategory(Map<String, String> map);

	int insertMenu(Map<String, String> map);

	int deleteCategory(String menuCategory);

	List<Map<String, String>> selectMenuCategory();

	List<Map<String, String>> selectMenuList();

	int updateMenuPrice(Map<String, String> map);

	int deleteMenu(String menuCode);

	Map selectOneMenu(String menuCode);

	int updateMenu(Menu m);

	int updateMenuSoldOut(String menuCode);

	int updateCancleSoldOut(String menuCode);
	
	

}
