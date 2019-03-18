package com.kh.food.owner.menu.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.food.owner.menu.model.vo.Menu;

public interface MenuDao {

	int enrollCategory(Map<String, String> map);

	int insertMenu(Map<String, String> map);

	int deleteCategory(String menuCategory);

	List<Map<String, String>> selectMenuCategory(String businessCode);

	List<Map<String, String>> selectMenuList(String businessCode);

	int updateMenuPrice(Map<String, String> map);

	int deleteMenu(String menuCode);

	Map selectOneMenu(String menuCode);

	int updateMenu(Menu m);

	int updateMenuSoldOut(String menuCode);

	int updateCancleSoldOut(String menuCode);

}
