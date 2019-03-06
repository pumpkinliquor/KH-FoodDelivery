package com.kh.food.owner.menu.model.service;

import java.util.Map;

import com.kh.food.owner.menu.model.vo.Menu;

public interface MenuService {

	int enrollCategory(Map<String, String> map);

	int insertMenu(Menu m);

}
